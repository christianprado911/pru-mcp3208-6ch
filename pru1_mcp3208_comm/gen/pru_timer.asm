;******************************************************************************
;* PRU C/C++ Codegen                                              Unix v2.3.3 *
;* Date/Time created: Wed Aug 12 00:15:07 2020                                *
;******************************************************************************
	.compiler_opts --abi=eabi --endian=little --hll_source=on --object_format=elf --silicon_version=3 --symdebug:dwarf --symdebug:dwarf_version=3 

$C$DW$CU	.dwtag  DW_TAG_compile_unit
	.dwattr $C$DW$CU, DW_AT_name("pru_timer.c")
	.dwattr $C$DW$CU, DW_AT_producer("TI PRU C/C++ Codegen Unix v2.3.3 Copyright (c) 2012-2018 Texas Instruments Incorporated")
	.dwattr $C$DW$CU, DW_AT_TI_version(0x01)
	.dwattr $C$DW$CU, DW_AT_comp_dir("/home/debian/pru-mcp3208-6ch/pru1_mcp3208_comm")
	.data
	.align	1
	.elfsym	||pru1_extended_cycles||,SYM_SIZE(8)
||pru1_extended_cycles||:
	.bits		0,64
			; pru1_extended_cycles @ 0

$C$DW$1	.dwtag  DW_TAG_variable
	.dwattr $C$DW$1, DW_AT_name("pru1_extended_cycles")
	.dwattr $C$DW$1, DW_AT_TI_symbol_name("pru1_extended_cycles")
	.dwattr $C$DW$1, DW_AT_type(*$C$DW$T$60)
	.dwattr $C$DW$1, DW_AT_location[DW_OP_addr ||pru1_extended_cycles||]
	.dwattr $C$DW$1, DW_AT_decl_file("pru_timer.c")
	.dwattr $C$DW$1, DW_AT_decl_line(0x04)
	.dwattr $C$DW$1, DW_AT_decl_column(0x11)

;	/usr/share/ti/cgt-pru/bin/optpru /tmp/TI1DHYzrsIO /tmp/TI1DHqOYsft 
;	/usr/share/ti/cgt-pru/bin/acpiapru -@/tmp/TI1DHGVLDWf 
	.sect	".text:manage_pru1_cycle_overflow"
	.clink
	.global	||manage_pru1_cycle_overflow||

$C$DW$2	.dwtag  DW_TAG_subprogram
	.dwattr $C$DW$2, DW_AT_name("manage_pru1_cycle_overflow")
	.dwattr $C$DW$2, DW_AT_low_pc(||manage_pru1_cycle_overflow||)
	.dwattr $C$DW$2, DW_AT_high_pc(0x00)
	.dwattr $C$DW$2, DW_AT_TI_symbol_name("manage_pru1_cycle_overflow")
	.dwattr $C$DW$2, DW_AT_external
	.dwattr $C$DW$2, DW_AT_TI_begin_file("pru_timer.c")
	.dwattr $C$DW$2, DW_AT_TI_begin_line(0x0c)
	.dwattr $C$DW$2, DW_AT_TI_begin_column(0x06)
	.dwattr $C$DW$2, DW_AT_decl_file("pru_timer.c")
	.dwattr $C$DW$2, DW_AT_decl_line(0x0c)
	.dwattr $C$DW$2, DW_AT_decl_column(0x06)
	.dwattr $C$DW$2, DW_AT_TI_max_frame_size(0x00)
	.dwpsn	file "pru_timer.c",line 12,column 35,is_stmt,address ||manage_pru1_cycle_overflow||,isa 0

	.dwfde $C$DW$CIE, ||manage_pru1_cycle_overflow||
