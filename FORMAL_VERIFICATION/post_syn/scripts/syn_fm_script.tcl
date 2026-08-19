
########################### Define Top Module ############################
                                                   
set top_module SYS_TOP

######################### Formality Setup File ###########################

set synopsys_auto_setup true

set_svf "/home/IC/FINAL_PROJECT/syn/SYS_TOP.svf"


set SSLIB "/home/IC/tsmc_fb_cl013g_sc/aci/sc-m/synopsys/scmetro_tsmc_cl013g_rvt_ss_1p08v_125c.db"
set TTLIB "/home/IC/tsmc_fb_cl013g_sc/aci/sc-m/synopsys/scmetro_tsmc_cl013g_rvt_tt_1p2v_25c.db"
set FFLIB "/home/IC/tsmc_fb_cl013g_sc/aci/sc-m/synopsys/scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c.db"

######################### Reference Container ############################

## Read Reference technology libraries

read_db -container Ref [list $SSLIB $TTLIB $FFLIB]

## Read Reference Design Files

read_verilog -container Ref "/home/IC/FINAL_PROJECT/rtl/ALU/ALU.v"
read_verilog -container Ref "/home/IC/FINAL_PROJECT/rtl/ASYNC_FIFO/ASYNC_FIFO.v"
read_verilog -container Ref "/home/IC/FINAL_PROJECT/rtl/ASYNC_FIFO/FIFO_MEM_CNTRL.v"
read_verilog -container Ref "/home/IC/FINAL_PROJECT/rtl/ASYNC_FIFO/FIFO_RD.v"
read_verilog -container Ref "/home/IC/FINAL_PROJECT/rtl/ASYNC_FIFO/FIFO_WR.v"
read_verilog -container Ref "/home/IC/FINAL_PROJECT/rtl/ASYNC_FIFO/bit_sync.v"
read_verilog -container Ref "/home/IC/FINAL_PROJECT/rtl/CLKDIV_MUX/CLKDIV_MUX.v"
read_verilog -container Ref "/home/IC/FINAL_PROJECT/rtl/CLOCK_DIV/ClkDiv.v"
read_verilog -container Ref "/home/IC/FINAL_PROJECT/rtl/CLK_GATING/CLK_GATE.v"
read_verilog -container Ref "/home/IC/FINAL_PROJECT/rtl/DATA_SYNC/DATA_SYNC.v"
read_verilog -container Ref "/home/IC/FINAL_PROJECT/rtl/PULSE_GEN/PULSE_GEN.v"
read_verilog -container Ref "/home/IC/FINAL_PROJECT/rtl/RegFile/RegFile.v"
read_verilog -container Ref "/home/IC/FINAL_PROJECT/rtl/RST_SYNC/RST_SYNC.v"
read_verilog -container Ref "/home/IC/FINAL_PROJECT/rtl/SYS_CONTROL/SYS_CTRL.v"
read_verilog -container Ref "/home/IC/FINAL_PROJECT/rtl/SYS_TOP/SYS_TOP.v"
read_verilog -container Ref "/home/IC/FINAL_PROJECT/rtl/UART/UART_RX/DATA_SAMPLING.v"
read_verilog -container Ref "/home/IC/FINAL_PROJECT/rtl/UART/UART_RX/DESERIALIZER.v"
read_verilog -container Ref "/home/IC/FINAL_PROJECT/rtl/UART/UART_RX/EDGE_BIT_COUNTER.v"
read_verilog -container Ref "/home/IC/FINAL_PROJECT/rtl/UART/UART_RX/FSM.v"
read_verilog -container Ref "/home/IC/FINAL_PROJECT/rtl/UART/UART_RX/PAR_CHECK.v"
read_verilog -container Ref "/home/IC/FINAL_PROJECT/rtl/UART/UART_RX/START_CHECK.v"
read_verilog -container Ref "/home/IC/FINAL_PROJECT/rtl/UART/UART_RX/STOP_CHECK.v"
read_verilog -container Ref "/home/IC/FINAL_PROJECT/rtl/UART/UART_RX/UART_RX.v"
read_verilog -container Ref "/home/IC/FINAL_PROJECT/rtl/UART/UART_TX/FSM_tx.v"
read_verilog -container Ref "/home/IC/FINAL_PROJECT/rtl/UART/UART_TX/MUX.v"
read_verilog -container Ref "/home/IC/FINAL_PROJECT/rtl/UART/UART_TX/PARITY_CALC.v"
read_verilog -container Ref "/home/IC/FINAL_PROJECT/rtl/UART/UART_TX/SERIALIZER.v"
read_verilog -container Ref "/home/IC/FINAL_PROJECT/rtl/UART/UART_TX/UART_TX.v"
read_verilog -container Ref "/home/IC/FINAL_PROJECT/rtl/UART/UART_TOP/UART_TOP.v"


## set the top Reference Design 

set_reference_design $top_module
set_top $top_module

######################## Implementation Container #########################

## Read Implementation technology libraries

read_db -container Imp [list $SSLIB $TTLIB $FFLIB]

## Read Implementation Design Files
 
read_verilog -container Imp -netlist "/home/IC/FINAL_PROJECT/syn/netlists/SYS_TOP.v"

## set the top Implementation Design

set_implementation_design $top_module
set_top $top_module

## matching Compare points
match

## verify
set successful [verify]
if {!$successful} {
diagnose
analyze_points -failing
}

report_passing_points > "reports/passing_points.rpt"
report_failing_points > "reports/failing_points.rpt"
report_aborted_points > "reports/aborted_points.rpt"
report_unverified_points > "reports/unverified_points.rpt"


#start_gui
