
########################### Define Top Module ############################
                                                   
set top_module SYS_TOP

######################### Formality Setup File ###########################

set synopsys_auto_setup true

set_svf "/home/IC/FINAL_PROJECT/syn_dft/SYS_TOP.svf"


set SSLIB "/home/IC/tsmc_fb_cl013g_sc/aci/sc-m/synopsys/scmetro_tsmc_cl013g_rvt_ss_1p08v_125c.db"
set TTLIB "/home/IC/tsmc_fb_cl013g_sc/aci/sc-m/synopsys/scmetro_tsmc_cl013g_rvt_tt_1p2v_25c.db"
set FFLIB "/home/IC/tsmc_fb_cl013g_sc/aci/sc-m/synopsys/scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c.db"

######################### Reference Container ############################

## Read Reference technology libraries

read_db -container Ref [list $SSLIB $TTLIB $FFLIB]

## Read Reference Design Files

read_verilog "/home/IC/FINAL_PROJECT/rtl_dft/DFT_MUX/mux2X1.v"
read_verilog "/home/IC/FINAL_PROJECT/rtl_dft/RST_SYNC/RST_SYNC.v"
read_verilog "/home/IC/FINAL_PROJECT/rtl_dft/CLOCK_DIV/ClkDiv.v"
read_verilog "/home/IC/FINAL_PROJECT/rtl_dft/SYS_CONTROL/SYS_CTRL.v"
read_verilog "/home/IC/FINAL_PROJECT/rtl_dft/CLKDIV_MUX/CLKDIV_MUX.v"
read_verilog "/home/IC/FINAL_PROJECT/rtl_dft/SYS_TOP/SYS_TOP_dft.v"
read_verilog "/home/IC/FINAL_PROJECT/rtl_dft/CLK_GATING/CLK_GATE.v"
read_verilog "/home/IC/FINAL_PROJECT/rtl_dft/UART/UART_TX/FSM_tx.v"
read_verilog "/home/IC/FINAL_PROJECT/rtl_dft/UART/UART_TX/SERIALIZER.v"
read_verilog "/home/IC/FINAL_PROJECT/rtl_dft/UART/UART_TX/MUX.v"
read_verilog "/home/IC/FINAL_PROJECT/rtl_dft/UART/UART_TX/UART_TX.v"
read_verilog "/home/IC/FINAL_PROJECT/rtl_dft/UART/UART_TX/PARITY_CALC.v"
read_verilog "/home/IC/FINAL_PROJECT/rtl_dft/UART/UART_RX/FSM.v"
read_verilog "/home/IC/FINAL_PROJECT/rtl_dft/UART/UART_RX/EDGE_BIT_COUNTER.v"
read_verilog "/home/IC/FINAL_PROJECT/rtl_dft/UART/UART_RX/DATA_SAMPLING.v"
read_verilog "/home/IC/FINAL_PROJECT/rtl_dft/UART/UART_RX/UART_RX.v"
read_verilog "/home/IC/FINAL_PROJECT/rtl_dft/UART/UART_RX/PAR_CHECK.v"
read_verilog "/home/IC/FINAL_PROJECT/rtl_dft/UART/UART_RX/DESERIALIZER.v"
read_verilog "/home/IC/FINAL_PROJECT/rtl_dft/UART/UART_RX/STOP_CHECK.v"
read_verilog "/home/IC/FINAL_PROJECT/rtl_dft/UART/UART_RX/START_CHECK.v"
read_verilog "/home/IC/FINAL_PROJECT/rtl_dft/UART/UART_TOP/UART_TOP.v"
read_verilog "/home/IC/FINAL_PROJECT/rtl_dft/ASYNC_FIFO/bit_sync.v"
read_verilog "/home/IC/FINAL_PROJECT/rtl_dft/ASYNC_FIFO/FIFO_WR.v"
read_verilog "/home/IC/FINAL_PROJECT/rtl_dft/ASYNC_FIFO/FIFO_MEM_CNTRL.v"
read_verilog "/home/IC/FINAL_PROJECT/rtl_dft/ASYNC_FIFO/ASYNC_FIFO.v"
read_verilog "/home/IC/FINAL_PROJECT/rtl_dft/ASYNC_FIFO/FIFO_RD.v"
read_verilog "/home/IC/FINAL_PROJECT/rtl_dft/RegFile/RegFile.v"
read_verilog "/home/IC/FINAL_PROJECT/rtl_dft/ALU/ALU.v"
read_verilog "/home/IC/FINAL_PROJECT/rtl_dft/DATA_SYNC/DATA_SYNC.v"
read_verilog "/home/IC/FINAL_PROJECT/rtl_dft/PULSE_GEN/PULSE_GEN.v"


## set the top Reference Design 

set_reference_design $top_module
set_top $top_module

######################## Implementation Container #########################

## Read Implementation technology libraries

read_db -container Imp [list $SSLIB $TTLIB $FFLIB]

## Read Implementation Design Files
 
read_verilog -container Imp -netlist "/home/IC/FINAL_PROJECT/syn_dft/netlists/SYS_TOP.v"

## set the top Implementation Design

set_implementation_design $top_module
set_top $top_module


############################### Don't verify #################################

# do not verify scan in & scan out ports as a compare point as it is existed only after synthesis and not existed in the RTL

#scan in
set_dont_verify_points -type port Ref:/WORK/*/*SI*
set_dont_verify_points -type port Imp:/WORK/*/*SI*

#scan_out
set_dont_verify_points -type port Ref:/WORK/*/*SO*
set_dont_verify_points -type port Imp:/WORK/*/*SO*


############################### constants #####################################

# all atpg enable(test_mode, scan_enable) are zero during formal compare

#test_mode
set_constant Ref:/WORK/*/test_mode 0
set_constant Imp:/WORK/*/test_mode 0

#scan_enable
set_constant Ref:/WORK/*/SE 0
set_constant Imp:/WORK/*/SE 0



########################### matching Compare points ##########################

match

################################# verify #####################################

set successful [verify]
if {!$successful} {
diagnose
analyze_points -failing
}

report_passing_points > "reports/passing_points.rpt"
report_failing_points > "reports/failing_points.rpt"
report_aborted_points > "reports/aborted_points.rpt"
report_unverified_points > "reports/unverified_points.rpt"


start_gui

