#include <msp430.h>
#include <legacymsp430.h>
//#include <stdint.h>


#define LED_T_L 0x6
#define LED_T_M 0xc
#define LED_T_R 0xe
#define LED_L_0 0x2
#define LED_L_1 0x3
#define LED_L_2 0x4
#define LED_L_3 0x5
#define LED_L_4 0x8
#define LED_L_5 0x7
#define LED_R_0 :( - Not connected
#define LED_R_1 0x9
#define LED_R_2 0xa
#define LED_R_3 0xb
#define LED_R_4 0xd
#define LED_R_5 0xf

#define LEFT_LEDS 0x01
#define RIGHT_LEDS 0x02

void init();
void delay_ms();
void i2cWriteByte(unsigned char, unsigned char, unsigned char);
unsigned char spiReadByte();
void spiInit();
void i2cInit();
void fadeButtonsOff();
void ledOn(unsigned char ledAddr);
void ledOff(unsigned char ledAddr);
void initComparator();
void timerA0init();
void timerA1init();
inline void triggerTRIAC(unsigned char triacNumber);
void updateDisplayAndTRIACS(unsigned char channel, unsigned char value);

void TRIACinit();
void setTRIAC(unsigned char channel, unsigned char value);
void setLedDisplay(unsigned char value, unsigned char side);

unsigned char LED_T_L_value;
unsigned char LED_T_M_value;
unsigned char LED_T_R_value;

unsigned char LED_L[5] = {LED_L_1,LED_L_2,LED_L_3,LED_L_4,LED_L_5};
unsigned char LED_R[5] = {LED_R_1,LED_R_2,LED_R_3,LED_R_4,LED_R_5};

unsigned char lastButton = 0xFF;
unsigned char channelPositionValues[3];

unsigned char TRIAC_values[3];

void ledOn(unsigned char ledAddr)
{
    i2cWriteByte(ledAddr, 155, 0x60);
}

void ledOff(unsigned char ledAddr)
{
    i2cWriteByte(ledAddr, 0, 0x60);
}

void fadeOn(unsigned char ledAddr)
{
    ledOn(ledAddr);
    /*
    unsigned char i = 0;
    while (i < 155)
    {
        i += 5;
        i2cWriteByte(ledAddr, i, 0x60);
        delay_ms(2);
    }
     */
}

void fadeButtonOn(unsigned char ledAddr)
{
    i2cWriteByte(ledAddr, 255, 0x60);
}

void fadeButtonsOff()
{
    i2cWriteByte(LED_T_L, 0, 0x60);
    i2cWriteByte(LED_T_M, 0, 0x60);
    i2cWriteByte(LED_T_R, 0, 0x60);
}

void fadeOff(unsigned char ledAddr)
{
    unsigned char i = 155;
    while (i > 0)
    {
        i -= 5;
        i2cWriteByte(ledAddr, i, 0x60);
        delay_ms(2);
    }
}

int main(void)
{
    init();
    
    TRIAC_values[0] = 0xFF;
    TRIAC_values[1] = 0xFF;
    TRIAC_values[2] = 0xFF;
    //delay_ms(500);

    //debug pins
    P1DIR |= BIT6|BIT7;
    P1SEL &= ~BIT6;
    P1SEL &= ~BIT7;
    P1SEL2 &= ~BIT6;
    P1SEL2 &= ~BIT7;
    
    
    i2cWriteByte(0x00, 0x00, 0x60);
    delay_ms(5);
    i2cWriteByte(0x00, 0x00, 0x60);
    delay_ms(5);
    i2cWriteByte(0x14, 0xaa, 0x60);
    delay_ms(5);
    i2cWriteByte(0x15, 0xaa, 0x60);
    delay_ms(5);
    i2cWriteByte(0x16, 0xaa, 0x60);
    delay_ms(5);
    i2cWriteByte(0x17, 0xaa, 0x60);
    
    // Assert CT CS, Deassert WiFi CS
    P1OUT &= ~BIT0;
    P3OUT |= BIT6;
    while (1)
    {
        delay_ms(5);
        unsigned char receivedByte = spiReadByte();
        if (receivedByte & 0x80)
        {
            
            if ((receivedByte & 0x7F) != 0 && (receivedByte & 0x7F) != lastButton)
            {
                lastButton = receivedByte&0x7F;
                
                switch (receivedByte&0x7F)
                {
                    case 1:
                        fadeButtonsOff();
                        fadeButtonOn(LED_T_L);
                        break;
                    case 2:
                        fadeButtonsOff();
                        fadeButtonOn(LED_T_M);
                        break;
                    case 3:
                        fadeButtonsOff();
                        fadeButtonOn(LED_T_R);
                        break;
                        
                    default:
                        fadeButtonOn(LED_L_0);
                        break;
                }
                updateDisplayAndTRIACS((lastButton-1)%3, channelPositionValues[(lastButton-1)%3]);
            }
        }
        else
        {
            if ((receivedByte&0x7F) != 0x7F)// && lastButton != 255) // If data is all ones, no touch was detected
            {
                updateDisplayAndTRIACS((lastButton-1)%3, receivedByte&0x7F);
            }
        }
    }
    return 0;
}

