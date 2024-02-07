proc start_step { step } {
  set stopFile ".stop.rst"
  if {[file isfile .stop.rst]} {
    puts ""
    puts "*** Halting run - EA reset detected ***"
    puts ""
    puts ""
    return -code error
  }
  set beginFile ".$step.begin.rst"
  set platform "$::tcl_platform(platform)"
  set user "$::tcl_platform(user)"
  set pid [pid]
  set host ""
  if { [string equal $platform unix] } {
    if { [info exist ::env(HOSTNAME)] } {
      set host $::env(HOSTNAME)
    }
  } else {
    if { [info exist ::env(COMPUTERNAME)] } {
      set host $::env(COMPUTERNAME)
    }
  }
  set ch [open $beginFile w]
  puts $ch "<?xml version=\"1.0\"?>"
  puts $ch "<ProcessHandle Version=\"1\" Minor=\"0\">"
  puts $ch "    <Process Command=\".planAhead.\" Owner=\"$user\" Host=\"$host\" Pid=\"$pid\">"
  puts $ch "    </Process>"
  puts $ch "</ProcessHandle>"
  close $ch
}

proc end_step { step } {
  set endFile ".$step.end.rst"
  set ch [open $endFile w]
  close $ch
}

proc step_failed { step } {
  set endFile ".$step.error.rst"
  set ch [open $endFile w]
  close $ch
}

set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000

