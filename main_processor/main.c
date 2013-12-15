#include <msp430.h>
//#include <legacymsp430.h>
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
#define LED_R_0 :(
#define LED_R_1 0x9
#define LED_R_2 0xa
#define LED_R_3 0xb
#define LED_R_4 0xd
#define LED_R_5 0xf

void init();
void delay_ms();
void i2cWriteByte(unsigned char, unsigned char, unsigned char);
unsigned char spiReadByte();
void spiInit();
void i2cInit();
void fadeButtonsOff();
void ledOn(unsigned char ledAddr);
void ledOff(unsigned char ledAddr);

unsigned char LED_T_L_value;
unsigned char LED_T_M_value;
unsigned char LED_T_R_value;

unsigned char LED_L[5] = {LED_L_1,LED_L_2,LED_L_3,LED_L_4,LED_L_5};
unsigned char LED_R[5] = {LED_R_1,LED_R_2,LED_R_3,LED_R_4,LED_R_5};

unsigned char lastButton = 0xFF;

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
    unsigned char i = 0;
    while (i < 155)
    {
        i += 5;
        i2cWriteByte(ledAddr, i, 0x60);
        delay_ms(2);
    }
}

void fadeButtonOn(unsigned char ledAddr)
{
    unsigned char *ledValue;
    switch (ledAddr) {
        case LED_T_L:
            //ledValue = &LED_T_L_value;
            while (LED_T_L_value < 255)
            {
                LED_T_L_value++;
                i2cWriteByte(LED_T_L, LED_T_L_value, 0x60);
                delay_ms(2);
            }
            break;
        case LED_T_M:
            //ledValue = &LED_T_M_value;
            while (LED_T_M_value < 255)
            {
                LED_T_M_value++;
                i2cWriteByte(LED_T_M, LED_T_M_value, 0x60);
                delay_ms(2);
            }
            break;
        case LED_T_R:
            //ledValue = &LED_T_R_value;
            while (LED_T_R_value < 255)
            {
                LED_T_R_value++;
                i2cWriteByte(LED_T_R, LED_T_R_value, 0x60);
                delay_ms(2);
            }
            break;
        default:
            break;
    }
    //while (*ledValue < 255)
    //{
    //    (*ledValue)++;
    //    i2cWriteByte(ledAddr, *ledValue, 0x60);
    //    delay_ms(2);
    //}
}

void fadeButtonsOff()
{
    while (LED_T_L_value > 0 || LED_T_M_value > 0 || LED_T_R_value > 0)
    {
        if(LED_T_L_value > 0)
            LED_T_L_value--;
        if(LED_T_M_value > 0)
            LED_T_M_value--;
        if(LED_T_R_value > 0)
            LED_T_R_value--;
        i2cWriteByte(LED_T_L, LED_T_L_value, 0x60);
        i2cWriteByte(LED_T_M, LED_T_M_value, 0x60);
        i2cWriteByte(LED_T_R, LED_T_R_value, 0x60);
        delay_ms(2);
    }
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
    //delay_ms(500);

    //debug pins
    P1DIR = BIT6|BIT7;
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
    
    while (1)
    {
        //fadeOn(LED_L_5);
        unsigned char receivedByte = spiReadByte();
        //fadeOff(LED_L_5);
        if (receivedByte & 0x80)
        {
            if ((receivedByte&0x7F) != lastButton)
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
                        break;
                }
            }
        }
        else
        {
            if ((receivedByte&0x7F) != 0x7F)
            {
                for (int i = 0; i < receivedByte; i++)
                {
                    i2cWriteByte(LED_L[i],10,0x60);
                    i2cWriteByte(LED_R[i],10,0x60);
                }
                for (int i = receivedByte; i < 5; i++)
                {
                    i2cWriteByte(LED_L[i],0,0x60);
                    i2cWriteByte(LED_R[i],0,0x60);
                }
            }
        }
    }
    return 0;
}

void init(void)
{
    WDTCTL = WDTPW+WDTHOLD;
    
    // Set clock to 1 MHz
    DCOCTL = 0;
    BCSCTL1 = CALBC1_1MHZ;
    DCOCTL = CALDCO_1MHZ;
    
    //SMCLK = 1 MHz / 8 = 125 KHz (SLAU144E p.5-15)
    //BCSCTL2 |= DIVS_3;
    
    
    
    P3DIR |= BIT3;
    P3OUT |= BIT3;
    
    
    i2cInit();
    
    spiInit();
}

void i2cInit()
{
    // Set up I2C
    P3SEL |= BIT1|BIT2; //set to I2C mode
    UCB0CTL1 |= UCSWRST;
    UCB0BR0 = 20; // Divide clock source by 10
    UCB0CTL0 = UCSYNC|UCMST|UCMODE1|UCMODE0;
    UCB0CTL1 = UCSSEL1|UCSSEL0|UCSWRST;
    UCB0CTL1 &= ~UCSWRST;
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
    UCA0BR0 = 1;
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
    while (UCB0STAT & UCBBUSY)
    {
        __asm__("nop");
    }
    
    UCB0CTL1 &= ~UCSWRST;
    
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