void updateDisplayAndTRIACS(unsigned char channel, unsigned char value)
{
    channelPositionValues[channel] = value;
    
    unsigned char x = (value > 5) ? 5 : value;
    
    TRIAC_values[channel] = (5-x)*(255/5);
    switch (channel) {
        case 0:
            setLedDisplay(x,LEFT_LEDS);
            break;
        case 1:
            setLedDisplay(x,LEFT_LEDS|RIGHT_LEDS);
            break;
        case 2:
            setLedDisplay(x,RIGHT_LEDS);
            break;
        default:
            fadeButtonOn(LED_L_0);
            break;
    }
}



void setLedDisplay(unsigned char value, unsigned char side)
{
    if (LEFT_LEDS & side)
    {
        for (int i = 0; i < value; i++)
        {
            i2cWriteByte(LED_L[i%5],255,0x60);
        }
        for (int i = value; i < 5; i++)
        {
            i2cWriteByte(LED_L[i%5],0,0x60);
        }
    }
    else
    {
        for (int i = 0; i < 5; i++)
        {
            i2cWriteByte(LED_L[i%5],0,0x60);
        }
    }
    
    if (RIGHT_LEDS & side)
    {
        for (int i = 0; i < value; i++)
        {
            i2cWriteByte(LED_R[i%5],255,0x60);
        }
        for (int i = value; i < 5; i++)
        {
            i2cWriteByte(LED_R[i%5],0,0x60);
        }
    }
    else
    {
        for (int i = 0; i < 5; i++)
        {
            i2cWriteByte(LED_R[i%5],0,0x60);
        }
    }
}

void init(void)
{
    WDTCTL = WDTPW+WDTHOLD;
    
    // Set clock to 1 MHz
    DCOCTL = 0;
    BCSCTL1 = CALBC1_16MHZ;
    DCOCTL = CALDCO_16MHZ;
    
    //SMCLK = 1 MHz / 8 = 125 KHz (SLAU144E p.5-15)
    //BCSCTL2 |= DIVS_3;
    
    _BIS_SR(GIE);
    
    // CT Chip Select
    P1SEL &= ~BIT0;
    P1SEL2 &= ~BIT0;
    P1DIR |= BIT0;
    P1OUT |= BIT0;
    //P1OUT &= ~BIT0;
    
    // WiFI Chip Select
    P3SEL &= ~BIT6;
    P3SEL2 &= ~BIT6;
    P3DIR |= BIT6;
    P3OUT |= BIT6;
    
    
    
    
    // LED Driver _Reset
    P3DIR |= BIT3;
    P3OUT |= BIT3;
    
    
    i2cInit();
    
    spiInit();
    
    TRIACinit();
    
    initComparator();
    
    timerA0init();
    timerA1init();
    
    // Init debug pin
    P1DIR |= BIT6|BIT7;
    P1OUT &= ~BIT6;
    P1OUT &= ~BIT7;
    
    
}

void timerA0init()
{
    TA0CTL |= TACLR;
    // Initialize timer for triggering TRIACs
    TA0CTL |= TASSEL1; // 16 MHz
    TA0CTL |= ID0|ID1; // divide by 8 (clock now 2 MHz)
    TA0CCR0 = 16667; // Set period to 1/120 second
    //TA0CCR0 = 0;
    TA0CTL |= MC0; // Set up mode
    //TA0CTL |= TAIE;
    
    TA0CCTL0 |= CCIE;
    
    unsigned int triggerValue = 8000;//(255-TRIAC_A_value)*(16667/255);
    TA0CCR1 = triggerValue;
    
    TA0CCTL1 |= CCIE;
    
}

interrupt(TIMER0_A0_VECTOR) timer0_a0_isr()
{
    P1OUT ^= BIT6;
    P4OUT &= ~BIT3;
    P4OUT &= ~BIT4;
    P4OUT &= ~BIT5;
    
}

unsigned char nextTRIAC;

inline void triggerTRIAC(unsigned char triacNumber)
{
    switch (triacNumber)
    {
        case 0:
            P4OUT |= BIT3;
            break;
        case 1:
            P4OUT |= BIT4;
            break;
        case 2:
            P4OUT |= BIT5;
            break;
        default:
            break;
    }
}