start_step init_design
set ACTIVE_STEP init_design
set rc [catch {
  create_msg_db init_design.pb
  set_param xicom.use_bs_reader 1
  create_project -in_memory -part xc7a35tcpg236-1
  set_property board_part digilentinc.com:cmod_a7-35t:part0:1.1 [current_project]
  set_property design_mode GateLvl [current_fileset]
  set_param project.singleFileAddWarning.threshold 0
  set_property webtalk.parent_dir D:/research/Jupyter/release/fly-olfactory-network-fpga/PNAS/code_and_data/vivado_projects/no_APL/no_APL.cache/wt [current_project]
  set_property parent.project_path D:/research/Jupyter/release/fly-olfactory-network-fpga/PNAS/code_and_data/vivado_projects/no_APL/no_APL.xpr [current_project]
  set_property ip_output_repo D:/research/Jupyter/release/fly-olfactory-network-fpga/PNAS/code_and_data/vivado_projects/no_APL/no_APL.cache/ip [current_project]
  set_property ip_cache_permissions {read write} [current_project]
  set_property XPM_LIBRARIES {XPM_CDC XPM_MEMORY} [current_project]
  add_files -quiet D:/research/Jupyter/release/fly-olfactory-network-fpga/PNAS/code_and_data/vivado_projects/no_APL/no_APL.runs/synth_1/main.dcp
  add_files -quiet d:/research/Jupyter/release/fly-olfactory-network-fpga/PNAS/code_and_data/vivado_projects/no_APL/no_APL.srcs/sources_1/ip/blk_mem_q/blk_mem_q.dcp
  set_property netlist_only true [get_files d:/research/Jupyter/release/fly-olfactory-network-fpga/PNAS/code_and_data/vivado_projects/no_APL/no_APL.srcs/sources_1/ip/blk_mem_q/blk_mem_q.dcp]
  add_files -quiet d:/research/Jupyter/release/fly-olfactory-network-fpga/PNAS/code_and_data/vivado_projects/no_APL/no_APL.srcs/sources_1/ip/clk_generator/clk_generator.dcp
  set_property netlist_only true [get_files d:/research/Jupyter/release/fly-olfactory-network-fpga/PNAS/code_and_data/vivado_projects/no_APL/no_APL.srcs/sources_1/ip/clk_generator/clk_generator.dcp]
  add_files -quiet d:/research/Jupyter/release/fly-olfactory-network-fpga/PNAS/code_and_data/vivado_projects/no_APL/no_APL.srcs/sources_1/ip/blk_mem_v/blk_mem_v.dcp
  set_property netlist_only true [get_files d:/research/Jupyter/release/fly-olfactory-network-fpga/PNAS/code_and_data/vivado_projects/no_APL/no_APL.srcs/sources_1/ip/blk_mem_v/blk_mem_v.dcp]
  add_files -quiet d:/research/Jupyter/release/fly-olfactory-network-fpga/PNAS/code_and_data/vivado_projects/no_APL/no_APL.srcs/sources_1/ip/blk_mem_n/blk_mem_n.dcp
  set_property netlist_only true [get_files d:/research/Jupyter/release/fly-olfactory-network-fpga/PNAS/code_and_data/vivado_projects/no_APL/no_APL.srcs/sources_1/ip/blk_mem_n/blk_mem_n.dcp]
  add_files -quiet d:/research/Jupyter/release/fly-olfactory-network-fpga/PNAS/code_and_data/vivado_projects/no_APL/no_APL.srcs/sources_1/ip/blk_mem_u/blk_mem_u.dcp
  set_property netlist_only true [get_files d:/research/Jupyter/release/fly-olfactory-network-fpga/PNAS/code_and_data/vivado_projects/no_APL/no_APL.srcs/sources_1/ip/blk_mem_u/blk_mem_u.dcp]
  add_files -quiet d:/research/Jupyter/release/fly-olfactory-network-fpga/PNAS/code_and_data/vivado_projects/no_APL/no_APL.srcs/sources_1/ip/blk_mem_fc/blk_mem_fc.dcp
  set_property netlist_only true [get_files d:/research/Jupyter/release/fly-olfactory-network-fpga/PNAS/code_and_data/vivado_projects/no_APL/no_APL.srcs/sources_1/ip/blk_mem_fc/blk_mem_fc.dcp]
  add_files -quiet d:/research/Jupyter/release/fly-olfactory-network-fpga/PNAS/code_and_data/vivado_projects/no_APL/no_APL.srcs/sources_1/ip/blk_mem_weight_glomeruli_0/blk_mem_weight_glomeruli_0.dcp
  set_property netlist_only true [get_files d:/research/Jupyter/release/fly-olfactory-network-fpga/PNAS/code_and_data/vivado_projects/no_APL/no_APL.srcs/sources_1/ip/blk_mem_weight_glomeruli_0/blk_mem_weight_glomeruli_0.dcp]
  add_files -quiet d:/research/Jupyter/release/fly-olfactory-network-fpga/PNAS/code_and_data/vivado_projects/no_APL/no_APL.srcs/sources_1/ip/blk_mem_weight_glomeruli_1/blk_mem_weight_glomeruli_1.dcp
  set_property netlist_only true [get_files d:/research/Jupyter/release/fly-olfactory-network-fpga/PNAS/code_and_data/vivado_projects/no_APL/no_APL.srcs/sources_1/ip/blk_mem_weight_glomeruli_1/blk_mem_weight_glomeruli_1.dcp]
  add_files -quiet d:/research/Jupyter/release/fly-olfactory-network-fpga/PNAS/code_and_data/vivado_projects/no_APL/no_APL.srcs/sources_1/ip/blk_mem_weight_glomeruli_2/blk_mem_weight_glomeruli_2.dcp
  set_property netlist_only true [get_files d:/research/Jupyter/release/fly-olfactory-network-fpga/PNAS/code_and_data/vivado_projects/no_APL/no_APL.srcs/sources_1/ip/blk_mem_weight_glomeruli_2/blk_mem_weight_glomeruli_2.dcp]
  add_files -quiet d:/research/Jupyter/release/fly-olfactory-network-fpga/PNAS/code_and_data/vivado_projects/no_APL/no_APL.srcs/sources_1/ip/blk_mem_weight_PNKC_0/blk_mem_weight_PNKC_0.dcp
  set_property netlist_only true [get_files d:/research/Jupyter/release/fly-olfactory-network-fpga/PNAS/code_and_data/vivado_projects/no_APL/no_APL.srcs/sources_1/ip/blk_mem_weight_PNKC_0/blk_mem_weight_PNKC_0.dcp]
  add_files -quiet d:/research/Jupyter/release/fly-olfactory-network-fpga/PNAS/code_and_data/vivado_projects/no_APL/no_APL.srcs/sources_1/ip/blk_mem_LNPN_sc/blk_mem_LNPN_sc.dcp
  set_property netlist_only true [get_files d:/research/Jupyter/release/fly-olfactory-network-fpga/PNAS/code_and_data/vivado_projects/no_APL/no_APL.srcs/sources_1/ip/blk_mem_LNPN_sc/blk_mem_LNPN_sc.dcp]
  add_files -quiet d:/research/Jupyter/release/fly-olfactory-network-fpga/PNAS/code_and_data/vivado_projects/no_APL/no_APL.srcs/sources_1/ip/blk_mem_KC_sc/blk_mem_KC_sc.dcp
  set_property netlist_only true [get_files d:/research/Jupyter/release/fly-olfactory-network-fpga/PNAS/code_and_data/vivado_projects/no_APL/no_APL.srcs/sources_1/ip/blk_mem_KC_sc/blk_mem_KC_sc.dcp]
  add_files -quiet d:/research/Jupyter/release/fly-olfactory-network-fpga/PNAS/code_and_data/vivado_projects/no_APL/no_APL.srcs/sources_1/ip/blk_mem_KC_sr/blk_mem_KC_sr.dcp
  set_property netlist_only true [get_files d:/research/Jupyter/release/fly-olfactory-network-fpga/PNAS/code_and_data/vivado_projects/no_APL/no_APL.srcs/sources_1/ip/blk_mem_KC_sr/blk_mem_KC_sr.dcp]
  add_files -quiet d:/research/Jupyter/release/fly-olfactory-network-fpga/PNAS/code_and_data/vivado_projects/no_APL/no_APL.srcs/sources_1/ip/blk_mem_weight_KC_APLMBONa3/blk_mem_weight_KC_APLMBONa3.dcp
  set_property netlist_only true [get_files d:/research/Jupyter/release/fly-olfactory-network-fpga/PNAS/code_and_data/vivado_projects/no_APL/no_APL.srcs/sources_1/ip/blk_mem_weight_KC_APLMBONa3/blk_mem_weight_KC_APLMBONa3.dcp]
  add_files -quiet d:/research/Jupyter/release/fly-olfactory-network-fpga/PNAS/code_and_data/vivado_projects/no_APL/no_APL.srcs/sources_1/ip/blk_mem_weight_KC_MBONa1/blk_mem_weight_KC_MBONa1.dcp
  set_property netlist_only true [get_files d:/research/Jupyter/release/fly-olfactory-network-fpga/PNAS/code_and_data/vivado_projects/no_APL/no_APL.srcs/sources_1/ip/blk_mem_weight_KC_MBONa1/blk_mem_weight_KC_MBONa1.dcp]
  add_files -quiet d:/research/Jupyter/release/fly-olfactory-network-fpga/PNAS/code_and_data/vivado_projects/no_APL/no_APL.srcs/sources_1/ip/blk_mem_weight_glomeruli_5/blk_mem_weight_glomeruli_5.dcp
  set_property netlist_only true [get_files d:/research/Jupyter/release/fly-olfactory-network-fpga/PNAS/code_and_data/vivado_projects/no_APL/no_APL.srcs/sources_1/ip/blk_mem_weight_glomeruli_5/blk_mem_weight_glomeruli_5.dcp]
  add_files -quiet d:/research/Jupyter/release/fly-olfactory-network-fpga/PNAS/code_and_data/vivado_projects/no_APL/no_APL.srcs/sources_1/ip/blk_mem_LNPN_I_exci/blk_mem_LNPN_I_exci.dcp
  set_property netlist_only true [get_files d:/research/Jupyter/release/fly-olfactory-network-fpga/PNAS/code_and_data/vivado_projects/no_APL/no_APL.srcs/sources_1/ip/blk_mem_LNPN_I_exci/blk_mem_LNPN_I_exci.dcp]
  add_files -quiet d:/research/Jupyter/release/fly-olfactory-network-fpga/PNAS/code_and_data/vivado_projects/no_APL/no_APL.srcs/sources_1/ip/blk_mem_ORN_sc/blk_mem_ORN_sc.dcp
  set_property netlist_only true [get_files d:/research/Jupyter/release/fly-olfactory-network-fpga/PNAS/code_and_data/vivado_projects/no_APL/no_APL.srcs/sources_1/ip/blk_mem_ORN_sc/blk_mem_ORN_sc.dcp]
  add_files -quiet d:/research/Jupyter/release/fly-olfactory-network-fpga/PNAS/code_and_data/vivado_projects/no_APL/no_APL.srcs/sources_1/ip/blk_mem_weight_glomeruli_6/blk_mem_weight_glomeruli_6.dcp
  set_property netlist_only true [get_files d:/research/Jupyter/release/fly-olfactory-network-fpga/PNAS/code_and_data/vivado_projects/no_APL/no_APL.srcs/sources_1/ip/blk_mem_weight_glomeruli_6/blk_mem_weight_glomeruli_6.dcp]
  add_files -quiet d:/research/Jupyter/release/fly-olfactory-network-fpga/PNAS/code_and_data/vivado_projects/no_APL/no_APL.srcs/sources_1/ip/blk_mem_LNPN_I_inhi/blk_mem_LNPN_I_inhi.dcp
  set_property netlist_only true [get_files d:/research/Jupyter/release/fly-olfactory-network-fpga/PNAS/code_and_data/vivado_projects/no_APL/no_APL.srcs/sources_1/ip/blk_mem_LNPN_I_inhi/blk_mem_LNPN_I_inhi.dcp]
  add_files -quiet d:/research/Jupyter/release/fly-olfactory-network-fpga/PNAS/code_and_data/vivado_projects/no_APL/no_APL.srcs/sources_1/ip/blk_mem_weight_glomeruli_3/blk_mem_weight_glomeruli_3.dcp
  set_property netlist_only true [get_files d:/research/Jupyter/release/fly-olfactory-network-fpga/PNAS/code_and_data/vivado_projects/no_APL/no_APL.srcs/sources_1/ip/blk_mem_weight_glomeruli_3/blk_mem_weight_glomeruli_3.dcp]
  add_files -quiet d:/research/Jupyter/release/fly-olfactory-network-fpga/PNAS/code_and_data/vivado_projects/no_APL/no_APL.srcs/sources_1/ip/blk_mem_PN_sc/blk_mem_PN_sc.dcp
  set_property netlist_only true [get_files d:/research/Jupyter/release/fly-olfactory-network-fpga/PNAS/code_and_data/vivado_projects/no_APL/no_APL.srcs/sources_1/ip/blk_mem_PN_sc/blk_mem_PN_sc.dcp]
  add_files -quiet d:/research/Jupyter/release/fly-olfactory-network-fpga/PNAS/code_and_data/vivado_projects/no_APL/no_APL.srcs/sources_1/ip/blk_mem_KC_I/blk_mem_KC_I.dcp
  set_property netlist_only true [get_files d:/research/Jupyter/release/fly-olfactory-network-fpga/PNAS/code_and_data/vivado_projects/no_APL/no_APL.srcs/sources_1/ip/blk_mem_KC_I/blk_mem_KC_I.dcp]
  add_files -quiet d:/research/Jupyter/release/fly-olfactory-network-fpga/PNAS/code_and_data/vivado_projects/no_APL/no_APL.srcs/sources_1/ip/blk_mem_weight_glomeruli_4/blk_mem_weight_glomeruli_4.dcp
  set_property netlist_only true [get_files d:/research/Jupyter/release/fly-olfactory-network-fpga/PNAS/code_and_data/vivado_projects/no_APL/no_APL.srcs/sources_1/ip/blk_mem_weight_glomeruli_4/blk_mem_weight_glomeruli_4.dcp]
  add_files -quiet d:/research/Jupyter/release/fly-olfactory-network-fpga/PNAS/code_and_data/vivado_projects/no_APL/no_APL.srcs/sources_1/ip/fifo_txd/fifo_txd.dcp
  set_property netlist_only true [get_files d:/research/Jupyter/release/fly-olfactory-network-fpga/PNAS/code_and_data/vivado_projects/no_APL/no_APL.srcs/sources_1/ip/fifo_txd/fifo_txd.dcp]
  add_files -quiet d:/research/Jupyter/release/fly-olfactory-network-fpga/PNAS/code_and_data/vivado_projects/no_APL/no_APL.srcs/sources_1/ip/blk_mem_weight_PNKC_1/blk_mem_weight_PNKC_1.dcp
  set_property netlist_only true [get_files d:/research/Jupyter/release/fly-olfactory-network-fpga/PNAS/code_and_data/vivado_projects/no_APL/no_APL.srcs/sources_1/ip/blk_mem_weight_PNKC_1/blk_mem_weight_PNKC_1.dcp]
  add_files -quiet d:/research/Jupyter/release/fly-olfactory-network-fpga/PNAS/code_and_data/vivado_projects/no_APL/no_APL.srcs/sources_1/ip/fifo_rxd/fifo_rxd.dcp
  set_property netlist_only true [get_files d:/research/Jupyter/release/fly-olfactory-network-fpga/PNAS/code_and_data/vivado_projects/no_APL/no_APL.srcs/sources_1/ip/fifo_rxd/fifo_rxd.dcp]
  add_files -quiet d:/research/Jupyter/release/fly-olfactory-network-fpga/PNAS/code_and_data/vivado_projects/no_APL/no_APL.srcs/sources_1/ip/blk_mem_weight_PNKC_2/blk_mem_weight_PNKC_2.dcp
  set_property netlist_only true [get_files d:/research/Jupyter/release/fly-olfactory-network-fpga/PNAS/code_and_data/vivado_projects/no_APL/no_APL.srcs/sources_1/ip/blk_mem_weight_PNKC_2/blk_mem_weight_PNKC_2.dcp]
  read_xdc -mode out_of_context -ref clk_generator -cells inst d:/research/Jupyter/release/fly-olfactory-network-fpga/PNAS/code_and_data/vivado_projects/no_APL/no_APL.srcs/sources_1/ip/clk_generator/clk_generator_ooc.xdc
  set_property processing_order EARLY [get_files d:/research/Jupyter/release/fly-olfactory-network-fpga/PNAS/code_and_data/vivado_projects/no_APL/no_APL.srcs/sources_1/ip/clk_generator/clk_generator_ooc.xdc]
  read_xdc -prop_thru_buffers -ref clk_generator -cells inst d:/research/Jupyter/release/fly-olfactory-network-fpga/PNAS/code_and_data/vivado_projects/no_APL/no_APL.srcs/sources_1/ip/clk_generator/clk_generator_board.xdc
  set_property processing_order EARLY [get_files d:/research/Jupyter/release/fly-olfactory-network-fpga/PNAS/code_and_data/vivado_projects/no_APL/no_APL.srcs/sources_1/ip/clk_generator/clk_generator_board.xdc]
  read_xdc -ref clk_generator -cells inst d:/research/Jupyter/release/fly-olfactory-network-fpga/PNAS/code_and_data/vivado_projects/no_APL/no_APL.srcs/sources_1/ip/clk_generator/clk_generator.xdc
  set_property processing_order EARLY [get_files d:/research/Jupyter/release/fly-olfactory-network-fpga/PNAS/code_and_data/vivado_projects/no_APL/no_APL.srcs/sources_1/ip/clk_generator/clk_generator.xdc]
  read_xdc -mode out_of_context -ref blk_mem_v -cells U0 d:/research/Jupyter/release/fly-olfactory-network-fpga/PNAS/code_and_data/vivado_projects/no_APL/no_APL.srcs/sources_1/ip/blk_mem_v/blk_mem_v_ooc.xdc
  set_property processing_order EARLY [get_files d:/research/Jupyter/release/fly-olfactory-network-fpga/PNAS/code_and_data/vivado_projects/no_APL/no_APL.srcs/sources_1/ip/blk_mem_v/blk_mem_v_ooc.xdc]
  read_xdc -mode out_of_context -ref blk_mem_n -cells U0 d:/research/Jupyter/release/fly-olfactory-network-fpga/PNAS/code_and_data/vivado_projects/no_APL/no_APL.srcs/sources_1/ip/blk_mem_n/blk_mem_n_ooc.xdc
  set_property processing_order EARLY [get_files d:/research/Jupyter/release/fly-olfactory-network-fpga/PNAS/code_and_data/vivado_projects/no_APL/no_APL.srcs/sources_1/ip/blk_mem_n/blk_mem_n_ooc.xdc]
  read_xdc -mode out_of_context -ref blk_mem_u -cells U0 d:/research/Jupyter/release/fly-olfactory-network-fpga/PNAS/code_and_data/vivado_projects/no_APL/no_APL.srcs/sources_1/ip/blk_mem_u/blk_mem_u_ooc.xdc
  set_property processing_order EARLY [get_files d:/research/Jupyter/release/fly-olfactory-network-fpga/PNAS/code_and_data/vivado_projects/no_APL/no_APL.srcs/sources_1/ip/blk_mem_u/blk_mem_u_ooc.xdc]
  read_xdc -mode out_of_context -ref blk_mem_fc -cells U0 d:/research/Jupyter/release/fly-olfactory-network-fpga/PNAS/code_and_data/vivado_projects/no_APL/no_APL.srcs/sources_1/ip/blk_mem_fc/blk_mem_fc_ooc.xdc
  set_property processing_order EARLY [get_files d:/research/Jupyter/release/fly-olfactory-network-fpga/PNAS/code_and_data/vivado_projects/no_APL/no_APL.srcs/sources_1/ip/blk_mem_fc/blk_mem_fc_ooc.xdc]
  read_xdc -mode out_of_context -ref blk_mem_weight_glomeruli_0 -cells U0 d:/research/Jupyter/release/fly-olfactory-network-fpga/PNAS/code_and_data/vivado_projects/no_APL/no_APL.srcs/sources_1/ip/blk_mem_weight_glomeruli_0/blk_mem_weight_glomeruli_0_ooc.xdc
  set_property processing_order EARLY [get_files d:/research/Jupyter/release/fly-olfactory-network-fpga/PNAS/code_and_data/vivado_projects/no_APL/no_APL.srcs/sources_1/ip/blk_mem_weight_glomeruli_0/blk_mem_weight_glomeruli_0_ooc.xdc]
  read_xdc -mode out_of_context -ref blk_mem_weight_glomeruli_1 -cells U0 d:/research/Jupyter/release/fly-olfactory-network-fpga/PNAS/code_and_data/vivado_projects/no_APL/no_APL.srcs/sources_1/ip/blk_mem_weight_glomeruli_1/blk_mem_weight_glomeruli_1_ooc.xdc
  set_property processing_order EARLY [get_files d:/research/Jupyter/release/fly-olfactory-network-fpga/PNAS/code_and_data/vivado_projects/no_APL/no_APL.srcs/sources_1/ip/blk_mem_weight_glomeruli_1/blk_mem_weight_glomeruli_1_ooc.xdc]
  read_xdc -mode out_of_context -ref blk_mem_weight_glomeruli_2 -cells U0 d:/research/Jupyter/release/fly-olfactory-network-fpga/PNAS/code_and_data/vivado_projects/no_APL/no_APL.srcs/sources_1/ip/blk_mem_weight_glomeruli_2/blk_mem_weight_glomeruli_2_ooc.xdc
  set_property processing_order EARLY [get_files d:/research/Jupyter/release/fly-olfactory-network-fpga/PNAS/code_and_data/vivado_projects/no_APL/no_APL.srcs/sources_1/ip/blk_mem_weight_glomeruli_2/blk_mem_weight_glomeruli_2_ooc.xdc]
  read_xdc -mode out_of_context -ref blk_mem_weight_PNKC_0 -cells U0 d:/research/Jupyter/release/fly-olfactory-network-fpga/PNAS/code_and_data/vivado_projects/no_APL/no_APL.srcs/sources_1/ip/blk_mem_weight_PNKC_0/blk_mem_weight_PNKC_0_ooc.xdc
  set_property processing_order EARLY [get_files d:/research/Jupyter/release/fly-olfactory-network-fpga/PNAS/code_and_data/vivado_projects/no_APL/no_APL.srcs/sources_1/ip/blk_mem_weight_PNKC_0/blk_mem_weight_PNKC_0_ooc.xdc]
  read_xdc -mode out_of_context -ref blk_mem_LNPN_sc -cells U0 d:/research/Jupyter/release/fly-olfactory-network-fpga/PNAS/code_and_data/vivado_projects/no_APL/no_APL.srcs/sources_1/ip/blk_mem_LNPN_sc/blk_mem_LNPN_sc_ooc.xdc
  set_property processing_order EARLY [get_files d:/research/Jupyter/release/fly-olfactory-network-fpga/PNAS/code_and_data/vivado_projects/no_APL/no_APL.srcs/sources_1/ip/blk_mem_LNPN_sc/blk_mem_LNPN_sc_ooc.xdc]
  read_xdc -mode out_of_context -ref blk_mem_KC_sc -cells U0 d:/research/Jupyter/release/fly-olfactory-network-fpga/PNAS/code_and_data/vivado_projects/no_APL/no_APL.srcs/sources_1/ip/blk_mem_KC_sc/blk_mem_KC_sc_ooc.xdc
  set_property processing_order EARLY [get_files d:/research/Jupyter/release/fly-olfactory-network-fpga/PNAS/code_and_data/vivado_projects/no_APL/no_APL.srcs/sources_1/ip/blk_mem_KC_sc/blk_mem_KC_sc_ooc.xdc]
  read_xdc -mode out_of_context -ref blk_mem_KC_sr -cells U0 d:/research/Jupyter/release/fly-olfactory-network-fpga/PNAS/code_and_data/vivado_projects/no_APL/no_APL.srcs/sources_1/ip/blk_mem_KC_sr/blk_mem_KC_sr_ooc.xdc
  set_property processing_order EARLY [get_files d:/research/Jupyter/release/fly-olfactory-network-fpga/PNAS/code_and_data/vivado_projects/no_APL/no_APL.srcs/sources_1/ip/blk_mem_KC_sr/blk_mem_KC_sr_ooc.xdc]
  read_xdc -mode out_of_context -ref blk_mem_weight_KC_APLMBONa3 -cells U0 d:/research/Jupyter/release/fly-olfactory-network-fpga/PNAS/code_and_data/vivado_projects/no_APL/no_APL.srcs/sources_1/ip/blk_mem_weight_KC_APLMBONa3/blk_mem_weight_KC_APLMBONa3_ooc.xdc
  set_property processing_order EARLY [get_files d:/research/Jupyter/release/fly-olfactory-network-fpga/PNAS/code_and_data/vivado_projects/no_APL/no_APL.srcs/sources_1/ip/blk_mem_weight_KC_APLMBONa3/blk_mem_weight_KC_APLMBONa3_ooc.xdc]
  read_xdc -mode out_of_context -ref blk_mem_weight_KC_MBONa1 -cells U0 d:/research/Jupyter/release/fly-olfactory-network-fpga/PNAS/code_and_data/vivado_projects/no_APL/no_APL.srcs/sources_1/ip/blk_mem_weight_KC_MBONa1/blk_mem_weight_KC_MBONa1_ooc.xdc
  set_property processing_order EARLY [get_files d:/research/Jupyter/release/fly-olfactory-network-fpga/PNAS/code_and_data/vivado_projects/no_APL/no_APL.srcs/sources_1/ip/blk_mem_weight_KC_MBONa1/blk_mem_weight_KC_MBONa1_ooc.xdc]
  read_xdc -mode out_of_context -ref blk_mem_weight_glomeruli_5 -cells U0 d:/research/Jupyter/release/fly-olfactory-network-fpga/PNAS/code_and_data/vivado_projects/no_APL/no_APL.srcs/sources_1/ip/blk_mem_weight_glomeruli_5/blk_mem_weight_glomeruli_5_ooc.xdc
  set_property processing_order EARLY [get_files d:/research/Jupyter/release/fly-olfactory-network-fpga/PNAS/code_and_data/vivado_projects/no_APL/no_APL.srcs/sources_1/ip/blk_mem_weight_glomeruli_5/blk_mem_weight_glomeruli_5_ooc.xdc]
  read_xdc -mode out_of_context -ref blk_mem_LNPN_I_exci -cells U0 d:/research/Jupyter/release/fly-olfactory-network-fpga/PNAS/code_and_data/vivado_projects/no_APL/no_APL.srcs/sources_1/ip/blk_mem_LNPN_I_exci/blk_mem_LNPN_I_exci_ooc.xdc
  set_property processing_order EARLY [get_files d:/research/Jupyter/release/fly-olfactory-network-fpga/PNAS/code_and_data/vivado_projects/no_APL/no_APL.srcs/sources_1/ip/blk_mem_LNPN_I_exci/blk_mem_LNPN_I_exci_ooc.xdc]
  read_xdc -mode out_of_context -ref blk_mem_ORN_sc -cells U0 d:/research/Jupyter/release/fly-olfactory-network-fpga/PNAS/code_and_data/vivado_projects/no_APL/no_APL.srcs/sources_1/ip/blk_mem_ORN_sc/blk_mem_ORN_sc_ooc.xdc
  set_property processing_order EARLY [get_files d:/research/Jupyter/release/fly-olfactory-network-fpga/PNAS/code_and_data/vivado_projects/no_APL/no_APL.srcs/sources_1/ip/blk_mem_ORN_sc/blk_mem_ORN_sc_ooc.xdc]
  read_xdc -mode out_of_context -ref blk_mem_weight_glomeruli_6 -cells U0 d:/research/Jupyter/release/fly-olfactory-network-fpga/PNAS/code_and_data/vivado_projects/no_APL/no_APL.srcs/sources_1/ip/blk_mem_weight_glomeruli_6/blk_mem_weight_glomeruli_6_ooc.xdc
  set_property processing_order EARLY [get_files d:/research/Jupyter/release/fly-olfactory-network-fpga/PNAS/code_and_data/vivado_projects/no_APL/no_APL.srcs/sources_1/ip/blk_mem_weight_glomeruli_6/blk_mem_weight_glomeruli_6_ooc.xdc]
  read_xdc -mode out_of_context -ref blk_mem_LNPN_I_inhi -cells U0 d:/research/Jupyter/release/fly-olfactory-network-fpga/PNAS/code_and_data/vivado_projects/no_APL/no_APL.srcs/sources_1/ip/blk_mem_LNPN_I_inhi/blk_mem_LNPN_I_inhi_ooc.xdc
  set_property processing_order EARLY [get_files d:/research/Jupyter/release/fly-olfactory-network-fpga/PNAS/code_and_data/vivado_projects/no_APL/no_APL.srcs/sources_1/ip/blk_mem_LNPN_I_inhi/blk_mem_LNPN_I_inhi_ooc.xdc]
  read_xdc -mode out_of_context -ref blk_mem_weight_glomeruli_3 -cells U0 d:/research/Jupyter/release/fly-olfactory-network-fpga/PNAS/code_and_data/vivado_projects/no_APL/no_APL.srcs/sources_1/ip/blk_mem_weight_glomeruli_3/blk_mem_weight_glomeruli_3_ooc.xdc
  set_property processing_order EARLY [get_files d:/research/Jupyter/release/fly-olfactory-network-fpga/PNAS/code_and_data/vivado_projects/no_APL/no_APL.srcs/sources_1/ip/blk_mem_weight_glomeruli_3/blk_mem_weight_glomeruli_3_ooc.xdc]
  read_xdc -mode out_of_context -ref blk_mem_PN_sc -cells U0 d:/research/Jupyter/release/fly-olfactory-network-fpga/PNAS/code_and_data/vivado_projects/no_APL/no_APL.srcs/sources_1/ip/blk_mem_PN_sc/blk_mem_PN_sc_ooc.xdc
  set_property processing_order EARLY [get_files d:/research/Jupyter/release/fly-olfactory-network-fpga/PNAS/code_and_data/vivado_projects/no_APL/no_APL.srcs/sources_1/ip/blk_mem_PN_sc/blk_mem_PN_sc_ooc.xdc]
  read_xdc -mode out_of_context -ref blk_mem_KC_I -cells U0 d:/research/Jupyter/release/fly-olfactory-network-fpga/PNAS/code_and_data/vivado_projects/no_APL/no_APL.srcs/sources_1/ip/blk_mem_KC_I/blk_mem_KC_I_ooc.xdc
  set_property processing_order EARLY [get_files d:/research/Jupyter/release/fly-olfactory-network-fpga/PNAS/code_and_data/vivado_projects/no_APL/no_APL.srcs/sources_1/ip/blk_mem_KC_I/blk_mem_KC_I_ooc.xdc]
  read_xdc -mode out_of_context -ref blk_mem_weight_glomeruli_4 -cells U0 d:/research/Jupyter/release/fly-olfactory-network-fpga/PNAS/code_and_data/vivado_projects/no_APL/no_APL.srcs/sources_1/ip/blk_mem_weight_glomeruli_4/blk_mem_weight_glomeruli_4_ooc.xdc
  set_property processing_order EARLY [get_files d:/research/Jupyter/release/fly-olfactory-network-fpga/PNAS/code_and_data/vivado_projects/no_APL/no_APL.srcs/sources_1/ip/blk_mem_weight_glomeruli_4/blk_mem_weight_glomeruli_4_ooc.xdc]
  read_xdc -mode out_of_context -ref fifo_txd -cells U0 d:/research/Jupyter/release/fly-olfactory-network-fpga/PNAS/code_and_data/vivado_projects/no_APL/no_APL.srcs/sources_1/ip/fifo_txd/fifo_txd_ooc.xdc
  set_property processing_order EARLY [get_files d:/research/Jupyter/release/fly-olfactory-network-fpga/PNAS/code_and_data/vivado_projects/no_APL/no_APL.srcs/sources_1/ip/fifo_txd/fifo_txd_ooc.xdc]
  read_xdc -ref fifo_txd -cells U0 d:/research/Jupyter/release/fly-olfactory-network-fpga/PNAS/code_and_data/vivado_projects/no_APL/no_APL.srcs/sources_1/ip/fifo_txd/fifo_txd/fifo_txd.xdc
  set_property processing_order EARLY [get_files d:/research/Jupyter/release/fly-olfactory-network-fpga/PNAS/code_and_data/vivado_projects/no_APL/no_APL.srcs/sources_1/ip/fifo_txd/fifo_txd/fifo_txd.xdc]
  read_xdc -mode out_of_context -ref blk_mem_weight_PNKC_1 -cells U0 d:/research/Jupyter/release/fly-olfactory-network-fpga/PNAS/code_and_data/vivado_projects/no_APL/no_APL.srcs/sources_1/ip/blk_mem_weight_PNKC_1/blk_mem_weight_PNKC_1_ooc.xdc
  set_property processing_order EARLY [get_files d:/research/Jupyter/release/fly-olfactory-network-fpga/PNAS/code_and_data/vivado_projects/no_APL/no_APL.srcs/sources_1/ip/blk_mem_weight_PNKC_1/blk_mem_weight_PNKC_1_ooc.xdc]
  read_xdc -mode out_of_context -ref fifo_rxd -cells U0 d:/research/Jupyter/release/fly-olfactory-network-fpga/PNAS/code_and_data/vivado_projects/no_APL/no_APL.srcs/sources_1/ip/fifo_rxd/fifo_rxd_ooc.xdc
  set_property processing_order EARLY [get_files d:/research/Jupyter/release/fly-olfactory-network-fpga/PNAS/code_and_data/vivado_projects/no_APL/no_APL.srcs/sources_1/ip/fifo_rxd/fifo_rxd_ooc.xdc]
  read_xdc -ref fifo_rxd -cells U0 d:/research/Jupyter/release/fly-olfactory-network-fpga/PNAS/code_and_data/vivado_projects/no_APL/no_APL.srcs/sources_1/ip/fifo_rxd/fifo_rxd/fifo_rxd.xdc
  set_property processing_order EARLY [get_files d:/research/Jupyter/release/fly-olfactory-network-fpga/PNAS/code_and_data/vivado_projects/no_APL/no_APL.srcs/sources_1/ip/fifo_rxd/fifo_rxd/fifo_rxd.xdc]
  read_xdc -mode out_of_context -ref blk_mem_weight_PNKC_2 -cells U0 d:/research/Jupyter/release/fly-olfactory-network-fpga/PNAS/code_and_data/vivado_projects/no_APL/no_APL.srcs/sources_1/ip/blk_mem_weight_PNKC_2/blk_mem_weight_PNKC_2_ooc.xdc
  set_property processing_order EARLY [get_files d:/research/Jupyter/release/fly-olfactory-network-fpga/PNAS/code_and_data/vivado_projects/no_APL/no_APL.srcs/sources_1/ip/blk_mem_weight_PNKC_2/blk_mem_weight_PNKC_2_ooc.xdc]
  read_xdc D:/research/Jupyter/release/fly-olfactory-network-fpga/PNAS/code_and_data/vivado_projects/no_APL/no_APL.srcs/constrs_1/new/cmoda7.xdc
  link_design -top main -part xc7a35tcpg236-1
  write_hwdef -file main.hwdef
  close_msg_db -file init_design.pb
} RESULT]
if {$rc} {
  step_failed init_design
  return -code error $RESULT
} else {
  end_step init_design
  unset ACTIVE_STEP 
}

