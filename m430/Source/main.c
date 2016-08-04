#include "Arduinutil.h"

int main(void)
{
    /* Disable watchdog */
    WDTCTL = WDTPW | WDTHOLD;

    /* Clock 1 MHz */
    BCSCTL1 = CALBC1_1MHZ;
    DCOCTL = CALDCO_1MHZ;

    for(;;) {}
    return 0;
}
