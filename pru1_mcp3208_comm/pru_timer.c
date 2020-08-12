#include "pru_timer.h"

/// Holds the excess cycle count which would have overflowed the CYCLE counter
static uint64_t pru1_extended_cycles = 0;


static inline void stop_pru1_timer() {
  PRU1_CTRL.CTRL_bit.CTR_EN = 0;  // Disable cycle counter
}


void manage_pru1_cycle_overflow() {
  unsigned cycle = PRU1_CTRL.CYCLE;
  if (cycle & (1 << 31)) {
    // Reset counter to the approximate cycle count between the register is
    // read and the timer is restarted.
    stop_pru1_timer();
    PRU1_CTRL.CYCLE = 10;
    start_pru1_timer();

    // Save elapsed count
    pru1_extended_cycles += cycle;
  }
}


uint64_t clock_ns() {
  manage_pru1_cycle_overflow();
  uint64_t total_cycles = PRU1_CTRL.CYCLE + pru1_extended_cycles;
  return total_cycles * 5;
}