start_step opt_design
set ACTIVE_STEP opt_design
set rc [catch {
  create_msg_db opt_design.pb
  opt_design 
  write_checkpoint -force main_opt.dcp
  catch { report_drc -file main_drc_opted.rpt }
  close_msg_db -file opt_design.pb
} RESULT]
if {$rc} {
  step_failed opt_design
  return -code error $RESULT
} else {
  end_step opt_design
  unset ACTIVE_STEP 
}

start_step power_opt_design
set ACTIVE_STEP power_opt_design
set rc [catch {
  create_msg_db power_opt_design.pb
  power_opt_design 
  write_checkpoint -force main_pwropt.dcp
  close_msg_db -file power_opt_design.pb
} RESULT]
if {$rc} {
  step_failed power_opt_design
  return -code error $RESULT
} else {
  end_step power_opt_design
  unset ACTIVE_STEP 
}

start_step place_design
set ACTIVE_STEP place_design
set rc [catch {
  create_msg_db place_design.pb
  implement_debug_core 
  place_design 
  write_checkpoint -force main_placed.dcp
  catch { report_io -file main_io_placed.rpt }
  catch { report_utilization -file main_utilization_placed.rpt -pb main_utilization_placed.pb }
  catch { report_control_sets -verbose -file main_control_sets_placed.rpt }
  close_msg_db -file place_design.pb
} RESULT]
if {$rc} {
  step_failed place_design
  return -code error $RESULT
} else {
  end_step place_design
  unset ACTIVE_STEP 
}

