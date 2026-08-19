
####################################################################################
# Constraints
# ----------------------------------------------------------------------------
#
# 0. Design Compiler variables
#
# 1. Master Clock Definitions
#
# 2. Generated Clock Definitions
#
# 3. Clock Uncertainties
#
# 4. Clock Latencies 
#
# 5. Clock Relationships
#
# 6. #set input/output delay on ports
#
# 7. Driving cells
#
# 8. Output load

####################################################################################
           #########################################################
                  #### Section 0 : DC Variables ####
           #########################################################
#################################################################################### 

# Prevent assign statements in the generated netlist (must be applied before compile command)
set_fix_multiple_port_nets -all -buffer_constants -feedthroughs

####################################################################################
           #########################################################
                  #### Section 1 : Clock Definition ####
           #########################################################
#################################################################################### 
# 1. Master Clock Definitions 
# 2. Generated Clock Definitions
# 3. Clock Latencies
# 4. Clock Uncertainties
# 4. Clock Transitions
####################################################################################

# REF CLK = 50 MHz
set CLK_REF_NAME REF_CLK
set CLK_PER 20

# UART CLK = 3.686 MHz
set CLK_UART_NAME UART_CLK
set CLK_UART_PER 271.267

# uncertainty
set CLK_SETUP_SKEW 0.2
set CLK_HOLD_SKEW 0.1

# transition
set CLK_RISE 0.05
set CLK_FALL 0.05


#1. Master Clocks

create_clock -name $CLK_REF_NAME -period $CLK_PER [get_ports REF_CLK]
set_clock_uncertainty -setup $CLK_SETUP_SKEW [get_clocks $CLK_REF_NAME]
set_clock_uncertainty -hold $CLK_HOLD_SKEW  [get_clocks $CLK_REF_NAME]
set_clock_transition -rise $CLK_RISE  [get_clocks $CLK_REF_NAME]
set_clock_transition -fall $CLK_FALL  [get_clocks $CLK_REF_NAME]

create_clock -name $CLK_UART_NAME -period $CLK_UART_PER [get_ports UART_CLK]
set_clock_uncertainty -setup $CLK_SETUP_SKEW [get_clocks $CLK_UART_NAME]
set_clock_uncertainty -hold $CLK_HOLD_SKEW  [get_clocks $CLK_UART_NAME]
set_clock_transition -rise $CLK_RISE  [get_clocks $CLK_UART_NAME]
set_clock_transition -fall $CLK_FALL  [get_clocks $CLK_UART_NAME]

#For DFT

set DFT_CLK_NAME DFTCLK
set DFT_CLK_PER 100
set DFT_CLK_SETUP_SKEW 0.025
set DFT_CLK_HOLD_SKEW 0.01
set DFT_CLK_RISE 0.05
set DFT_CLK_FALL 0.05

create_clock -name $DFT_CLK_NAME -period $DFT_CLK_PER [get_ports scan_clk]
set_clock_uncertainty -setup $DFT_CLK_SETUP_SKEW [get_clocks $DFT_CLK_NAME]
set_clock_uncertainty -hold $DFT_CLK_HOLD_SKEW  [get_clocks $DFT_CLK_NAME]
set_clock_transition -rise $DFT_CLK_RISE  [get_clocks $DFT_CLK_NAME]
set_clock_transition -fall $DFT_CLK_FALL  [get_clocks $DFT_CLK_NAME]

#2. Generated clocks


create_generated_clock -master_clock $CLK_UART_NAME -source [get_ports UART_CLK] \
                       -name "UART_RX_CLK" [get_ports Clk_Div_RX_Prescale/o_div_clk] -divide_by 1

set_clock_uncertainty -setup $CLK_SETUP_SKEW [get_clocks "UART_RX_CLK"]
set_clock_uncertainty -hold $CLK_HOLD_SKEW   [get_clocks "UART_RX_CLK"]


create_generated_clock -master_clock $CLK_UART_NAME -source [get_ports UART_CLK] \
                       -name "UART_TX_CLK" [get_ports Clk_Div_TX_CONS/o_div_clk] -divide_by 32

set_clock_uncertainty -setup $CLK_SETUP_SKEW [get_clocks "UART_TX_CLK"]
set_clock_uncertainty -hold $CLK_HOLD_SKEW   [get_clocks "UART_TX_CLK"]


