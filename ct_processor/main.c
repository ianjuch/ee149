#include <msp430.h>
//#include <legacymsp430.h>
#include <stdint.h>
#include <legacymsp430.h>


void init();
void delay_ms();
void spiInit();
void uartInit();
void uartWriteByte(unsigned char);
void print(unsigned int);
uint16_t cap_meas(int pad);
uint16_t scan_pad(int pad);
void stabilize_baselines();
void update_baselines();
void capTouchInit();
void timerA1init();
void stop_timer_A();

uint32_t baselines[10];
uint16_t recents[10];
uint16_t variances[10];

volatile uint8_t scrollValue;
volatile uint8_t pushedButton;
int8_t txButton;

#define FILTER_LENGTH 16

int i = 0;

int lastTouchLocation = -1;

int main(void)
{
    
    init();
    //delay_ms(500);
    
    stabilize_baselines();
    
    unsigned char touchDetected = 0;
    
    while(1)
    {
        
        // Measure capacitance on each pad
        for (int i = 0; i < 10; i++)
        {
            recents[i] = scan_pad(i);
        }
        
        int strongest = -1;
        int strongestLocation = -1;
        
        // Look for a touch
        for (int i = 0; i < 7; i++)
        {
            if (recents[i] < (baselines[i]/FILTER_LENGTH) - 4 *((variances[i]/FILTER_LENGTH)+2))
            {
                touchDetected = 1;
                if (strongest == -1 || recents[i]/((baselines[i]/FILTER_LENGTH)/16) < strongest)
                {
                    strongest = recents[i]/((baselines[i]/FILTER_LENGTH)/16); // Normalize value
                    strongestLocation = i;
                }
            }
        }
        
        if (strongest != -1)
        {
            scrollValue = strongestLocation;
        }
        else
        {
            scrollValue = 0xFF;
        }
        
        
        for (int i = 7; i < 10; i++)
        {
            
            if (recents[i] < (baselines[i]/FILTER_LENGTH) - 6*((variances[i]/FILTER_LENGTH)+2))
            {
                pushedButton = i-7+1;
                touchDetected = 1;
            }
        }
        
        //print(0xFFFF);
        //print(scrollValue);
        print(baselines[0]/FILTER_LENGTH);
        print(baselines[1]/FILTER_LENGTH);
        print(baselines[2]/FILTER_LENGTH);
        print(baselines[3]/FILTER_LENGTH);
        print(baselines[4]/FILTER_LENGTH);
        
        /*
        
        print(variances[0]/FILTER_LENGTH);
        print(variances[1]/FILTER_LENGTH);
        print(variances[2]/FILTER_LENGTH);
        print(variances[3]/FILTER_LENGTH);
        print(variances[4]/FILTER_LENGTH);
        */
        
        print(recents[0]);
        print(recents[1]);
        print(recents[2]);
        print(recents[3]);
        print(recents[4]);
        

        if (!touchDetected)
            update_baselines();
        
        
        //pushedButton = 1;
    }
    
    return 0;
    
}

interrupt(USCIAB0TX_VECTOR) spiTxBufferEmptyISR()
{
    if (txButton)
    {
        UCB0TXBUF = 0x80|pushedButton;
        pushedButton = 0;
    }
    else
    {
        UCB0TXBUF = 0x7F&scrollValue;
    }
    
    txButton = !txButton;
}

void stabilize_baselines()
{
    for (uint16_t j = 0; j < FILTER_LENGTH; j++)
    {
        for (uint16_t i = 0; i < 10; i++)
        {
            baselines[i] += scan_pad(i);
        }
    }
    for (uint16_t j = 0; j < FILTER_LENGTH; j++)
    {
        for (uint16_t i = 0; i < 10; i++)
        {
            uint16_t capacitance = scan_pad(i);
            if (capacitance > baselines[i]/FILTER_LENGTH)
            {
                variances[i] += capacitance - baselines[i]/FILTER_LENGTH;
            }
            else
            {
                variances[i] += baselines[i]/FILTER_LENGTH - capacitance;
            }
            
            //update baseline
            baselines[i] -= baselines[i]/FILTER_LENGTH;
            baselines[i] += capacitance;
        }
    }
}

void update_baselines()
{
    for (uint16_t i = 0; i < 10; i++)
    {
        variances[i] -= variances[i]/FILTER_LENGTH;
        
        if (recents[i] > baselines[i]/FILTER_LENGTH)
        {
            variances[i] += recents[i] - baselines[i]/FILTER_LENGTH;
        }
        else
        {
            variances[i] += baselines[i]/FILTER_LENGTH - recents[i];
        }
        
        baselines[i] -= baselines[i]/FILTER_LENGTH;
        baselines[i] += recents[i];
    }
}

void init(void)
{
    WDTCTL = WDTPW+WDTHOLD;
    
    // Set clock to 16 MHz
    DCOCTL = 0;
    BCSCTL1 = CALBC1_16MHZ;
    DCOCTL = CALDCO_16MHZ;
    
    spiInit();
    uartInit();
    capTouchInit();
    timerA1init();
    
    // Globally enable interrupts
    _BIS_SR(GIE);
}

void spiInit()
{
    // Connect clock pin
    P1SEL |= BIT5;
    P1SEL2 |= BIT5;
    
    // Connect MISO
    P1SEL |= BIT6;
    P1SEL2 |= BIT6;
    
    // Connect MOSI
    P1SEL |= BIT7;
    P1SEL2 |= BIT7;
    
    // Connect STE
    P1SEL |= BIT4;
    P1SEL2 |= BIT4;
    
    UCB0CTL0 |= UCSYNC|UCMODE1;
    UCB0CTL1 |= UCSWRST;
    UCB0CTL1 &= ~UCSWRST;
    
    IE2 |= UCB0TXIE;
}

