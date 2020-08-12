/**
 * Timer using the PRU1 cycle counter.
 */

#include <stdint.h>
#include <pru_ctrl.h>


static inline void start_pru1_timer() {
  PRU1_CTRL.CTRL_bit.CTR_EN = 1;  // Enable cycle counter
}

uint64_t clock_ns();