create_generated_clock -master_clock $CLK_REF_NAME -source [get_ports REF_CLK] \
                       -name "ALU_CLK" [get_ports U_CLK_GATE/GATED_CLK] -divide_by 1

set_clock_uncertainty -setup $CLK_SETUP_SKEW [get_clocks "ALU_CLK"]
set_clock_uncertainty -hold $CLK_HOLD_SKEW   [get_clocks "ALU_CLK"]


set_dont_touch_network [get_clocks "$CLK_REF_NAME $CLK_UART_NAME ALU_CLK UART_RX_CLK UART_TX_CLK $DFT_CLK_NAME"]


####################################################################################
           #########################################################
             #### Section 2 : Clocks Relationship ####
           #########################################################
####################################################################################

set_clock_groups -asynchronous -group [get_clocks "$CLK_REF_NAME ALU_CLK"]  \
                               -group [get_clocks "$CLK_UART_NAME UART_TX_CLK UART_RX_CLK"] \
							   -group [get_clocks "$DFT_CLK_NAME"]	

####################################################################################
           #########################################################
             #### Section 3 : set input/output delay on ports ####
           #########################################################
####################################################################################

set in_delay_tx  [expr 0.2*$CLK_UART_PER*32]
set out_delay_tx [expr 0.2*$CLK_UART_PER*32]

set in_delay_rx  [expr 0.2*$CLK_UART_PER]
set out_delay_rx [expr 0.2*$CLK_UART_PER]

set in_delay_dft  [expr 0.2*$DFT_CLK_PER]
set out_delay_dft [expr 0.2*$DFT_CLK_PER]

#Constrain Input Paths
set_input_delay $in_delay_rx -clock UART_RX_CLK [get_ports UART_RX_IN]

#Constrain Output Paths
set_output_delay $out_delay_tx -clock UART_TX_CLK [get_ports UART_TX_O]
set_output_delay $out_delay_rx -clock UART_RX_CLK [get_ports parity_error]
set_output_delay $out_delay_rx -clock UART_RX_CLK [get_ports framing_error]

# DFT

set_input_delay $in_delay_dft -clock $DFT_CLK_NAME [get_ports test_mode]
set_input_delay $in_delay_dft -clock $DFT_CLK_NAME [get_ports SI]
set_input_delay $in_delay_dft -clock $DFT_CLK_NAME [get_ports SE]

set_output_delay $out_delay_dft -clock $DFT_CLK_NAME [get_ports SO]

####################################################################################
           #########################################################
                  #### Section 4 : Driving cells ####
           #########################################################
####################################################################################

set_driving_cell -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -lib_cell BUFX2M -pin Y [get_ports UART_RX_IN]

# DFT

set_driving_cell -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -lib_cell BUFX2M -pin Y [get_ports test_mode]
set_driving_cell -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -lib_cell BUFX2M -pin Y [get_ports SI]
set_driving_cell -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -lib_cell BUFX2M -pin Y [get_ports SE]

####################################################################################
           #########################################################
                  #### Section 5 : Output load ####
           #########################################################
####################################################################################

set_load 0.1 [get_ports UART_TX_O]
set_load 0.1 [get_ports parity_error]
set_load 0.1 [get_ports framing_error]

# DFT

set_load 0.1 [get_ports SO]

####################################################################################
           #########################################################
                 #### Section 6 : Operating Condition ####
           #########################################################
####################################################################################

# Define the Worst Library for Max(#setup) analysis
# Define the Best Library for Min(hold) analysis

set_operating_conditions -min_library "scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c" -min "scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c" -max_library "scmetro_tsmc_cl013g_rvt_ss_1p08v_125c" -max "scmetro_tsmc_cl013g_rvt_ss_1p08v_125c"

####################################################################################
           #########################################################
                  #### Section 7 : wireload Model ####
           #########################################################
####################################################################################

#set_wire_load_model -name tsmc13_wl20 -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c

####################################################################################
           #########################################################
                  #### Section 8 : set_case_analysis ####
           #########################################################
####################################################################################

set_case_analysis 1 [get_port test_mode]

####################################################################################

