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

void fadeOn(unsigned char ledAddr)
{
    unsigned char i = 0;
    while (i < 255)
    {
        i += 5;
        i2cWriteByte(ledAddr, i, 0x60);
        delay_ms(2);
    }
}
void fadeOff(unsigned char ledAddr)
{
    unsigned char i = 255;
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
    
    
    unsigned char lastTouchLocation = 0xFF;
    while (1)
    {
        fadeOn(LED_L_5);
        fadeOff(LED_L_5);
        unsigned char receivedByte = spiReadByte();
        if (receivedByte & 0x80)
        {
            switch (receivedByte&0x7F)
            {
                case 1:
                    fadeOn(LED_T_L);
                    break;
                case 2:
                    fadeOn(LED_T_M);
                    break;
                case 3:
                    fadeOn(LED_T_R);
                    break;
                    
                default:
                    break;
            }
        }
        else
        {
            // scroll value
            //fadeOff(LED_T_L);
            //fadeOff(LED_T_M);
            //fadeOff(LED_T_R);
            //fadeOn(LED_T_M);
        }
        /*
        if (lastTouchLocation != touchLocation)
        {
            switch (touchLocation)
            {
                case 0:
                    fadeOn(LED_L_1);
                    break;
                case 1:
                    fadeOn(LED_L_2);
                    break;
                case 2:
                    fadeOn(LED_L_3);
                    break;
                case 3:
                    fadeOn(LED_L_4);
                    break;
                case 4:
                    fadeOn(LED_L_5);
                    break;
                    
                default:
                    break;
            }
            lastTouchLocation = touchLocation;
        
        }
        else
        {
            delay_ms(100);
        }
        */
        
        //spiReadByte();
        
        /*
        if (spiReadByte() & 0x01)
        {
            fadeOn(LED_T_R);
            fadeOff(LED_T_R);
        }
        else
        {
            fadeOn(LED_T_L);
            fadeOff(LED_T_L);
        }
         */
        
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
    
    P3SEL |= BIT1|BIT2; //set to I2C mode
    
    P3DIR |= BIT3;
    P3OUT |= BIT3;
    
    
    // Set up I2C
    UCB0BR0 = 10; // Divide clock source by 10
    UCB0CTL0 = UCSYNC|UCMST|UCMODE1|UCMODE0;
    UCB0CTL1 = UCSSEL1|UCSSEL0; // Clears reset
    
    spiInit();
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
        //__asm__("nop");
    }
    rv = UCA0RXBUF;
    return rv;
}

void i2cWriteByte(unsigned char data0, unsigned char data1, unsigned char address)
{
    UCB0I2CSA = address;
    UCB0CTL1 |= UCTR;
    UCB0CTL1 |= UCTXSTT;
    while (!(IFG2 & UCB0TXIFG))
    {
        //__asm__("nop");
    }
    UCB0TXBUF = data0;
    while (!(IFG2 & UCB0TXIFG))
    {
        //__asm__("nop");
    }
    UCB0TXBUF = data1;
    while (!(IFG2 & UCB0TXIFG))
    {
        //__asm__("nop");
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