start_step route_design
set ACTIVE_STEP route_design
set rc [catch {
  create_msg_db route_design.pb
  route_design 
  write_checkpoint -force main_routed.dcp
  catch { report_drc -file main_drc_routed.rpt -pb main_drc_routed.pb -rpx main_drc_routed.rpx }
  catch { report_methodology -file main_methodology_drc_routed.rpt -rpx main_methodology_drc_routed.rpx }
  catch { report_timing_summary -warn_on_violation -max_paths 10 -file main_timing_summary_routed.rpt -rpx main_timing_summary_routed.rpx }
  catch { report_power -file main_power_routed.rpt -pb main_power_summary_routed.pb -rpx main_power_routed.rpx }
  catch { report_route_status -file main_route_status.rpt -pb main_route_status.pb }
  catch { report_clock_utilization -file main_clock_utilization_routed.rpt }
  close_msg_db -file route_design.pb
} RESULT]
if {$rc} {
  write_checkpoint -force main_routed_error.dcp
  step_failed route_design
  return -code error $RESULT
} else {
  end_step route_design
  unset ACTIVE_STEP 
}

start_step write_bitstream
set ACTIVE_STEP write_bitstream
set rc [catch {
  create_msg_db write_bitstream.pb
  set_property XPM_LIBRARIES {XPM_CDC XPM_MEMORY} [current_project]
  catch { write_mem_info -force main.mmi }
  write_bitstream -force -no_partial_bitfile main.bit 
  catch { write_sysdef -hwdef main.hwdef -bitfile main.bit -meminfo main.mmi -file main.sysdef }
  catch {write_debug_probes -quiet -force debug_nets}
  close_msg_db -file write_bitstream.pb
} RESULT]
if {$rc} {
  step_failed write_bitstream
  return -code error $RESULT
} else {
  end_step write_bitstream
  unset ACTIVE_STEP 
}