void uartInit()
{
    // Set up IO pins (P1.1 = RXD, P1.2 = TXD)
    P1SEL |= BIT2|BIT1;
    P1SEL2 |= BIT2|BIT1;
    
    //set reset
    UCA0CTL1 |= UCSWRST;
    
    // 9600 baud at 1 MHz
    //UCA0BR0 = 104;
    //UCA0BR1 = 0;
    UCA0BR0 = 1666&0x00FF;
    UCA0BR1 = 1666>>8;
    UCA0MCTL |= UCBRS2|UCBRS1;
    //UCBRSA0 = 0;
    //UCBRFA0 = 0;
    
    // other
    // Select SMCLK
    UCA0CTL1 |= UCSSEL0|UCSSEL1|UCSWRST;
    
    //clear reset
    UCA0CTL1 &= ~UCSWRST;
    
    //data goes in UCA0TXBUF
    //(IFG2&UCA0TXIFG) 1 when empty
}

void uartWriteByte(unsigned char byte)
{
    UCA0TXBUF = byte;
    while (!(IFG2 & UCA0TXIFG))
    {
        __asm__("nop");
    }
}


void capTouchInit()
{
    // Set all cap touch pins to GPIO outputs, low
    P3SEL &= ~(BIT0|BIT2|BIT3|BIT4);
    P3SEL2 &= ~(BIT0|BIT2|BIT3|BIT4);
    P3DIR |= BIT0|BIT2|BIT3|BIT4;
    P3OUT &= ~(BIT0|BIT2|BIT3|BIT4);
    
    P2SEL &= ~(BIT0|BIT1|BIT2|BIT3|BIT6|BIT7);
    P2SEL2 &= ~(BIT0|BIT1|BIT2|BIT3|BIT6|BIT7);
    P2DIR |= BIT0|BIT1|BIT2|BIT3|BIT6|BIT7;
    P2OUT &= ~(BIT0|BIT1|BIT2|BIT3|BIT6|BIT7);
    
    // Connect Timer A input to pin oscillator
    TA0CTL |= TASSEL0|TASSEL1;
    // Enable Timer A interrupt
    //TA0CTL |= TAIE;
}

void timerA1init()
{
    // Select SMCLK
    TA1CTL |= TASSEL1;
    
    // Select input divider: 00:1 10:2 01:4 11:8
    
    // Enable interrupt
    TA1CTL |= TAIE;
    
    // Set max value
    TA1CCR0 = 0x0FFF;
}

void inline start_timer_A1()
{
    // Clear timer
    TA1R = 0;
    // Set up mode
    TA1CTL |= MC0;
    
}

interrupt(TIMER1_A1_VECTOR) timer1A1_ISR()
{
    stop_timer_A();
    
    //stop timer A1
    TA1CTL &= ~MC0;
    
}

void inline start_timer_A()
{
    // Start Timer A in continuous mode
    TA0CTL |= MC1;
}

void inline stop_timer_A()
{
    // Disable Timer A (must be in continuous mode)
    TA0CTL &= ~MC1;
}

void inline reset_timer_A()
{
    TA0R = 0;
}

uint16_t inline timer_A_value()
{
    return TAR;
}

void print(unsigned int val)
{
    char bytes[5];
    
    for (int i = 0; i < 5; i++)
    {
        bytes[4-i] = val%10+'0';
        val = val/10;
    }
    
    for (int i = 0; i < 5; i++)
    {
        uartWriteByte(bytes[i]);
        delay_ms(40);
    }
    uartWriteByte('\n');
}

uint16_t cap_meas(int pad)
{
    stop_timer_A();
    reset_timer_A();
    start_timer_A();
    //start_timer_A1();
    
    for (int i = 0; i < 16; i++)
    {
        delay_ms(1);
        delay_ms(1);
        
    }
    
    //wait for timer A1 to stop

    return timer_A_value();
}

uint16_t scan_pad(int pad)
{
    uint16_t value = 0;
    switch (pad) {
        case 0:
            P2SEL2 |= BIT6;
            value = cap_meas(0);
            P2SEL2 &= ~BIT6;
            break;
        case 1:
            P2SEL2 |= BIT7;
            value = cap_meas(1);
            P2SEL2 &= ~BIT7;
            break;
        case 2:
            P3SEL2 |= BIT4;
            value = cap_meas(2);
            P3SEL2 &= ~BIT4;
            break;
        case 3:
            P2SEL2 |= BIT3;
            value = cap_meas(3);
            P2SEL2 &= ~BIT3;
            break;
        case 4:
            P3SEL2 |= BIT0;
            value = cap_meas(4);
            P3SEL2 &= ~BIT0;
            break;
        case 5:
            P2SEL2 |= BIT0;
            value = cap_meas(5);
            P2SEL2 &= ~BIT0;
            break;
        case 6:
            P2SEL2 |= BIT1;
            value = cap_meas(6);
            P2SEL2 &= ~BIT1;
            break;
        case 7:
            P2SEL2 |= BIT2;
            value = cap_meas(7);
            P2SEL2 &= ~BIT2;
            break;
        case 8:
            P3SEL2 |= BIT2;
            value = cap_meas(8);
            P3SEL2 &= ~BIT2;
            break;
        case 9:
            P3SEL2 |= BIT3;
            value = cap_meas(9);
            P3SEL2 &= ~BIT3;
            break;
            
        default:
            break;
    }
    return value;
}

void delay_ms(int d)
{
    int i;
    for (i = 0; i < d; i++)
        __delay_cycles(1000);
}