;----------------------------------------------------------------------
;  12 | void manage_pru1_cycle_overflow() {                                    
;----------------------------------------------------------------------

;***************************************************************
;* FNAME: manage_pru1_cycle_overflow    FR SIZE:   0           *
;*                                                             *
;* FUNCTION ENVIRONMENT                                        *
;*                                                             *
;* FUNCTION PROPERTIES                                         *
;*                            0 Auto,  0 SOE     *
;***************************************************************

||manage_pru1_cycle_overflow||:
;* --------------------------------------------------------------------------*
;* r1_0  assigned to $O$K3
$C$DW$3	.dwtag  DW_TAG_variable
	.dwattr $C$DW$3, DW_AT_name("$O$K3")
	.dwattr $C$DW$3, DW_AT_TI_symbol_name("$O$K3")
	.dwattr $C$DW$3, DW_AT_type(*$C$DW$T$50)
	.dwattr $C$DW$3, DW_AT_location[DW_OP_reg4]

;* r0_0  assigned to cycle
$C$DW$4	.dwtag  DW_TAG_variable
	.dwattr $C$DW$4, DW_AT_name("cycle")
	.dwattr $C$DW$4, DW_AT_TI_symbol_name("cycle")
	.dwattr $C$DW$4, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$4, DW_AT_location[DW_OP_reg0]

	.dwcfi	cfa_offset, 0
;*** 13	-----------------------    cycle = (*(volatile struct $$fake9 *)(K$3 = (volatile struct $$fake9 *)0x24000u)).$P$T3.CYCLE;
;*** 14	-----------------------    if ( !(cycle&0x80000000u) ) goto g3;
	.dwpsn	file "pru_timer.c",line 13,column 18,is_stmt,isa 0
;----------------------------------------------------------------------
;  13 | unsigned cycle = PRU1_CTRL.CYCLE;                                      
;----------------------------------------------------------------------
        LDI32     r1, 0x00024000        ; [ALU_PRU] |13| $O$K3
        LBBO      &r0, r1, 12, 4        ; [ALU_PRU] |13| cycle,$O$K3
	.dwpsn	file "pru_timer.c",line 14,column 3,is_stmt,isa 0
;----------------------------------------------------------------------
;  14 | if (cycle & (1 << 31)) {                                               
;  15 |   // Reset counter to the approximate cycle count between the register
;     | is                                                                     
;  16 |   // read and the timer is restarted.                                  
;  17 |   stop_pru1_timer();                                                   
;  18 |   PRU1_CTRL.CYCLE = 10;                                                
;  19 |   start_pru1_timer();                                                  
;  21 |   // Save elapsed count                                                
;----------------------------------------------------------------------
        QBBC      ||$C$L1||, r0, 0x1f   ; [ALU_PRU] |14| cycle
;* --------------------------------------------------------------------------*
;*** 8	-----------------------    *(volatile unsigned *)K$3 &= 0xfffffff7u;  // [1]
;*** 18	-----------------------    (*(volatile struct $$fake9 *)K$3).$P$T3.CYCLE = 10u;
;*** 10	-----------------------    *(volatile unsigned *)K$3 |= 0x8u;  // [0]
;*** 22	-----------------------    pru1_extended_cycles += cycle;
;***	-----------------------g3:
;***  	-----------------------    return;
	.dwpsn	file "pru_timer.c",line 8,column 3,is_stmt,isa 0
        LBBO      &r14, r1, 0, 4        ; [ALU_PRU] |8| $O$K3
	.dwpsn	file "pru_timer.c",line 22,column 5,is_stmt,isa 0
;----------------------------------------------------------------------
;  22 | pru1_extended_cycles += cycle;                                         
;----------------------------------------------------------------------
        ZERO      &r16, 4               ; [ALU_PRU] |22| 
	.dwpsn	file "pru_timer.c",line 8,column 3,is_stmt,isa 0
        CLR       r14, r14, 0x00000003  ; [ALU_PRU] |8| 
        SBBO      &r14, r1, 0, 4        ; [ALU_PRU] |8| $O$K3
	.dwpsn	file "pru_timer.c",line 18,column 5,is_stmt,isa 0
        LDI       r14, 0x000a           ; [ALU_PRU] |18| 
        SBBO      &r14, r1, 12, 4       ; [ALU_PRU] |18| $O$K3
	.dwpsn	file "pru_timer.h",line 10,column 3,is_stmt,isa 0
        LBBO      &r14, r1, 0, 4        ; [ALU_PRU] |10| $O$K3
        SET       r14, r14, 0x00000003  ; [ALU_PRU] |10| 
        SBBO      &r14, r1, 0, 4        ; [ALU_PRU] |10| $O$K3
	.dwpsn	file "pru_timer.c",line 22,column 5,is_stmt,isa 0
        LDI       r1, ||pru1_extended_cycles|| ; [ALU_PRU] |22| pru1_extended_cycles
        LBBO      &r14, r1, 0, 8        ; [ALU_PRU] |22| 
        ADD       r14, r0, r14          ; [ALU_PRU] |22| 
        ADC       r15, r16, r15         ; [ALU_PRU] |22| 
        SBBO      &r14, r1, 0, 8        ; [ALU_PRU] |22| 
;* --------------------------------------------------------------------------*
||$C$L1||:    
$C$DW$5	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$5, DW_AT_low_pc(0x00)
	.dwattr $C$DW$5, DW_AT_TI_return

        JMP       r3.w2                 ; [ALU_PRU] 
	.dwattr $C$DW$2, DW_AT_TI_end_file("pru_timer.c")
	.dwattr $C$DW$2, DW_AT_TI_end_line(0x18)
	.dwattr $C$DW$2, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$2

	.sect	".text:clock_ns"
	.clink
	.global	||clock_ns||

$C$DW$6	.dwtag  DW_TAG_subprogram
	.dwattr $C$DW$6, DW_AT_name("clock_ns")
	.dwattr $C$DW$6, DW_AT_low_pc(||clock_ns||)
	.dwattr $C$DW$6, DW_AT_high_pc(0x00)
	.dwattr $C$DW$6, DW_AT_TI_symbol_name("clock_ns")
	.dwattr $C$DW$6, DW_AT_external
	.dwattr $C$DW$6, DW_AT_type(*$C$DW$T$60)
	.dwattr $C$DW$6, DW_AT_TI_begin_file("pru_timer.c")
	.dwattr $C$DW$6, DW_AT_TI_begin_line(0x1b)
	.dwattr $C$DW$6, DW_AT_TI_begin_column(0x0a)
	.dwattr $C$DW$6, DW_AT_decl_file("pru_timer.c")
	.dwattr $C$DW$6, DW_AT_decl_line(0x1b)
	.dwattr $C$DW$6, DW_AT_decl_column(0x0a)
	.dwattr $C$DW$6, DW_AT_TI_max_frame_size(0x02)
	.dwpsn	file "pru_timer.c",line 27,column 21,is_stmt,address ||clock_ns||,isa 0

	.dwfde $C$DW$CIE, ||clock_ns||
;----------------------------------------------------------------------
;  27 | uint64_t clock_ns() {                                                  
;----------------------------------------------------------------------

;***************************************************************
;* FNAME: clock_ns                      FR SIZE:   2           *
;*                                                             *
;* FUNCTION ENVIRONMENT                                        *
;*                                                             *
;* FUNCTION PROPERTIES                                         *
;*                            0 Auto,  2 SOE     *
;***************************************************************

||clock_ns||:
;* --------------------------------------------------------------------------*
;* r14_0 assigned to total_cycles
$C$DW$7	.dwtag  DW_TAG_variable
	.dwattr $C$DW$7, DW_AT_name("total_cycles")
	.dwattr $C$DW$7, DW_AT_TI_symbol_name("total_cycles")
	.dwattr $C$DW$7, DW_AT_type(*$C$DW$T$60)
	.dwattr $C$DW$7, DW_AT_location[DW_OP_regx 0x38]

	.dwcfi	cfa_offset, 0
;*** 28	-----------------------    manage_pru1_cycle_overflow();
;*** 29	-----------------------    total_cycles = (unsigned long long)(*(volatile struct $$fake9 *)0x24000u).$P$T3.CYCLE+pru1_extended_cycles;
;*** 30	-----------------------    return total_cycles*5uLL;
        SUB       r2, r2, 0x02          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 2
        SBBO      &r3.b2, r2, 0, 2      ; [ALU_PRU] 
	.dwcfi	save_reg_to_mem, 14, -2
	.dwcfi	save_reg_to_mem, 15, -1
	.dwpsn	file "pru_timer.c",line 28,column 3,is_stmt,isa 0
;----------------------------------------------------------------------
;  28 | manage_pru1_cycle_overflow();                                          
;----------------------------------------------------------------------
$C$DW$8	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$8, DW_AT_low_pc(0x00)
	.dwattr $C$DW$8, DW_AT_name("manage_pru1_cycle_overflow")
	.dwattr $C$DW$8, DW_AT_TI_call

        JAL       r3.w2, ||manage_pru1_cycle_overflow|| ; [ALU_PRU] |28| manage_pru1_cycle_overflow
	.dwpsn	file "pru_timer.c",line 29,column 25,is_stmt,isa 0
;----------------------------------------------------------------------
;  29 | uint64_t total_cycles = PRU1_CTRL.CYCLE + pru1_extended_cycles;        
;----------------------------------------------------------------------
        ZERO      &r17, 4               ; [ALU_PRU] |29| 
        LDI32     r0, 0x0002400c        ; [ALU_PRU] |29| 
        LDI       r1, ||pru1_extended_cycles|| ; [ALU_PRU] |29| pru1_extended_cycles
	.dwpsn	file "pru_timer.c",line 30,column 3,is_stmt,isa 0
;----------------------------------------------------------------------
;  30 | return total_cycles * 5;                                               
;----------------------------------------------------------------------
        LDI       r16, 0x0005           ; [ALU_PRU] |30| 
	.dwpsn	file "pru_timer.c",line 29,column 25,is_stmt,isa 0
        LBBO      &r0, r0, 0, 4         ; [ALU_PRU] |29| 
        LBBO      &r14, r1, 0, 8        ; [ALU_PRU] |29| 
        ADD       r14, r14, r0          ; [ALU_PRU] |29| total_cycles
        ADC       r15, r15, r17         ; [ALU_PRU] |29| 
	.dwpsn	file "pru_timer.c",line 30,column 3,is_stmt,isa 0
$C$DW$9	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$9, DW_AT_low_pc(0x00)
	.dwattr $C$DW$9, DW_AT_name("__pruabi_mpyll")
	.dwattr $C$DW$9, DW_AT_TI_call

        JAL       r3.w2, ||__pruabi_mpyll|| ; [ALU_PRU] |30| __pruabi_mpyll
        LBBO      &r3.b2, r2, 0, 2      ; [ALU_PRU] 
	.dwcfi	restore_reg, 14
	.dwcfi	restore_reg, 15
        ADD       r2, r2, 0x02          ; [ALU_PRU] 
	.dwcfi	cfa_offset, 0
$C$DW$10	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$10, DW_AT_low_pc(0x00)
	.dwattr $C$DW$10, DW_AT_TI_return

        JMP       r3.w2                 ; [ALU_PRU] 
	.dwattr $C$DW$6, DW_AT_TI_end_file("pru_timer.c")
	.dwattr $C$DW$6, DW_AT_TI_end_line(0x1f)
	.dwattr $C$DW$6, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$6

;* Inlined function references:
;* [0] start_pru1_timer
;* [1] stop_pru1_timer
;*****************************************************************************
;* UNDEFINED EXTERNAL REFERENCES                                             *
;*****************************************************************************
	.global	||__pruabi_mpyll||

;******************************************************************************
;* TYPE INFORMATION                                                           *
;******************************************************************************

$C$DW$T$19	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$19, DW_AT_byte_size(0x04)
$C$DW$11	.dwtag  DW_TAG_member
	.dwattr $C$DW$11, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$11, DW_AT_name("SOFT_RST_N")
	.dwattr $C$DW$11, DW_AT_TI_symbol_name("SOFT_RST_N")
	.dwattr $C$DW$11, DW_AT_bit_offset(0x1f)
	.dwattr $C$DW$11, DW_AT_bit_size(0x01)
	.dwattr $C$DW$11, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$11, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$11, DW_AT_decl_file("/usr/share/ti/pru-software-support-package/include/am335x/pru_ctrl.h")
	.dwattr $C$DW$11, DW_AT_decl_line(0x2d)
	.dwattr $C$DW$11, DW_AT_decl_column(0x0d)

$C$DW$12	.dwtag  DW_TAG_member
	.dwattr $C$DW$12, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$12, DW_AT_name("EN")
	.dwattr $C$DW$12, DW_AT_TI_symbol_name("EN")
	.dwattr $C$DW$12, DW_AT_bit_offset(0x1e)
	.dwattr $C$DW$12, DW_AT_bit_size(0x01)
	.dwattr $C$DW$12, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$12, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$12, DW_AT_decl_file("/usr/share/ti/pru-software-support-package/include/am335x/pru_ctrl.h")
	.dwattr $C$DW$12, DW_AT_decl_line(0x2e)
	.dwattr $C$DW$12, DW_AT_decl_column(0x0d)

$C$DW$13	.dwtag  DW_TAG_member
	.dwattr $C$DW$13, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$13, DW_AT_name("SLEEPING")
	.dwattr $C$DW$13, DW_AT_TI_symbol_name("SLEEPING")
	.dwattr $C$DW$13, DW_AT_bit_offset(0x1d)
	.dwattr $C$DW$13, DW_AT_bit_size(0x01)
	.dwattr $C$DW$13, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$13, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$13, DW_AT_decl_file("/usr/share/ti/pru-software-support-package/include/am335x/pru_ctrl.h")
	.dwattr $C$DW$13, DW_AT_decl_line(0x2f)
	.dwattr $C$DW$13, DW_AT_decl_column(0x0d)

$C$DW$14	.dwtag  DW_TAG_member
	.dwattr $C$DW$14, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$14, DW_AT_name("CTR_EN")
	.dwattr $C$DW$14, DW_AT_TI_symbol_name("CTR_EN")
	.dwattr $C$DW$14, DW_AT_bit_offset(0x1c)
	.dwattr $C$DW$14, DW_AT_bit_size(0x01)
	.dwattr $C$DW$14, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$14, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$14, DW_AT_decl_file("/usr/share/ti/pru-software-support-package/include/am335x/pru_ctrl.h")
	.dwattr $C$DW$14, DW_AT_decl_line(0x30)
	.dwattr $C$DW$14, DW_AT_decl_column(0x0d)

$C$DW$15	.dwtag  DW_TAG_member
	.dwattr $C$DW$15, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$15, DW_AT_name("rsvd4")
	.dwattr $C$DW$15, DW_AT_TI_symbol_name("rsvd4")
	.dwattr $C$DW$15, DW_AT_bit_offset(0x18)
	.dwattr $C$DW$15, DW_AT_bit_size(0x04)
	.dwattr $C$DW$15, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$15, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$15, DW_AT_decl_file("/usr/share/ti/pru-software-support-package/include/am335x/pru_ctrl.h")
	.dwattr $C$DW$15, DW_AT_decl_line(0x31)
	.dwattr $C$DW$15, DW_AT_decl_column(0x0d)

$C$DW$16	.dwtag  DW_TAG_member
	.dwattr $C$DW$16, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$16, DW_AT_name("SINGLE_STEP")
	.dwattr $C$DW$16, DW_AT_TI_symbol_name("SINGLE_STEP")
	.dwattr $C$DW$16, DW_AT_bit_offset(0x17)
	.dwattr $C$DW$16, DW_AT_bit_size(0x01)
	.dwattr $C$DW$16, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$16, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$16, DW_AT_decl_file("/usr/share/ti/pru-software-support-package/include/am335x/pru_ctrl.h")
	.dwattr $C$DW$16, DW_AT_decl_line(0x32)
	.dwattr $C$DW$16, DW_AT_decl_column(0x0d)

$C$DW$17	.dwtag  DW_TAG_member
	.dwattr $C$DW$17, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$17, DW_AT_name("rsvd9")
	.dwattr $C$DW$17, DW_AT_TI_symbol_name("rsvd9")
	.dwattr $C$DW$17, DW_AT_bit_offset(0x11)
	.dwattr $C$DW$17, DW_AT_bit_size(0x06)
	.dwattr $C$DW$17, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$17, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$17, DW_AT_decl_file("/usr/share/ti/pru-software-support-package/include/am335x/pru_ctrl.h")
	.dwattr $C$DW$17, DW_AT_decl_line(0x33)
	.dwattr $C$DW$17, DW_AT_decl_column(0x0d)

$C$DW$18	.dwtag  DW_TAG_member
	.dwattr $C$DW$18, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$18, DW_AT_name("RUNSTATE")
	.dwattr $C$DW$18, DW_AT_TI_symbol_name("RUNSTATE")
	.dwattr $C$DW$18, DW_AT_bit_offset(0x10)
	.dwattr $C$DW$18, DW_AT_bit_size(0x01)
	.dwattr $C$DW$18, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$18, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$18, DW_AT_decl_file("/usr/share/ti/pru-software-support-package/include/am335x/pru_ctrl.h")
	.dwattr $C$DW$18, DW_AT_decl_line(0x34)
	.dwattr $C$DW$18, DW_AT_decl_column(0x0d)

$C$DW$19	.dwtag  DW_TAG_member
	.dwattr $C$DW$19, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$19, DW_AT_name("PCTR_RST_VAL")
	.dwattr $C$DW$19, DW_AT_TI_symbol_name("PCTR_RST_VAL")
	.dwattr $C$DW$19, DW_AT_bit_offset(0x00)
	.dwattr $C$DW$19, DW_AT_bit_size(0x10)
	.dwattr $C$DW$19, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$19, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$19, DW_AT_decl_file("/usr/share/ti/pru-software-support-package/include/am335x/pru_ctrl.h")
	.dwattr $C$DW$19, DW_AT_decl_line(0x35)
	.dwattr $C$DW$19, DW_AT_decl_column(0x0d)

	.dwattr $C$DW$T$19, DW_AT_decl_file("/usr/share/ti/pru-software-support-package/include/am335x/pru_ctrl.h")
	.dwattr $C$DW$T$19, DW_AT_decl_line(0x2c)
	.dwattr $C$DW$T$19, DW_AT_decl_column(0x13)
	.dwendtag $C$DW$T$19

$C$DW$T$32	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$32, DW_AT_type(*$C$DW$T$19)

$C$DW$T$50	.dwtag  DW_TAG_pointer_type
	.dwattr $C$DW$T$50, DW_AT_type(*$C$DW$T$32)
	.dwattr $C$DW$T$50, DW_AT_address_class(0x20)


$C$DW$T$20	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$20, DW_AT_byte_size(0x04)
$C$DW$20	.dwtag  DW_TAG_member
	.dwattr $C$DW$20, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$20, DW_AT_name("PCTR")
	.dwattr $C$DW$20, DW_AT_TI_symbol_name("PCTR")
	.dwattr $C$DW$20, DW_AT_bit_offset(0x10)
	.dwattr $C$DW$20, DW_AT_bit_size(0x10)
	.dwattr $C$DW$20, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$20, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$20, DW_AT_decl_file("/usr/share/ti/pru-software-support-package/include/am335x/pru_ctrl.h")
	.dwattr $C$DW$20, DW_AT_decl_line(0x3f)
	.dwattr $C$DW$20, DW_AT_decl_column(0x0d)

$C$DW$21	.dwtag  DW_TAG_member
	.dwattr $C$DW$21, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$21, DW_AT_name("rsvd16")
	.dwattr $C$DW$21, DW_AT_TI_symbol_name("rsvd16")
	.dwattr $C$DW$21, DW_AT_bit_offset(0x00)
	.dwattr $C$DW$21, DW_AT_bit_size(0x10)
	.dwattr $C$DW$21, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$21, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$21, DW_AT_decl_file("/usr/share/ti/pru-software-support-package/include/am335x/pru_ctrl.h")
	.dwattr $C$DW$21, DW_AT_decl_line(0x40)
	.dwattr $C$DW$21, DW_AT_decl_column(0x0d)

	.dwattr $C$DW$T$20, DW_AT_decl_file("/usr/share/ti/pru-software-support-package/include/am335x/pru_ctrl.h")
	.dwattr $C$DW$T$20, DW_AT_decl_line(0x3e)
	.dwattr $C$DW$T$20, DW_AT_decl_column(0x13)
	.dwendtag $C$DW$T$20

$C$DW$T$34	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$34, DW_AT_type(*$C$DW$T$20)


$C$DW$T$21	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$21, DW_AT_byte_size(0x04)
$C$DW$22	.dwtag  DW_TAG_member
	.dwattr $C$DW$22, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$22, DW_AT_name("BITWISE_ENS")
	.dwattr $C$DW$22, DW_AT_TI_symbol_name("BITWISE_ENS")
	.dwattr $C$DW$22, DW_AT_bit_offset(0x00)
	.dwattr $C$DW$22, DW_AT_bit_size(0x20)
	.dwattr $C$DW$22, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$22, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$22, DW_AT_decl_file("/usr/share/ti/pru-software-support-package/include/am335x/pru_ctrl.h")
	.dwattr $C$DW$22, DW_AT_decl_line(0x4a)
	.dwattr $C$DW$22, DW_AT_decl_column(0x0d)

	.dwattr $C$DW$T$21, DW_AT_decl_file("/usr/share/ti/pru-software-support-package/include/am335x/pru_ctrl.h")
	.dwattr $C$DW$T$21, DW_AT_decl_line(0x49)
	.dwattr $C$DW$T$21, DW_AT_decl_column(0x13)
	.dwendtag $C$DW$T$21

$C$DW$T$36	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$36, DW_AT_type(*$C$DW$T$21)


$C$DW$T$22	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$22, DW_AT_byte_size(0x04)
$C$DW$23	.dwtag  DW_TAG_member
	.dwattr $C$DW$23, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$23, DW_AT_name("CYCLECOUNT")
	.dwattr $C$DW$23, DW_AT_TI_symbol_name("CYCLECOUNT")
	.dwattr $C$DW$23, DW_AT_bit_offset(0x00)
	.dwattr $C$DW$23, DW_AT_bit_size(0x20)
	.dwattr $C$DW$23, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$23, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$23, DW_AT_decl_file("/usr/share/ti/pru-software-support-package/include/am335x/pru_ctrl.h")
	.dwattr $C$DW$23, DW_AT_decl_line(0x54)
	.dwattr $C$DW$23, DW_AT_decl_column(0x0d)

	.dwattr $C$DW$T$22, DW_AT_decl_file("/usr/share/ti/pru-software-support-package/include/am335x/pru_ctrl.h")
	.dwattr $C$DW$T$22, DW_AT_decl_line(0x53)
	.dwattr $C$DW$T$22, DW_AT_decl_column(0x13)
	.dwendtag $C$DW$T$22

$C$DW$T$38	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$38, DW_AT_type(*$C$DW$T$22)


$C$DW$T$23	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$23, DW_AT_byte_size(0x04)
$C$DW$24	.dwtag  DW_TAG_member
	.dwattr $C$DW$24, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$24, DW_AT_name("STALLCOUNT")
	.dwattr $C$DW$24, DW_AT_TI_symbol_name("STALLCOUNT")
	.dwattr $C$DW$24, DW_AT_bit_offset(0x00)
	.dwattr $C$DW$24, DW_AT_bit_size(0x20)
	.dwattr $C$DW$24, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$24, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$24, DW_AT_decl_file("/usr/share/ti/pru-software-support-package/include/am335x/pru_ctrl.h")
	.dwattr $C$DW$24, DW_AT_decl_line(0x5e)
	.dwattr $C$DW$24, DW_AT_decl_column(0x0d)

	.dwattr $C$DW$T$23, DW_AT_decl_file("/usr/share/ti/pru-software-support-package/include/am335x/pru_ctrl.h")
	.dwattr $C$DW$T$23, DW_AT_decl_line(0x5d)
	.dwattr $C$DW$T$23, DW_AT_decl_column(0x14)
	.dwendtag $C$DW$T$23

$C$DW$T$40	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$40, DW_AT_type(*$C$DW$T$23)


$C$DW$T$24	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$24, DW_AT_byte_size(0x04)
$C$DW$25	.dwtag  DW_TAG_member
	.dwattr $C$DW$25, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$25, DW_AT_name("C24_BLK_IDX")
	.dwattr $C$DW$25, DW_AT_TI_symbol_name("C24_BLK_IDX")
	.dwattr $C$DW$25, DW_AT_bit_offset(0x18)
	.dwattr $C$DW$25, DW_AT_bit_size(0x08)
	.dwattr $C$DW$25, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$25, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$25, DW_AT_decl_file("/usr/share/ti/pru-software-support-package/include/am335x/pru_ctrl.h")
	.dwattr $C$DW$25, DW_AT_decl_line(0x6b)
	.dwattr $C$DW$25, DW_AT_decl_column(0x0d)

$C$DW$26	.dwtag  DW_TAG_member
	.dwattr $C$DW$26, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$26, DW_AT_name("rsvd8")
	.dwattr $C$DW$26, DW_AT_TI_symbol_name("rsvd8")
	.dwattr $C$DW$26, DW_AT_bit_offset(0x10)
	.dwattr $C$DW$26, DW_AT_bit_size(0x08)
	.dwattr $C$DW$26, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$26, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$26, DW_AT_decl_file("/usr/share/ti/pru-software-support-package/include/am335x/pru_ctrl.h")
	.dwattr $C$DW$26, DW_AT_decl_line(0x6c)
	.dwattr $C$DW$26, DW_AT_decl_column(0x0d)

$C$DW$27	.dwtag  DW_TAG_member
	.dwattr $C$DW$27, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$27, DW_AT_name("C25_BLK_IDX")
	.dwattr $C$DW$27, DW_AT_TI_symbol_name("C25_BLK_IDX")
	.dwattr $C$DW$27, DW_AT_bit_offset(0x08)
	.dwattr $C$DW$27, DW_AT_bit_size(0x08)
	.dwattr $C$DW$27, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$27, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$27, DW_AT_decl_file("/usr/share/ti/pru-software-support-package/include/am335x/pru_ctrl.h")
	.dwattr $C$DW$27, DW_AT_decl_line(0x6d)
	.dwattr $C$DW$27, DW_AT_decl_column(0x0d)

$C$DW$28	.dwtag  DW_TAG_member
	.dwattr $C$DW$28, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$28, DW_AT_name("rsvd24")
	.dwattr $C$DW$28, DW_AT_TI_symbol_name("rsvd24")
	.dwattr $C$DW$28, DW_AT_bit_offset(0x00)
	.dwattr $C$DW$28, DW_AT_bit_size(0x08)
	.dwattr $C$DW$28, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$28, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$28, DW_AT_decl_file("/usr/share/ti/pru-software-support-package/include/am335x/pru_ctrl.h")
	.dwattr $C$DW$28, DW_AT_decl_line(0x6e)
	.dwattr $C$DW$28, DW_AT_decl_column(0x0d)

	.dwattr $C$DW$T$24, DW_AT_decl_file("/usr/share/ti/pru-software-support-package/include/am335x/pru_ctrl.h")
	.dwattr $C$DW$T$24, DW_AT_decl_line(0x6a)
	.dwattr $C$DW$T$24, DW_AT_decl_column(0x13)
	.dwendtag $C$DW$T$24

$C$DW$T$42	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$42, DW_AT_type(*$C$DW$T$24)


$C$DW$T$25	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$25, DW_AT_byte_size(0x04)
$C$DW$29	.dwtag  DW_TAG_member
	.dwattr $C$DW$29, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$29, DW_AT_name("C26_BLK_IDX")
	.dwattr $C$DW$29, DW_AT_TI_symbol_name("C26_BLK_IDX")
	.dwattr $C$DW$29, DW_AT_bit_offset(0x18)
	.dwattr $C$DW$29, DW_AT_bit_size(0x08)
	.dwattr $C$DW$29, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$29, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$29, DW_AT_decl_file("/usr/share/ti/pru-software-support-package/include/am335x/pru_ctrl.h")
	.dwattr $C$DW$29, DW_AT_decl_line(0x78)
	.dwattr $C$DW$29, DW_AT_decl_column(0x0d)

$C$DW$30	.dwtag  DW_TAG_member
	.dwattr $C$DW$30, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$30, DW_AT_name("rsvd8")
	.dwattr $C$DW$30, DW_AT_TI_symbol_name("rsvd8")
	.dwattr $C$DW$30, DW_AT_bit_offset(0x10)
	.dwattr $C$DW$30, DW_AT_bit_size(0x08)
	.dwattr $C$DW$30, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$30, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$30, DW_AT_decl_file("/usr/share/ti/pru-software-support-package/include/am335x/pru_ctrl.h")
	.dwattr $C$DW$30, DW_AT_decl_line(0x79)
	.dwattr $C$DW$30, DW_AT_decl_column(0x0d)

$C$DW$31	.dwtag  DW_TAG_member
	.dwattr $C$DW$31, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$31, DW_AT_name("C27_BLK_IDX")
	.dwattr $C$DW$31, DW_AT_TI_symbol_name("C27_BLK_IDX")
	.dwattr $C$DW$31, DW_AT_bit_offset(0x08)
	.dwattr $C$DW$31, DW_AT_bit_size(0x08)
	.dwattr $C$DW$31, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$31, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$31, DW_AT_decl_file("/usr/share/ti/pru-software-support-package/include/am335x/pru_ctrl.h")
	.dwattr $C$DW$31, DW_AT_decl_line(0x7a)
	.dwattr $C$DW$31, DW_AT_decl_column(0x0d)

$C$DW$32	.dwtag  DW_TAG_member
	.dwattr $C$DW$32, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$32, DW_AT_name("rsvd24")
	.dwattr $C$DW$32, DW_AT_TI_symbol_name("rsvd24")
	.dwattr $C$DW$32, DW_AT_bit_offset(0x00)
	.dwattr $C$DW$32, DW_AT_bit_size(0x08)
	.dwattr $C$DW$32, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$32, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$32, DW_AT_decl_file("/usr/share/ti/pru-software-support-package/include/am335x/pru_ctrl.h")
	.dwattr $C$DW$32, DW_AT_decl_line(0x7b)
	.dwattr $C$DW$32, DW_AT_decl_column(0x0d)

	.dwattr $C$DW$T$25, DW_AT_decl_file("/usr/share/ti/pru-software-support-package/include/am335x/pru_ctrl.h")
	.dwattr $C$DW$T$25, DW_AT_decl_line(0x77)
	.dwattr $C$DW$T$25, DW_AT_decl_column(0x13)
	.dwendtag $C$DW$T$25

$C$DW$T$44	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$44, DW_AT_type(*$C$DW$T$25)


$C$DW$T$26	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$26, DW_AT_byte_size(0x04)
$C$DW$33	.dwtag  DW_TAG_member
	.dwattr $C$DW$33, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$33, DW_AT_name("C28_BLK_POINTER")
	.dwattr $C$DW$33, DW_AT_TI_symbol_name("C28_BLK_POINTER")
	.dwattr $C$DW$33, DW_AT_bit_offset(0x10)
	.dwattr $C$DW$33, DW_AT_bit_size(0x10)
	.dwattr $C$DW$33, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$33, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$33, DW_AT_decl_file("/usr/share/ti/pru-software-support-package/include/am335x/pru_ctrl.h")
	.dwattr $C$DW$33, DW_AT_decl_line(0x85)
	.dwattr $C$DW$33, DW_AT_decl_column(0x0d)

$C$DW$34	.dwtag  DW_TAG_member
	.dwattr $C$DW$34, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$34, DW_AT_name("C29_BLK_POINTER")
	.dwattr $C$DW$34, DW_AT_TI_symbol_name("C29_BLK_POINTER")
	.dwattr $C$DW$34, DW_AT_bit_offset(0x00)
	.dwattr $C$DW$34, DW_AT_bit_size(0x10)
	.dwattr $C$DW$34, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$34, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$34, DW_AT_decl_file("/usr/share/ti/pru-software-support-package/include/am335x/pru_ctrl.h")
	.dwattr $C$DW$34, DW_AT_decl_line(0x86)
	.dwattr $C$DW$34, DW_AT_decl_column(0x0d)

	.dwattr $C$DW$T$26, DW_AT_decl_file("/usr/share/ti/pru-software-support-package/include/am335x/pru_ctrl.h")
	.dwattr $C$DW$T$26, DW_AT_decl_line(0x84)
	.dwattr $C$DW$T$26, DW_AT_decl_column(0x13)
	.dwendtag $C$DW$T$26

$C$DW$T$46	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$46, DW_AT_type(*$C$DW$T$26)


$C$DW$T$27	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$27, DW_AT_byte_size(0x04)
$C$DW$35	.dwtag  DW_TAG_member
	.dwattr $C$DW$35, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$35, DW_AT_name("C30_BLK_POINTER")
	.dwattr $C$DW$35, DW_AT_TI_symbol_name("C30_BLK_POINTER")
	.dwattr $C$DW$35, DW_AT_bit_offset(0x10)
	.dwattr $C$DW$35, DW_AT_bit_size(0x10)
	.dwattr $C$DW$35, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$35, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$35, DW_AT_decl_file("/usr/share/ti/pru-software-support-package/include/am335x/pru_ctrl.h")
	.dwattr $C$DW$35, DW_AT_decl_line(0x90)
	.dwattr $C$DW$35, DW_AT_decl_column(0x0d)

$C$DW$36	.dwtag  DW_TAG_member
	.dwattr $C$DW$36, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$36, DW_AT_name("C31_BLK_POINTER")
	.dwattr $C$DW$36, DW_AT_TI_symbol_name("C31_BLK_POINTER")
	.dwattr $C$DW$36, DW_AT_bit_offset(0x00)
	.dwattr $C$DW$36, DW_AT_bit_size(0x10)
	.dwattr $C$DW$36, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$36, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$36, DW_AT_decl_file("/usr/share/ti/pru-software-support-package/include/am335x/pru_ctrl.h")
	.dwattr $C$DW$36, DW_AT_decl_line(0x91)
	.dwattr $C$DW$36, DW_AT_decl_column(0x0d)

	.dwattr $C$DW$T$27, DW_AT_decl_file("/usr/share/ti/pru-software-support-package/include/am335x/pru_ctrl.h")
	.dwattr $C$DW$T$27, DW_AT_decl_line(0x8f)
	.dwattr $C$DW$T$27, DW_AT_decl_column(0x13)
	.dwendtag $C$DW$T$27

$C$DW$T$48	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$48, DW_AT_type(*$C$DW$T$27)


$C$DW$T$30	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$30, DW_AT_byte_size(0x30)
$C$DW$37	.dwtag  DW_TAG_member
	.dwattr $C$DW$37, DW_AT_type(*$C$DW$T$33)
	.dwattr $C$DW$37, DW_AT_name("$P$T0")
	.dwattr $C$DW$37, DW_AT_TI_symbol_name("$P$T0")
	.dwattr $C$DW$37, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$37, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$37, DW_AT_decl_file("/usr/share/ti/pru-software-support-package/include/am335x/pru_ctrl.h")
	.dwattr $C$DW$37, DW_AT_decl_line(0x29)
	.dwattr $C$DW$37, DW_AT_decl_column(0x02)

$C$DW$38	.dwtag  DW_TAG_member
	.dwattr $C$DW$38, DW_AT_type(*$C$DW$T$35)
	.dwattr $C$DW$38, DW_AT_name("$P$T1")
	.dwattr $C$DW$38, DW_AT_TI_symbol_name("$P$T1")
	.dwattr $C$DW$38, DW_AT_data_member_location[DW_OP_plus_uconst 0x4]
	.dwattr $C$DW$38, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$38, DW_AT_decl_file("/usr/share/ti/pru-software-support-package/include/am335x/pru_ctrl.h")
	.dwattr $C$DW$38, DW_AT_decl_line(0x3b)
	.dwattr $C$DW$38, DW_AT_decl_column(0x02)

$C$DW$39	.dwtag  DW_TAG_member
	.dwattr $C$DW$39, DW_AT_type(*$C$DW$T$37)
	.dwattr $C$DW$39, DW_AT_name("$P$T2")
	.dwattr $C$DW$39, DW_AT_TI_symbol_name("$P$T2")
	.dwattr $C$DW$39, DW_AT_data_member_location[DW_OP_plus_uconst 0x8]
	.dwattr $C$DW$39, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$39, DW_AT_decl_file("/usr/share/ti/pru-software-support-package/include/am335x/pru_ctrl.h")
	.dwattr $C$DW$39, DW_AT_decl_line(0x46)
	.dwattr $C$DW$39, DW_AT_decl_column(0x02)

$C$DW$40	.dwtag  DW_TAG_member
	.dwattr $C$DW$40, DW_AT_type(*$C$DW$T$39)
	.dwattr $C$DW$40, DW_AT_name("$P$T3")
	.dwattr $C$DW$40, DW_AT_TI_symbol_name("$P$T3")
	.dwattr $C$DW$40, DW_AT_data_member_location[DW_OP_plus_uconst 0xc]
	.dwattr $C$DW$40, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$40, DW_AT_decl_file("/usr/share/ti/pru-software-support-package/include/am335x/pru_ctrl.h")
	.dwattr $C$DW$40, DW_AT_decl_line(0x50)
	.dwattr $C$DW$40, DW_AT_decl_column(0x02)

$C$DW$41	.dwtag  DW_TAG_member
	.dwattr $C$DW$41, DW_AT_type(*$C$DW$T$41)
	.dwattr $C$DW$41, DW_AT_name("$P$T4")
	.dwattr $C$DW$41, DW_AT_TI_symbol_name("$P$T4")
	.dwattr $C$DW$41, DW_AT_data_member_location[DW_OP_plus_uconst 0x10]
	.dwattr $C$DW$41, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$41, DW_AT_decl_file("/usr/share/ti/pru-software-support-package/include/am335x/pru_ctrl.h")
	.dwattr $C$DW$41, DW_AT_decl_line(0x5a)
	.dwattr $C$DW$41, DW_AT_decl_column(0x02)

$C$DW$42	.dwtag  DW_TAG_member
	.dwattr $C$DW$42, DW_AT_type(*$C$DW$T$29)
	.dwattr $C$DW$42, DW_AT_name("rsvd14")
	.dwattr $C$DW$42, DW_AT_TI_symbol_name("rsvd14")
	.dwattr $C$DW$42, DW_AT_data_member_location[DW_OP_plus_uconst 0x14]
	.dwattr $C$DW$42, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$42, DW_AT_decl_file("/usr/share/ti/pru-software-support-package/include/am335x/pru_ctrl.h")
	.dwattr $C$DW$42, DW_AT_decl_line(0x63)
	.dwattr $C$DW$42, DW_AT_decl_column(0x0b)

$C$DW$43	.dwtag  DW_TAG_member
	.dwattr $C$DW$43, DW_AT_type(*$C$DW$T$43)
	.dwattr $C$DW$43, DW_AT_name("$P$T5")
	.dwattr $C$DW$43, DW_AT_TI_symbol_name("$P$T5")
	.dwattr $C$DW$43, DW_AT_data_member_location[DW_OP_plus_uconst 0x20]
	.dwattr $C$DW$43, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$43, DW_AT_decl_file("/usr/share/ti/pru-software-support-package/include/am335x/pru_ctrl.h")
	.dwattr $C$DW$43, DW_AT_decl_line(0x67)
	.dwattr $C$DW$43, DW_AT_decl_column(0x02)

$C$DW$44	.dwtag  DW_TAG_member
	.dwattr $C$DW$44, DW_AT_type(*$C$DW$T$45)
	.dwattr $C$DW$44, DW_AT_name("$P$T6")
	.dwattr $C$DW$44, DW_AT_TI_symbol_name("$P$T6")
	.dwattr $C$DW$44, DW_AT_data_member_location[DW_OP_plus_uconst 0x24]
	.dwattr $C$DW$44, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$44, DW_AT_decl_file("/usr/share/ti/pru-software-support-package/include/am335x/pru_ctrl.h")
	.dwattr $C$DW$44, DW_AT_decl_line(0x74)
	.dwattr $C$DW$44, DW_AT_decl_column(0x02)

$C$DW$45	.dwtag  DW_TAG_member
	.dwattr $C$DW$45, DW_AT_type(*$C$DW$T$47)
	.dwattr $C$DW$45, DW_AT_name("$P$T7")
	.dwattr $C$DW$45, DW_AT_TI_symbol_name("$P$T7")
	.dwattr $C$DW$45, DW_AT_data_member_location[DW_OP_plus_uconst 0x28]
	.dwattr $C$DW$45, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$45, DW_AT_decl_file("/usr/share/ti/pru-software-support-package/include/am335x/pru_ctrl.h")
	.dwattr $C$DW$45, DW_AT_decl_line(0x81)
	.dwattr $C$DW$45, DW_AT_decl_column(0x02)

$C$DW$46	.dwtag  DW_TAG_member
	.dwattr $C$DW$46, DW_AT_type(*$C$DW$T$49)
	.dwattr $C$DW$46, DW_AT_name("$P$T8")
	.dwattr $C$DW$46, DW_AT_TI_symbol_name("$P$T8")
	.dwattr $C$DW$46, DW_AT_data_member_location[DW_OP_plus_uconst 0x2c]
	.dwattr $C$DW$46, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$46, DW_AT_decl_file("/usr/share/ti/pru-software-support-package/include/am335x/pru_ctrl.h")
	.dwattr $C$DW$46, DW_AT_decl_line(0x8c)
	.dwattr $C$DW$46, DW_AT_decl_column(0x02)

	.dwattr $C$DW$T$30, DW_AT_decl_file("/usr/share/ti/pru-software-support-package/include/am335x/pru_ctrl.h")
	.dwattr $C$DW$T$30, DW_AT_decl_line(0x26)
	.dwattr $C$DW$T$30, DW_AT_decl_column(0x10)
	.dwendtag $C$DW$T$30

$C$DW$T$53	.dwtag  DW_TAG_typedef
	.dwattr $C$DW$T$53, DW_AT_name("pruCtrl")
	.dwattr $C$DW$T$53, DW_AT_type(*$C$DW$T$30)
	.dwattr $C$DW$T$53, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$53, DW_AT_decl_file("/usr/share/ti/pru-software-support-package/include/am335x/pru_ctrl.h")
	.dwattr $C$DW$T$53, DW_AT_decl_line(0x95)
	.dwattr $C$DW$T$53, DW_AT_decl_column(0x03)


$C$DW$T$33	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$33, DW_AT_byte_size(0x04)
$C$DW$47	.dwtag  DW_TAG_member
	.dwattr $C$DW$47, DW_AT_type(*$C$DW$T$31)
	.dwattr $C$DW$47, DW_AT_name("CTRL")
	.dwattr $C$DW$47, DW_AT_TI_symbol_name("CTRL")
	.dwattr $C$DW$47, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$47, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$47, DW_AT_decl_file("/usr/share/ti/pru-software-support-package/include/am335x/pru_ctrl.h")
	.dwattr $C$DW$47, DW_AT_decl_line(0x2a)
	.dwattr $C$DW$47, DW_AT_decl_column(0x15)

$C$DW$48	.dwtag  DW_TAG_member
	.dwattr $C$DW$48, DW_AT_type(*$C$DW$T$32)
	.dwattr $C$DW$48, DW_AT_name("CTRL_bit")
	.dwattr $C$DW$48, DW_AT_TI_symbol_name("CTRL_bit")
	.dwattr $C$DW$48, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$48, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$48, DW_AT_decl_file("/usr/share/ti/pru-software-support-package/include/am335x/pru_ctrl.h")
	.dwattr $C$DW$48, DW_AT_decl_line(0x36)
	.dwattr $C$DW$48, DW_AT_decl_column(0x05)

	.dwattr $C$DW$T$33, DW_AT_decl_file("/usr/share/ti/pru-software-support-package/include/am335x/pru_ctrl.h")
	.dwattr $C$DW$T$33, DW_AT_decl_line(0x29)
	.dwattr $C$DW$T$33, DW_AT_decl_column(0x08)
	.dwendtag $C$DW$T$33


$C$DW$T$35	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$35, DW_AT_byte_size(0x04)
$C$DW$49	.dwtag  DW_TAG_member
	.dwattr $C$DW$49, DW_AT_type(*$C$DW$T$31)
	.dwattr $C$DW$49, DW_AT_name("STS")
	.dwattr $C$DW$49, DW_AT_TI_symbol_name("STS")
	.dwattr $C$DW$49, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$49, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$49, DW_AT_decl_file("/usr/share/ti/pru-software-support-package/include/am335x/pru_ctrl.h")
	.dwattr $C$DW$49, DW_AT_decl_line(0x3c)
	.dwattr $C$DW$49, DW_AT_decl_column(0x15)

$C$DW$50	.dwtag  DW_TAG_member
	.dwattr $C$DW$50, DW_AT_type(*$C$DW$T$34)
	.dwattr $C$DW$50, DW_AT_name("STS_bit")
	.dwattr $C$DW$50, DW_AT_TI_symbol_name("STS_bit")
	.dwattr $C$DW$50, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$50, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$50, DW_AT_decl_file("/usr/share/ti/pru-software-support-package/include/am335x/pru_ctrl.h")
	.dwattr $C$DW$50, DW_AT_decl_line(0x41)
	.dwattr $C$DW$50, DW_AT_decl_column(0x05)

	.dwattr $C$DW$T$35, DW_AT_decl_file("/usr/share/ti/pru-software-support-package/include/am335x/pru_ctrl.h")
	.dwattr $C$DW$T$35, DW_AT_decl_line(0x3b)
	.dwattr $C$DW$T$35, DW_AT_decl_column(0x08)
	.dwendtag $C$DW$T$35


$C$DW$T$37	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$37, DW_AT_byte_size(0x04)
$C$DW$51	.dwtag  DW_TAG_member
	.dwattr $C$DW$51, DW_AT_type(*$C$DW$T$31)
	.dwattr $C$DW$51, DW_AT_name("WAKEUP_EN")
	.dwattr $C$DW$51, DW_AT_TI_symbol_name("WAKEUP_EN")
	.dwattr $C$DW$51, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$51, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$51, DW_AT_decl_file("/usr/share/ti/pru-software-support-package/include/am335x/pru_ctrl.h")
	.dwattr $C$DW$51, DW_AT_decl_line(0x47)
	.dwattr $C$DW$51, DW_AT_decl_column(0x15)

$C$DW$52	.dwtag  DW_TAG_member
	.dwattr $C$DW$52, DW_AT_type(*$C$DW$T$36)
	.dwattr $C$DW$52, DW_AT_name("WAKEUP_EN_bit")
	.dwattr $C$DW$52, DW_AT_TI_symbol_name("WAKEUP_EN_bit")
	.dwattr $C$DW$52, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$52, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$52, DW_AT_decl_file("/usr/share/ti/pru-software-support-package/include/am335x/pru_ctrl.h")
	.dwattr $C$DW$52, DW_AT_decl_line(0x4b)
	.dwattr $C$DW$52, DW_AT_decl_column(0x05)

	.dwattr $C$DW$T$37, DW_AT_decl_file("/usr/share/ti/pru-software-support-package/include/am335x/pru_ctrl.h")
	.dwattr $C$DW$T$37, DW_AT_decl_line(0x46)
	.dwattr $C$DW$T$37, DW_AT_decl_column(0x08)
	.dwendtag $C$DW$T$37


$C$DW$T$39	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$39, DW_AT_byte_size(0x04)
$C$DW$53	.dwtag  DW_TAG_member
	.dwattr $C$DW$53, DW_AT_type(*$C$DW$T$31)
	.dwattr $C$DW$53, DW_AT_name("CYCLE")
	.dwattr $C$DW$53, DW_AT_TI_symbol_name("CYCLE")
	.dwattr $C$DW$53, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$53, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$53, DW_AT_decl_file("/usr/share/ti/pru-software-support-package/include/am335x/pru_ctrl.h")
	.dwattr $C$DW$53, DW_AT_decl_line(0x51)
	.dwattr $C$DW$53, DW_AT_decl_column(0x15)

$C$DW$54	.dwtag  DW_TAG_member
	.dwattr $C$DW$54, DW_AT_type(*$C$DW$T$38)
	.dwattr $C$DW$54, DW_AT_name("CYCLE_bit")
	.dwattr $C$DW$54, DW_AT_TI_symbol_name("CYCLE_bit")
	.dwattr $C$DW$54, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$54, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$54, DW_AT_decl_file("/usr/share/ti/pru-software-support-package/include/am335x/pru_ctrl.h")
	.dwattr $C$DW$54, DW_AT_decl_line(0x55)
	.dwattr $C$DW$54, DW_AT_decl_column(0x05)

	.dwattr $C$DW$T$39, DW_AT_decl_file("/usr/share/ti/pru-software-support-package/include/am335x/pru_ctrl.h")
	.dwattr $C$DW$T$39, DW_AT_decl_line(0x50)
	.dwattr $C$DW$T$39, DW_AT_decl_column(0x08)
	.dwendtag $C$DW$T$39


$C$DW$T$41	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$41, DW_AT_byte_size(0x04)
$C$DW$55	.dwtag  DW_TAG_member
	.dwattr $C$DW$55, DW_AT_type(*$C$DW$T$31)
	.dwattr $C$DW$55, DW_AT_name("STALL")
	.dwattr $C$DW$55, DW_AT_TI_symbol_name("STALL")
	.dwattr $C$DW$55, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$55, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$55, DW_AT_decl_file("/usr/share/ti/pru-software-support-package/include/am335x/pru_ctrl.h")
	.dwattr $C$DW$55, DW_AT_decl_line(0x5b)
	.dwattr $C$DW$55, DW_AT_decl_column(0x15)

$C$DW$56	.dwtag  DW_TAG_member
	.dwattr $C$DW$56, DW_AT_type(*$C$DW$T$40)
	.dwattr $C$DW$56, DW_AT_name("STALL_bit")
	.dwattr $C$DW$56, DW_AT_TI_symbol_name("STALL_bit")
	.dwattr $C$DW$56, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$56, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$56, DW_AT_decl_file("/usr/share/ti/pru-software-support-package/include/am335x/pru_ctrl.h")
	.dwattr $C$DW$56, DW_AT_decl_line(0x5f)
	.dwattr $C$DW$56, DW_AT_decl_column(0x05)

	.dwattr $C$DW$T$41, DW_AT_decl_file("/usr/share/ti/pru-software-support-package/include/am335x/pru_ctrl.h")
	.dwattr $C$DW$T$41, DW_AT_decl_line(0x5a)
	.dwattr $C$DW$T$41, DW_AT_decl_column(0x08)
	.dwendtag $C$DW$T$41


$C$DW$T$43	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$43, DW_AT_byte_size(0x04)
$C$DW$57	.dwtag  DW_TAG_member
	.dwattr $C$DW$57, DW_AT_type(*$C$DW$T$31)
	.dwattr $C$DW$57, DW_AT_name("CTBIR0")
	.dwattr $C$DW$57, DW_AT_TI_symbol_name("CTBIR0")
	.dwattr $C$DW$57, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$57, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$57, DW_AT_decl_file("/usr/share/ti/pru-software-support-package/include/am335x/pru_ctrl.h")
	.dwattr $C$DW$57, DW_AT_decl_line(0x68)
	.dwattr $C$DW$57, DW_AT_decl_column(0x15)

$C$DW$58	.dwtag  DW_TAG_member
	.dwattr $C$DW$58, DW_AT_type(*$C$DW$T$42)
	.dwattr $C$DW$58, DW_AT_name("CTBIR0_bit")
	.dwattr $C$DW$58, DW_AT_TI_symbol_name("CTBIR0_bit")
	.dwattr $C$DW$58, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$58, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$58, DW_AT_decl_file("/usr/share/ti/pru-software-support-package/include/am335x/pru_ctrl.h")
	.dwattr $C$DW$58, DW_AT_decl_line(0x6f)
	.dwattr $C$DW$58, DW_AT_decl_column(0x05)

	.dwattr $C$DW$T$43, DW_AT_decl_file("/usr/share/ti/pru-software-support-package/include/am335x/pru_ctrl.h")
	.dwattr $C$DW$T$43, DW_AT_decl_line(0x67)
	.dwattr $C$DW$T$43, DW_AT_decl_column(0x08)
	.dwendtag $C$DW$T$43


$C$DW$T$45	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$45, DW_AT_byte_size(0x04)
$C$DW$59	.dwtag  DW_TAG_member
	.dwattr $C$DW$59, DW_AT_type(*$C$DW$T$31)
	.dwattr $C$DW$59, DW_AT_name("CTBIR1")
	.dwattr $C$DW$59, DW_AT_TI_symbol_name("CTBIR1")
	.dwattr $C$DW$59, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$59, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$59, DW_AT_decl_file("/usr/share/ti/pru-software-support-package/include/am335x/pru_ctrl.h")
	.dwattr $C$DW$59, DW_AT_decl_line(0x75)
	.dwattr $C$DW$59, DW_AT_decl_column(0x15)

$C$DW$60	.dwtag  DW_TAG_member
	.dwattr $C$DW$60, DW_AT_type(*$C$DW$T$44)
	.dwattr $C$DW$60, DW_AT_name("CTBIR1_bit")
	.dwattr $C$DW$60, DW_AT_TI_symbol_name("CTBIR1_bit")
	.dwattr $C$DW$60, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$60, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$60, DW_AT_decl_file("/usr/share/ti/pru-software-support-package/include/am335x/pru_ctrl.h")
	.dwattr $C$DW$60, DW_AT_decl_line(0x7c)
	.dwattr $C$DW$60, DW_AT_decl_column(0x05)

	.dwattr $C$DW$T$45, DW_AT_decl_file("/usr/share/ti/pru-software-support-package/include/am335x/pru_ctrl.h")
	.dwattr $C$DW$T$45, DW_AT_decl_line(0x74)
	.dwattr $C$DW$T$45, DW_AT_decl_column(0x08)
	.dwendtag $C$DW$T$45


$C$DW$T$47	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$47, DW_AT_byte_size(0x04)
$C$DW$61	.dwtag  DW_TAG_member
	.dwattr $C$DW$61, DW_AT_type(*$C$DW$T$31)
	.dwattr $C$DW$61, DW_AT_name("CTPPR0")
	.dwattr $C$DW$61, DW_AT_TI_symbol_name("CTPPR0")
	.dwattr $C$DW$61, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$61, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$61, DW_AT_decl_file("/usr/share/ti/pru-software-support-package/include/am335x/pru_ctrl.h")
	.dwattr $C$DW$61, DW_AT_decl_line(0x82)
	.dwattr $C$DW$61, DW_AT_decl_column(0x15)

$C$DW$62	.dwtag  DW_TAG_member
	.dwattr $C$DW$62, DW_AT_type(*$C$DW$T$46)
	.dwattr $C$DW$62, DW_AT_name("CTPPR0_bit")
	.dwattr $C$DW$62, DW_AT_TI_symbol_name("CTPPR0_bit")
	.dwattr $C$DW$62, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$62, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$62, DW_AT_decl_file("/usr/share/ti/pru-software-support-package/include/am335x/pru_ctrl.h")
	.dwattr $C$DW$62, DW_AT_decl_line(0x87)
	.dwattr $C$DW$62, DW_AT_decl_column(0x05)

	.dwattr $C$DW$T$47, DW_AT_decl_file("/usr/share/ti/pru-software-support-package/include/am335x/pru_ctrl.h")
	.dwattr $C$DW$T$47, DW_AT_decl_line(0x81)
	.dwattr $C$DW$T$47, DW_AT_decl_column(0x08)
	.dwendtag $C$DW$T$47


$C$DW$T$49	.dwtag  DW_TAG_union_type
	.dwattr $C$DW$T$49, DW_AT_byte_size(0x04)
$C$DW$63	.dwtag  DW_TAG_member
	.dwattr $C$DW$63, DW_AT_type(*$C$DW$T$31)
	.dwattr $C$DW$63, DW_AT_name("CTPPR1")
	.dwattr $C$DW$63, DW_AT_TI_symbol_name("CTPPR1")
	.dwattr $C$DW$63, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$63, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$63, DW_AT_decl_file("/usr/share/ti/pru-software-support-package/include/am335x/pru_ctrl.h")
	.dwattr $C$DW$63, DW_AT_decl_line(0x8d)
	.dwattr $C$DW$63, DW_AT_decl_column(0x15)

$C$DW$64	.dwtag  DW_TAG_member
	.dwattr $C$DW$64, DW_AT_type(*$C$DW$T$48)
	.dwattr $C$DW$64, DW_AT_name("CTPPR1_bit")
	.dwattr $C$DW$64, DW_AT_TI_symbol_name("CTPPR1_bit")
	.dwattr $C$DW$64, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$64, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$64, DW_AT_decl_file("/usr/share/ti/pru-software-support-package/include/am335x/pru_ctrl.h")
	.dwattr $C$DW$64, DW_AT_decl_line(0x92)
	.dwattr $C$DW$64, DW_AT_decl_column(0x05)

	.dwattr $C$DW$T$49, DW_AT_decl_file("/usr/share/ti/pru-software-support-package/include/am335x/pru_ctrl.h")
	.dwattr $C$DW$T$49, DW_AT_decl_line(0x8c)
	.dwattr $C$DW$T$49, DW_AT_decl_column(0x08)
	.dwendtag $C$DW$T$49

$C$DW$T$2	.dwtag  DW_TAG_unspecified_type
	.dwattr $C$DW$T$2, DW_AT_name("void")

$C$DW$T$4	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$4, DW_AT_encoding(DW_ATE_boolean)
	.dwattr $C$DW$T$4, DW_AT_name("bool")
	.dwattr $C$DW$T$4, DW_AT_byte_size(0x01)

$C$DW$T$5	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$5, DW_AT_encoding(DW_ATE_signed_char)
	.dwattr $C$DW$T$5, DW_AT_name("signed char")
	.dwattr $C$DW$T$5, DW_AT_byte_size(0x01)

$C$DW$T$6	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$6, DW_AT_encoding(DW_ATE_unsigned_char)
	.dwattr $C$DW$T$6, DW_AT_name("unsigned char")
	.dwattr $C$DW$T$6, DW_AT_byte_size(0x01)

$C$DW$T$7	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$7, DW_AT_encoding(DW_ATE_signed_char)
	.dwattr $C$DW$T$7, DW_AT_name("wchar_t")
	.dwattr $C$DW$T$7, DW_AT_byte_size(0x04)

$C$DW$T$8	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$8, DW_AT_encoding(DW_ATE_signed)
	.dwattr $C$DW$T$8, DW_AT_name("short")
	.dwattr $C$DW$T$8, DW_AT_byte_size(0x02)

$C$DW$T$9	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$9, DW_AT_encoding(DW_ATE_unsigned)
	.dwattr $C$DW$T$9, DW_AT_name("unsigned short")
	.dwattr $C$DW$T$9, DW_AT_byte_size(0x02)

$C$DW$T$10	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$10, DW_AT_encoding(DW_ATE_signed)
	.dwattr $C$DW$T$10, DW_AT_name("int")
	.dwattr $C$DW$T$10, DW_AT_byte_size(0x04)

$C$DW$T$11	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$11, DW_AT_encoding(DW_ATE_unsigned)
	.dwattr $C$DW$T$11, DW_AT_name("unsigned int")
	.dwattr $C$DW$T$11, DW_AT_byte_size(0x04)

$C$DW$T$28	.dwtag  DW_TAG_typedef
	.dwattr $C$DW$T$28, DW_AT_name("uint32_t")
	.dwattr $C$DW$T$28, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$T$28, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$28, DW_AT_decl_file("/usr/share/ti/cgt-pru/include/stdint.h")
	.dwattr $C$DW$T$28, DW_AT_decl_line(0x41)
	.dwattr $C$DW$T$28, DW_AT_decl_column(0x1c)


$C$DW$T$29	.dwtag  DW_TAG_array_type
	.dwattr $C$DW$T$29, DW_AT_type(*$C$DW$T$28)
	.dwattr $C$DW$T$29, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$29, DW_AT_byte_size(0x0c)
$C$DW$65	.dwtag  DW_TAG_subrange_type
	.dwattr $C$DW$65, DW_AT_upper_bound(0x02)

	.dwendtag $C$DW$T$29

$C$DW$T$31	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$31, DW_AT_type(*$C$DW$T$28)

$C$DW$T$12	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$12, DW_AT_encoding(DW_ATE_signed)
	.dwattr $C$DW$T$12, DW_AT_name("long")
	.dwattr $C$DW$T$12, DW_AT_byte_size(0x04)

$C$DW$T$13	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$13, DW_AT_encoding(DW_ATE_unsigned)
	.dwattr $C$DW$T$13, DW_AT_name("unsigned long")
	.dwattr $C$DW$T$13, DW_AT_byte_size(0x04)

$C$DW$T$14	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$14, DW_AT_encoding(DW_ATE_signed)
	.dwattr $C$DW$T$14, DW_AT_name("long long")
	.dwattr $C$DW$T$14, DW_AT_byte_size(0x08)

$C$DW$T$15	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$15, DW_AT_encoding(DW_ATE_unsigned)
	.dwattr $C$DW$T$15, DW_AT_name("unsigned long long")
	.dwattr $C$DW$T$15, DW_AT_byte_size(0x08)

$C$DW$T$60	.dwtag  DW_TAG_typedef
	.dwattr $C$DW$T$60, DW_AT_name("uint64_t")
	.dwattr $C$DW$T$60, DW_AT_type(*$C$DW$T$15)
	.dwattr $C$DW$T$60, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$60, DW_AT_decl_file("/usr/share/ti/cgt-pru/include/stdint.h")
	.dwattr $C$DW$T$60, DW_AT_decl_line(0x53)
	.dwattr $C$DW$T$60, DW_AT_decl_column(0x20)

$C$DW$T$16	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$16, DW_AT_encoding(DW_ATE_float)
	.dwattr $C$DW$T$16, DW_AT_name("float")
	.dwattr $C$DW$T$16, DW_AT_byte_size(0x04)

$C$DW$T$17	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$17, DW_AT_encoding(DW_ATE_float)
	.dwattr $C$DW$T$17, DW_AT_name("double")
	.dwattr $C$DW$T$17, DW_AT_byte_size(0x08)

$C$DW$T$18	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$18, DW_AT_encoding(DW_ATE_float)
	.dwattr $C$DW$T$18, DW_AT_name("long double")
	.dwattr $C$DW$T$18, DW_AT_byte_size(0x08)

	.dwattr $C$DW$CU, DW_AT_language(DW_LANG_C)

;***************************************************************
;* DWARF CIE ENTRIES                                           *
;***************************************************************

$C$DW$CIE	.dwcie 14
	.dwcfi	cfa_register, 8
	.dwcfi	cfa_offset, 0
	.dwcfi	same_value, 8
	.dwcfi	same_value, 9
	.dwcfi	same_value, 10
	.dwcfi	same_value, 11
	.dwcfi	same_value, 16
	.dwcfi	same_value, 17
	.dwcfi	same_value, 18
	.dwcfi	same_value, 19
	.dwcfi	same_value, 20
	.dwcfi	same_value, 21
	.dwcfi	same_value, 22
	.dwcfi	same_value, 23
	.dwcfi	same_value, 24
	.dwcfi	same_value, 25
	.dwcfi	same_value, 26
	.dwcfi	same_value, 27
	.dwcfi	same_value, 28
	.dwcfi	same_value, 29
	.dwcfi	same_value, 30
	.dwcfi	same_value, 31
	.dwcfi	same_value, 32
	.dwcfi	same_value, 33
	.dwcfi	same_value, 34
	.dwcfi	same_value, 35
	.dwcfi	same_value, 36
	.dwcfi	same_value, 37
	.dwcfi	same_value, 38
	.dwcfi	same_value, 39
	.dwcfi	same_value, 40
	.dwcfi	same_value, 41
	.dwcfi	same_value, 42
	.dwcfi	same_value, 43
	.dwcfi	same_value, 44
	.dwcfi	same_value, 45
	.dwcfi	same_value, 46
	.dwcfi	same_value, 47
	.dwcfi	same_value, 48
	.dwcfi	same_value, 49
	.dwcfi	same_value, 50
	.dwcfi	same_value, 51
	.dwcfi	same_value, 52
	.dwcfi	same_value, 53
	.dwcfi	same_value, 54
	.dwcfi	same_value, 55
	.dwendentry

;***************************************************************
;* DWARF REGISTER MAP                                          *
;***************************************************************

$C$DW$66	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$66, DW_AT_name("R0_b0")
	.dwattr $C$DW$66, DW_AT_location[DW_OP_reg0]

$C$DW$67	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$67, DW_AT_name("R0_b1")
	.dwattr $C$DW$67, DW_AT_location[DW_OP_reg1]

$C$DW$68	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$68, DW_AT_name("R0_b2")
	.dwattr $C$DW$68, DW_AT_location[DW_OP_reg2]

$C$DW$69	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$69, DW_AT_name("R0_b3")
	.dwattr $C$DW$69, DW_AT_location[DW_OP_reg3]

$C$DW$70	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$70, DW_AT_name("R1_b0")
	.dwattr $C$DW$70, DW_AT_location[DW_OP_reg4]

$C$DW$71	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$71, DW_AT_name("R1_b1")
	.dwattr $C$DW$71, DW_AT_location[DW_OP_reg5]

$C$DW$72	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$72, DW_AT_name("R1_b2")
	.dwattr $C$DW$72, DW_AT_location[DW_OP_reg6]

$C$DW$73	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$73, DW_AT_name("R1_b3")
	.dwattr $C$DW$73, DW_AT_location[DW_OP_reg7]

$C$DW$74	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$74, DW_AT_name("R2_b0")
	.dwattr $C$DW$74, DW_AT_location[DW_OP_reg8]

$C$DW$75	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$75, DW_AT_name("R2_b1")
	.dwattr $C$DW$75, DW_AT_location[DW_OP_reg9]

$C$DW$76	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$76, DW_AT_name("R2_b2")
	.dwattr $C$DW$76, DW_AT_location[DW_OP_reg10]

$C$DW$77	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$77, DW_AT_name("R2_b3")
	.dwattr $C$DW$77, DW_AT_location[DW_OP_reg11]

$C$DW$78	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$78, DW_AT_name("R3_b0")
	.dwattr $C$DW$78, DW_AT_location[DW_OP_reg12]

$C$DW$79	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$79, DW_AT_name("R3_b1")
	.dwattr $C$DW$79, DW_AT_location[DW_OP_reg13]

$C$DW$80	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$80, DW_AT_name("R3_b2")
	.dwattr $C$DW$80, DW_AT_location[DW_OP_reg14]

$C$DW$81	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$81, DW_AT_name("R3_b3")
	.dwattr $C$DW$81, DW_AT_location[DW_OP_reg15]

$C$DW$82	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$82, DW_AT_name("R4_b0")
	.dwattr $C$DW$82, DW_AT_location[DW_OP_reg16]

$C$DW$83	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$83, DW_AT_name("R4_b1")
	.dwattr $C$DW$83, DW_AT_location[DW_OP_reg17]

$C$DW$84	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$84, DW_AT_name("R4_b2")
	.dwattr $C$DW$84, DW_AT_location[DW_OP_reg18]

$C$DW$85	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$85, DW_AT_name("R4_b3")
	.dwattr $C$DW$85, DW_AT_location[DW_OP_reg19]

$C$DW$86	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$86, DW_AT_name("R5_b0")
	.dwattr $C$DW$86, DW_AT_location[DW_OP_reg20]

$C$DW$87	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$87, DW_AT_name("R5_b1")
	.dwattr $C$DW$87, DW_AT_location[DW_OP_reg21]

$C$DW$88	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$88, DW_AT_name("R5_b2")
	.dwattr $C$DW$88, DW_AT_location[DW_OP_reg22]

$C$DW$89	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$89, DW_AT_name("R5_b3")
	.dwattr $C$DW$89, DW_AT_location[DW_OP_reg23]

$C$DW$90	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$90, DW_AT_name("R6_b0")
	.dwattr $C$DW$90, DW_AT_location[DW_OP_reg24]

$C$DW$91	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$91, DW_AT_name("R6_b1")
	.dwattr $C$DW$91, DW_AT_location[DW_OP_reg25]

$C$DW$92	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$92, DW_AT_name("R6_b2")
	.dwattr $C$DW$92, DW_AT_location[DW_OP_reg26]

$C$DW$93	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$93, DW_AT_name("R6_b3")
	.dwattr $C$DW$93, DW_AT_location[DW_OP_reg27]

$C$DW$94	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$94, DW_AT_name("R7_b0")
	.dwattr $C$DW$94, DW_AT_location[DW_OP_reg28]

$C$DW$95	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$95, DW_AT_name("R7_b1")
	.dwattr $C$DW$95, DW_AT_location[DW_OP_reg29]

$C$DW$96	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$96, DW_AT_name("R7_b2")
	.dwattr $C$DW$96, DW_AT_location[DW_OP_reg30]

$C$DW$97	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$97, DW_AT_name("R7_b3")
	.dwattr $C$DW$97, DW_AT_location[DW_OP_reg31]

$C$DW$98	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$98, DW_AT_name("R8_b0")
	.dwattr $C$DW$98, DW_AT_location[DW_OP_regx 0x20]

$C$DW$99	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$99, DW_AT_name("R8_b1")
	.dwattr $C$DW$99, DW_AT_location[DW_OP_regx 0x21]

$C$DW$100	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$100, DW_AT_name("R8_b2")
	.dwattr $C$DW$100, DW_AT_location[DW_OP_regx 0x22]

$C$DW$101	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$101, DW_AT_name("R8_b3")
	.dwattr $C$DW$101, DW_AT_location[DW_OP_regx 0x23]

$C$DW$102	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$102, DW_AT_name("R9_b0")
	.dwattr $C$DW$102, DW_AT_location[DW_OP_regx 0x24]

$C$DW$103	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$103, DW_AT_name("R9_b1")
	.dwattr $C$DW$103, DW_AT_location[DW_OP_regx 0x25]

$C$DW$104	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$104, DW_AT_name("R9_b2")
	.dwattr $C$DW$104, DW_AT_location[DW_OP_regx 0x26]

$C$DW$105	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$105, DW_AT_name("R9_b3")
	.dwattr $C$DW$105, DW_AT_location[DW_OP_regx 0x27]

$C$DW$106	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$106, DW_AT_name("R10_b0")
	.dwattr $C$DW$106, DW_AT_location[DW_OP_regx 0x28]

$C$DW$107	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$107, DW_AT_name("R10_b1")
	.dwattr $C$DW$107, DW_AT_location[DW_OP_regx 0x29]

$C$DW$108	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$108, DW_AT_name("R10_b2")
	.dwattr $C$DW$108, DW_AT_location[DW_OP_regx 0x2a]

$C$DW$109	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$109, DW_AT_name("R10_b3")
	.dwattr $C$DW$109, DW_AT_location[DW_OP_regx 0x2b]

$C$DW$110	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$110, DW_AT_name("R11_b0")
	.dwattr $C$DW$110, DW_AT_location[DW_OP_regx 0x2c]

$C$DW$111	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$111, DW_AT_name("R11_b1")
	.dwattr $C$DW$111, DW_AT_location[DW_OP_regx 0x2d]

$C$DW$112	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$112, DW_AT_name("R11_b2")
	.dwattr $C$DW$112, DW_AT_location[DW_OP_regx 0x2e]

$C$DW$113	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$113, DW_AT_name("R11_b3")
	.dwattr $C$DW$113, DW_AT_location[DW_OP_regx 0x2f]

$C$DW$114	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$114, DW_AT_name("R12_b0")
	.dwattr $C$DW$114, DW_AT_location[DW_OP_regx 0x30]

$C$DW$115	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$115, DW_AT_name("R12_b1")
	.dwattr $C$DW$115, DW_AT_location[DW_OP_regx 0x31]

$C$DW$116	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$116, DW_AT_name("R12_b2")
	.dwattr $C$DW$116, DW_AT_location[DW_OP_regx 0x32]

$C$DW$117	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$117, DW_AT_name("R12_b3")
	.dwattr $C$DW$117, DW_AT_location[DW_OP_regx 0x33]

$C$DW$118	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$118, DW_AT_name("R13_b0")
	.dwattr $C$DW$118, DW_AT_location[DW_OP_regx 0x34]

$C$DW$119	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$119, DW_AT_name("R13_b1")
	.dwattr $C$DW$119, DW_AT_location[DW_OP_regx 0x35]

$C$DW$120	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$120, DW_AT_name("R13_b2")
	.dwattr $C$DW$120, DW_AT_location[DW_OP_regx 0x36]

$C$DW$121	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$121, DW_AT_name("R13_b3")
	.dwattr $C$DW$121, DW_AT_location[DW_OP_regx 0x37]

$C$DW$122	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$122, DW_AT_name("R14_b0")
	.dwattr $C$DW$122, DW_AT_location[DW_OP_regx 0x38]

$C$DW$123	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$123, DW_AT_name("R14_b1")
	.dwattr $C$DW$123, DW_AT_location[DW_OP_regx 0x39]

$C$DW$124	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$124, DW_AT_name("R14_b2")
	.dwattr $C$DW$124, DW_AT_location[DW_OP_regx 0x3a]

$C$DW$125	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$125, DW_AT_name("R14_b3")
	.dwattr $C$DW$125, DW_AT_location[DW_OP_regx 0x3b]

$C$DW$126	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$126, DW_AT_name("R15_b0")
	.dwattr $C$DW$126, DW_AT_location[DW_OP_regx 0x3c]

$C$DW$127	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$127, DW_AT_name("R15_b1")
	.dwattr $C$DW$127, DW_AT_location[DW_OP_regx 0x3d]

$C$DW$128	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$128, DW_AT_name("R15_b2")
	.dwattr $C$DW$128, DW_AT_location[DW_OP_regx 0x3e]

$C$DW$129	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$129, DW_AT_name("R15_b3")
	.dwattr $C$DW$129, DW_AT_location[DW_OP_regx 0x3f]

$C$DW$130	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$130, DW_AT_name("R16_b0")
	.dwattr $C$DW$130, DW_AT_location[DW_OP_regx 0x40]

$C$DW$131	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$131, DW_AT_name("R16_b1")
	.dwattr $C$DW$131, DW_AT_location[DW_OP_regx 0x41]

$C$DW$132	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$132, DW_AT_name("R16_b2")
	.dwattr $C$DW$132, DW_AT_location[DW_OP_regx 0x42]

$C$DW$133	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$133, DW_AT_name("R16_b3")
	.dwattr $C$DW$133, DW_AT_location[DW_OP_regx 0x43]

$C$DW$134	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$134, DW_AT_name("R17_b0")
	.dwattr $C$DW$134, DW_AT_location[DW_OP_regx 0x44]

$C$DW$135	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$135, DW_AT_name("R17_b1")
	.dwattr $C$DW$135, DW_AT_location[DW_OP_regx 0x45]

$C$DW$136	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$136, DW_AT_name("R17_b2")
	.dwattr $C$DW$136, DW_AT_location[DW_OP_regx 0x46]

$C$DW$137	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$137, DW_AT_name("R17_b3")
	.dwattr $C$DW$137, DW_AT_location[DW_OP_regx 0x47]

$C$DW$138	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$138, DW_AT_name("R18_b0")
	.dwattr $C$DW$138, DW_AT_location[DW_OP_regx 0x48]

$C$DW$139	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$139, DW_AT_name("R18_b1")
	.dwattr $C$DW$139, DW_AT_location[DW_OP_regx 0x49]

$C$DW$140	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$140, DW_AT_name("R18_b2")
	.dwattr $C$DW$140, DW_AT_location[DW_OP_regx 0x4a]

$C$DW$141	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$141, DW_AT_name("R18_b3")
	.dwattr $C$DW$141, DW_AT_location[DW_OP_regx 0x4b]

$C$DW$142	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$142, DW_AT_name("R19_b0")
	.dwattr $C$DW$142, DW_AT_location[DW_OP_regx 0x4c]

$C$DW$143	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$143, DW_AT_name("R19_b1")
	.dwattr $C$DW$143, DW_AT_location[DW_OP_regx 0x4d]

$C$DW$144	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$144, DW_AT_name("R19_b2")
	.dwattr $C$DW$144, DW_AT_location[DW_OP_regx 0x4e]

$C$DW$145	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$145, DW_AT_name("R19_b3")
	.dwattr $C$DW$145, DW_AT_location[DW_OP_regx 0x4f]

$C$DW$146	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$146, DW_AT_name("R20_b0")
	.dwattr $C$DW$146, DW_AT_location[DW_OP_regx 0x50]

$C$DW$147	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$147, DW_AT_name("R20_b1")
	.dwattr $C$DW$147, DW_AT_location[DW_OP_regx 0x51]

$C$DW$148	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$148, DW_AT_name("R20_b2")
	.dwattr $C$DW$148, DW_AT_location[DW_OP_regx 0x52]

$C$DW$149	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$149, DW_AT_name("R20_b3")
	.dwattr $C$DW$149, DW_AT_location[DW_OP_regx 0x53]

$C$DW$150	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$150, DW_AT_name("R21_b0")
	.dwattr $C$DW$150, DW_AT_location[DW_OP_regx 0x54]

$C$DW$151	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$151, DW_AT_name("R21_b1")
	.dwattr $C$DW$151, DW_AT_location[DW_OP_regx 0x55]

$C$DW$152	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$152, DW_AT_name("R21_b2")
	.dwattr $C$DW$152, DW_AT_location[DW_OP_regx 0x56]

$C$DW$153	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$153, DW_AT_name("R21_b3")
	.dwattr $C$DW$153, DW_AT_location[DW_OP_regx 0x57]

$C$DW$154	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$154, DW_AT_name("R22_b0")
	.dwattr $C$DW$154, DW_AT_location[DW_OP_regx 0x58]

$C$DW$155	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$155, DW_AT_name("R22_b1")
	.dwattr $C$DW$155, DW_AT_location[DW_OP_regx 0x59]

$C$DW$156	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$156, DW_AT_name("R22_b2")
	.dwattr $C$DW$156, DW_AT_location[DW_OP_regx 0x5a]

$C$DW$157	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$157, DW_AT_name("R22_b3")
	.dwattr $C$DW$157, DW_AT_location[DW_OP_regx 0x5b]

$C$DW$158	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$158, DW_AT_name("R23_b0")
	.dwattr $C$DW$158, DW_AT_location[DW_OP_regx 0x5c]

$C$DW$159	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$159, DW_AT_name("R23_b1")
	.dwattr $C$DW$159, DW_AT_location[DW_OP_regx 0x5d]

$C$DW$160	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$160, DW_AT_name("R23_b2")
	.dwattr $C$DW$160, DW_AT_location[DW_OP_regx 0x5e]

$C$DW$161	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$161, DW_AT_name("R23_b3")
	.dwattr $C$DW$161, DW_AT_location[DW_OP_regx 0x5f]

$C$DW$162	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$162, DW_AT_name("R24_b0")
	.dwattr $C$DW$162, DW_AT_location[DW_OP_regx 0x60]

$C$DW$163	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$163, DW_AT_name("R24_b1")
	.dwattr $C$DW$163, DW_AT_location[DW_OP_regx 0x61]

$C$DW$164	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$164, DW_AT_name("R24_b2")
	.dwattr $C$DW$164, DW_AT_location[DW_OP_regx 0x62]

$C$DW$165	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$165, DW_AT_name("R24_b3")
	.dwattr $C$DW$165, DW_AT_location[DW_OP_regx 0x63]

$C$DW$166	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$166, DW_AT_name("R25_b0")
	.dwattr $C$DW$166, DW_AT_location[DW_OP_regx 0x64]

$C$DW$167	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$167, DW_AT_name("R25_b1")
	.dwattr $C$DW$167, DW_AT_location[DW_OP_regx 0x65]

$C$DW$168	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$168, DW_AT_name("R25_b2")
	.dwattr $C$DW$168, DW_AT_location[DW_OP_regx 0x66]

$C$DW$169	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$169, DW_AT_name("R25_b3")
	.dwattr $C$DW$169, DW_AT_location[DW_OP_regx 0x67]

$C$DW$170	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$170, DW_AT_name("R26_b0")
	.dwattr $C$DW$170, DW_AT_location[DW_OP_regx 0x68]

$C$DW$171	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$171, DW_AT_name("R26_b1")
	.dwattr $C$DW$171, DW_AT_location[DW_OP_regx 0x69]

$C$DW$172	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$172, DW_AT_name("R26_b2")
	.dwattr $C$DW$172, DW_AT_location[DW_OP_regx 0x6a]

$C$DW$173	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$173, DW_AT_name("R26_b3")
	.dwattr $C$DW$173, DW_AT_location[DW_OP_regx 0x6b]

$C$DW$174	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$174, DW_AT_name("R27_b0")
	.dwattr $C$DW$174, DW_AT_location[DW_OP_regx 0x6c]

$C$DW$175	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$175, DW_AT_name("R27_b1")
	.dwattr $C$DW$175, DW_AT_location[DW_OP_regx 0x6d]

$C$DW$176	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$176, DW_AT_name("R27_b2")
	.dwattr $C$DW$176, DW_AT_location[DW_OP_regx 0x6e]

$C$DW$177	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$177, DW_AT_name("R27_b3")
	.dwattr $C$DW$177, DW_AT_location[DW_OP_regx 0x6f]

$C$DW$178	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$178, DW_AT_name("R28_b0")
	.dwattr $C$DW$178, DW_AT_location[DW_OP_regx 0x70]

$C$DW$179	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$179, DW_AT_name("R28_b1")
	.dwattr $C$DW$179, DW_AT_location[DW_OP_regx 0x71]

$C$DW$180	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$180, DW_AT_name("R28_b2")
	.dwattr $C$DW$180, DW_AT_location[DW_OP_regx 0x72]

$C$DW$181	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$181, DW_AT_name("R28_b3")
	.dwattr $C$DW$181, DW_AT_location[DW_OP_regx 0x73]

$C$DW$182	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$182, DW_AT_name("R29_b0")
	.dwattr $C$DW$182, DW_AT_location[DW_OP_regx 0x74]

$C$DW$183	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$183, DW_AT_name("R29_b1")
	.dwattr $C$DW$183, DW_AT_location[DW_OP_regx 0x75]

$C$DW$184	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$184, DW_AT_name("R29_b2")
	.dwattr $C$DW$184, DW_AT_location[DW_OP_regx 0x76]

$C$DW$185	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$185, DW_AT_name("R29_b3")
	.dwattr $C$DW$185, DW_AT_location[DW_OP_regx 0x77]

$C$DW$186	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$186, DW_AT_name("R30_b0")
	.dwattr $C$DW$186, DW_AT_location[DW_OP_regx 0x78]

$C$DW$187	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$187, DW_AT_name("R30_b1")
	.dwattr $C$DW$187, DW_AT_location[DW_OP_regx 0x79]

$C$DW$188	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$188, DW_AT_name("R30_b2")
	.dwattr $C$DW$188, DW_AT_location[DW_OP_regx 0x7a]

$C$DW$189	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$189, DW_AT_name("R30_b3")
	.dwattr $C$DW$189, DW_AT_location[DW_OP_regx 0x7b]

$C$DW$190	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$190, DW_AT_name("R31_b0")
	.dwattr $C$DW$190, DW_AT_location[DW_OP_regx 0x7c]

$C$DW$191	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$191, DW_AT_name("R31_b1")
	.dwattr $C$DW$191, DW_AT_location[DW_OP_regx 0x7d]

$C$DW$192	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$192, DW_AT_name("R31_b2")
	.dwattr $C$DW$192, DW_AT_location[DW_OP_regx 0x7e]

$C$DW$193	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$193, DW_AT_name("R31_b3")
	.dwattr $C$DW$193, DW_AT_location[DW_OP_regx 0x7f]

	.dwendtag $C$DW$CU