interrupt(TIMER0_A1_VECTOR) timer0_a1_isr()
{
    P1OUT ^= BIT6;
    if (TAIV & 0x2)
    {
        for (int i = 0; i < 3; i++)
        {
            if (TRIAC_values[i]*(16667/255) == TA0CCR1)
            {
                triggerTRIAC(i);
            }
        }
        
        unsigned int nextTimerValue = 255*(16667/255);
        unsigned char foundNextTimerValue = 0;
        
        for (int i = 0; i < 3; i++)
        {
            if (TRIAC_values[i]*(16667/255) > TA0CCR1 && TRIAC_values[i]*(16667/255) < nextTimerValue)
            {
                nextTimerValue = TRIAC_values[i]*(16667/255);
                foundNextTimerValue = 1;
            }
        }
        
        if (!foundNextTimerValue)
        {
            for (int i = 0; i < 3; i++)
            {
                if (TRIAC_values[i]*(16667/255) < nextTimerValue)
                {
                    nextTimerValue = TRIAC_values[i]*(16667/255);
                }
            }
        }
        
        
        TA0CCR1 = nextTimerValue;
        
        
        //TA0CCR1 // time we just woke up at
        
        //check if any others are supposed to be triggered at this time
        
        
        //unsigned int triggerValue = value;
        
        
        //TA0CCR1 = triggerValue;
    }
}

void timerA1init()
{
    // Initialize timer for correcting TRIAC trigger timer phase
    TA1CTL |= TACLR;
    TA1CTL |= TASSEL1;
    TA1CTL |= ID0 | ID1;
    TA1CCR0 = 12000;
    TA1CCTL0 |= CCIE;
    
}

interrupt(TIMER1_A0_VECTOR) timer1_a0_isr()
{
    if (TA0R > 16667/2)
    {
        TA0R = 16666;
    }
    else
    {
        TA0R = 0;
    }
    P1OUT &= ~BIT7;
    TA1CTL &= ~MC0; //STOP the timer
}


void initComparator()
{
    CACTL1 |= CAON|CAIE;
    
    CACTL1 |= CAREF0; // Select Vcc/4
    CACTL1 |= CARSEL;
    
    //CACTL2 |= P2CA1;    //CA1 on negative input
    CACTL2 |= P2CA4|P2CA0; //CA2 on positive input
    CACTL2 |= CAF;
}

interrupt(COMPARATORA_VECTOR) comparatorISR()
{
    __delay_cycles(128);
    if (CACTL2 & CAOUT)
    {
        //P1OUT ^= BIT6;
        P1OUT |= BIT7;
        TA1R = 0;
        TA1CTL |= MC0; //start the timer
    }
}

void i2cInit()
{
    // Set up I2C
    P3SEL |= BIT1|BIT2; //set to I2C mode
    UCB0CTL1 |= UCSWRST;
    UCB0BR0 = 160; // Divide clock source by 10
    UCB0CTL0 = UCSYNC|UCMST|UCMODE1|UCMODE0;
    UCB0CTL1 = UCSSEL1|UCSSEL0|UCSWRST;
    UCB0CTL1 &= ~UCSWRST;
}

void TRIACinit()
{
    P4DIR |= BIT3|BIT4|BIT5;
}

void spiInit()
{
    // Connect clock pin
    P3SEL |= BIT0;
    P3SEL2 &= ~BIT0;
    
    // Connect MISO
    P3SEL |= BIT5;
    P3SEL2 &= ~BIT5;
    
    // Connect MOSI
    P3SEL |= BIT4;
    P3SEL2 &= ~BIT4;
    
    UCA0CTL1 |= UCSWRST;
    UCA0CTL0 |= UCMST|UCSYNC;
    UCA0CTL1 |= UCSSEL0|UCSSEL1|UCSWRST;
    UCA0BR0 = 160;
    UCA0CTL1 &= ~UCSWRST;
}

unsigned char spiReadByte()
{
    // Apparently the UCSI resets itself after receiving a byte...
    UCA0CTL1 &= ~UCSWRST;
    
    
    unsigned char rv;
    UCA0TXBUF = 0x55;
    while (!(IFG2 & UCA0RXIFG))
    {
        __asm__("nop");
    }
    rv = UCA0RXBUF;
    return rv;
}

void i2cWriteByte(unsigned char data0, unsigned char data1, unsigned char address)
{
    // Wait for bus to be not busy
    
    UCB0CTL1 &= ~UCSWRST;
    
    while (UCB0STAT & UCBBUSY)
    {
        __asm__("nop");
    }
    
    
    
    UCB0I2CSA = address;
    UCB0CTL1 |= UCTR;
    UCB0CTL1 |= UCTXSTT;
    while (!(IFG2 & UCB0TXIFG))
    {
        __asm__("nop");
    }
    UCB0TXBUF = data0;
    while (!(IFG2 & UCB0TXIFG))
    {
        __asm__("nop");
    }
    UCB0TXBUF = data1;
    while (!(IFG2 & UCB0TXIFG))
    {
        __asm__("nop");
    }
    UCB0CTL1 |= UCTXSTP;
    
    
    // set UCTXSTP or write another character to the buffer
}


void delay_ms(int d)
{
    int i;
    for (i = 0; i < d; i++)
        __delay_cycles(1000);
}