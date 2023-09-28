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
  set_property webtalk.parent_dir D:/research/Jupyter/github/fly-olfactory-network-fpga-main/vivado_projects/PQNtest/PQNtest.cache/wt [current_project]
  set_property parent.project_path D:/research/Jupyter/github/fly-olfactory-network-fpga-main/vivado_projects/PQNtest/PQNtest.xpr [current_project]
  set_property ip_repo_paths D:/research/Desktop/Cmod-A7-35T-GPIO/repo [current_project]
  set_property ip_output_repo D:/research/Jupyter/github/fly-olfactory-network-fpga-main/vivado_projects/PQNtest/PQNtest.cache/ip [current_project]
  set_property ip_cache_permissions {read write} [current_project]
  set_property XPM_LIBRARIES {XPM_CDC XPM_MEMORY} [current_project]
  add_files -quiet D:/research/Jupyter/github/fly-olfactory-network-fpga-main/vivado_projects/PQNtest/PQNtest.runs/synth_1/GPIO_demo.dcp
  add_files -quiet d:/research/Jupyter/github/fly-olfactory-network-fpga-main/vivado_projects/PQNtest/PQNtest.srcs/sources_1/ip/blk_mem_v/blk_mem_v.dcp
  set_property netlist_only true [get_files d:/research/Jupyter/github/fly-olfactory-network-fpga-main/vivado_projects/PQNtest/PQNtest.srcs/sources_1/ip/blk_mem_v/blk_mem_v.dcp]
  add_files -quiet d:/research/Jupyter/github/fly-olfactory-network-fpga-main/vivado_projects/PQNtest/PQNtest.srcs/sources_1/ip/blk_mem_gen_ORN_sc/blk_mem_gen_ORN_sc.dcp
  set_property netlist_only true [get_files d:/research/Jupyter/github/fly-olfactory-network-fpga-main/vivado_projects/PQNtest/PQNtest.srcs/sources_1/ip/blk_mem_gen_ORN_sc/blk_mem_gen_ORN_sc.dcp]
  add_files -quiet d:/research/Jupyter/github/fly-olfactory-network-fpga-main/vivado_projects/PQNtest/PQNtest.srcs/sources_1/ip/fifo_generator_ORN/fifo_generator_ORN.dcp
  set_property netlist_only true [get_files d:/research/Jupyter/github/fly-olfactory-network-fpga-main/vivado_projects/PQNtest/PQNtest.srcs/sources_1/ip/fifo_generator_ORN/fifo_generator_ORN.dcp]
  add_files -quiet d:/research/Jupyter/github/fly-olfactory-network-fpga-main/vivado_projects/PQNtest/PQNtest.srcs/sources_1/ip/dssn_glomeruli_fifo/dssn_glomeruli_fifo.dcp
  set_property netlist_only true [get_files d:/research/Jupyter/github/fly-olfactory-network-fpga-main/vivado_projects/PQNtest/PQNtest.srcs/sources_1/ip/dssn_glomeruli_fifo/dssn_glomeruli_fifo.dcp]
  add_files -quiet d:/research/Jupyter/github/fly-olfactory-network-fpga-main/vivado_projects/PQNtest/PQNtest.srcs/sources_1/ip/blk_mem_n/blk_mem_n.dcp
  set_property netlist_only true [get_files d:/research/Jupyter/github/fly-olfactory-network-fpga-main/vivado_projects/PQNtest/PQNtest.srcs/sources_1/ip/blk_mem_n/blk_mem_n.dcp]
  add_files -quiet d:/research/Jupyter/github/fly-olfactory-network-fpga-main/vivado_projects/PQNtest/PQNtest.srcs/sources_1/ip/blk_mem_q/blk_mem_q.dcp
  set_property netlist_only true [get_files d:/research/Jupyter/github/fly-olfactory-network-fpga-main/vivado_projects/PQNtest/PQNtest.srcs/sources_1/ip/blk_mem_q/blk_mem_q.dcp]
  add_files -quiet d:/research/Jupyter/github/fly-olfactory-network-fpga-main/vivado_projects/PQNtest/PQNtest.srcs/sources_1/ip/blk_mem_u/blk_mem_u.dcp
  set_property netlist_only true [get_files d:/research/Jupyter/github/fly-olfactory-network-fpga-main/vivado_projects/PQNtest/PQNtest.srcs/sources_1/ip/blk_mem_u/blk_mem_u.dcp]
  add_files -quiet d:/research/Jupyter/github/fly-olfactory-network-fpga-main/vivado_projects/PQNtest/PQNtest.srcs/sources_1/ip/blk_mem_fc/blk_mem_fc.dcp
  set_property netlist_only true [get_files d:/research/Jupyter/github/fly-olfactory-network-fpga-main/vivado_projects/PQNtest/PQNtest.srcs/sources_1/ip/blk_mem_fc/blk_mem_fc.dcp]
  read_xdc -prop_thru_buffers -ref clk_wiz_0 -cells inst d:/research/Jupyter/github/fly-olfactory-network-fpga-main/vivado_projects/PQNtest/PQNtest.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0_board.xdc
  set_property processing_order EARLY [get_files d:/research/Jupyter/github/fly-olfactory-network-fpga-main/vivado_projects/PQNtest/PQNtest.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0_board.xdc]
  read_xdc -ref clk_wiz_0 -cells inst d:/research/Jupyter/github/fly-olfactory-network-fpga-main/vivado_projects/PQNtest/PQNtest.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0.xdc
  set_property processing_order EARLY [get_files d:/research/Jupyter/github/fly-olfactory-network-fpga-main/vivado_projects/PQNtest/PQNtest.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0.xdc]
  read_xdc -mode out_of_context -ref blk_mem_gen_ORN_sc -cells U0 d:/research/Jupyter/github/fly-olfactory-network-fpga-main/vivado_projects/PQNtest/PQNtest.srcs/sources_1/ip/blk_mem_gen_ORN_sc/blk_mem_gen_ORN_sc_ooc.xdc
  set_property processing_order EARLY [get_files d:/research/Jupyter/github/fly-olfactory-network-fpga-main/vivado_projects/PQNtest/PQNtest.srcs/sources_1/ip/blk_mem_gen_ORN_sc/blk_mem_gen_ORN_sc_ooc.xdc]
  read_xdc -mode out_of_context -ref fifo_generator_ORN -cells U0 d:/research/Jupyter/github/fly-olfactory-network-fpga-main/vivado_projects/PQNtest/PQNtest.srcs/sources_1/ip/fifo_generator_ORN/fifo_generator_ORN_ooc.xdc
  set_property processing_order EARLY [get_files d:/research/Jupyter/github/fly-olfactory-network-fpga-main/vivado_projects/PQNtest/PQNtest.srcs/sources_1/ip/fifo_generator_ORN/fifo_generator_ORN_ooc.xdc]
  read_xdc -ref fifo_generator_ORN -cells U0 d:/research/Jupyter/github/fly-olfactory-network-fpga-main/vivado_projects/PQNtest/PQNtest.srcs/sources_1/ip/fifo_generator_ORN/fifo_generator_ORN/fifo_generator_ORN.xdc
  set_property processing_order EARLY [get_files d:/research/Jupyter/github/fly-olfactory-network-fpga-main/vivado_projects/PQNtest/PQNtest.srcs/sources_1/ip/fifo_generator_ORN/fifo_generator_ORN/fifo_generator_ORN.xdc]
  read_xdc -mode out_of_context -ref dssn_glomeruli_fifo -cells U0 d:/research/Jupyter/github/fly-olfactory-network-fpga-main/vivado_projects/PQNtest/PQNtest.srcs/sources_1/ip/dssn_glomeruli_fifo/dssn_glomeruli_fifo_ooc.xdc
  set_property processing_order EARLY [get_files d:/research/Jupyter/github/fly-olfactory-network-fpga-main/vivado_projects/PQNtest/PQNtest.srcs/sources_1/ip/dssn_glomeruli_fifo/dssn_glomeruli_fifo_ooc.xdc]
  read_xdc -ref dssn_glomeruli_fifo -cells U0 d:/research/Jupyter/github/fly-olfactory-network-fpga-main/vivado_projects/PQNtest/PQNtest.srcs/sources_1/ip/dssn_glomeruli_fifo/dssn_glomeruli_fifo/dssn_glomeruli_fifo.xdc
  set_property processing_order EARLY [get_files d:/research/Jupyter/github/fly-olfactory-network-fpga-main/vivado_projects/PQNtest/PQNtest.srcs/sources_1/ip/dssn_glomeruli_fifo/dssn_glomeruli_fifo/dssn_glomeruli_fifo.xdc]
  read_xdc -mode out_of_context -ref blk_mem_n -cells U0 d:/research/Jupyter/github/fly-olfactory-network-fpga-main/vivado_projects/PQNtest/PQNtest.srcs/sources_1/ip/blk_mem_n/blk_mem_n_ooc.xdc
  set_property processing_order EARLY [get_files d:/research/Jupyter/github/fly-olfactory-network-fpga-main/vivado_projects/PQNtest/PQNtest.srcs/sources_1/ip/blk_mem_n/blk_mem_n_ooc.xdc]
  read_xdc -mode out_of_context -ref blk_mem_q -cells U0 d:/research/Jupyter/github/fly-olfactory-network-fpga-main/vivado_projects/PQNtest/PQNtest.srcs/sources_1/ip/blk_mem_q/blk_mem_q_ooc.xdc
  set_property processing_order EARLY [get_files d:/research/Jupyter/github/fly-olfactory-network-fpga-main/vivado_projects/PQNtest/PQNtest.srcs/sources_1/ip/blk_mem_q/blk_mem_q_ooc.xdc]
  read_xdc -mode out_of_context -ref blk_mem_u -cells U0 d:/research/Jupyter/github/fly-olfactory-network-fpga-main/vivado_projects/PQNtest/PQNtest.srcs/sources_1/ip/blk_mem_u/blk_mem_u_ooc.xdc
  set_property processing_order EARLY [get_files d:/research/Jupyter/github/fly-olfactory-network-fpga-main/vivado_projects/PQNtest/PQNtest.srcs/sources_1/ip/blk_mem_u/blk_mem_u_ooc.xdc]
  read_xdc -mode out_of_context -ref blk_mem_fc -cells U0 d:/research/Jupyter/github/fly-olfactory-network-fpga-main/vivado_projects/PQNtest/PQNtest.srcs/sources_1/ip/blk_mem_fc/blk_mem_fc_ooc.xdc
  set_property processing_order EARLY [get_files d:/research/Jupyter/github/fly-olfactory-network-fpga-main/vivado_projects/PQNtest/PQNtest.srcs/sources_1/ip/blk_mem_fc/blk_mem_fc_ooc.xdc]
  read_xdc D:/research/Jupyter/github/fly-olfactory-network-fpga-main/vivado_projects/PQNtest/PQNtest.srcs/constrs_1/imports/constraints/CmodA7_Master.xdc
  link_design -top GPIO_demo -part xc7a35tcpg236-1
  write_hwdef -file GPIO_demo.hwdef
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
  write_checkpoint -force GPIO_demo_opt.dcp
  catch { report_drc -file GPIO_demo_drc_opted.rpt }
  close_msg_db -file opt_design.pb
} RESULT]
if {$rc} {
  step_failed opt_design
  return -code error $RESULT
} else {
  end_step opt_design
  unset ACTIVE_STEP 
}

start_step place_design
set ACTIVE_STEP place_design
set rc [catch {
  create_msg_db place_design.pb
  implement_debug_core 
  place_design -directive ExtraNetDelay_low
  write_checkpoint -force GPIO_demo_placed.dcp
  catch { report_io -file GPIO_demo_io_placed.rpt }
  catch { report_utilization -file GPIO_demo_utilization_placed.rpt -pb GPIO_demo_utilization_placed.pb }
  catch { report_control_sets -verbose -file GPIO_demo_control_sets_placed.rpt }
  close_msg_db -file place_design.pb
} RESULT]
if {$rc} {
  step_failed place_design
  return -code error $RESULT
} else {
  end_step place_design
  unset ACTIVE_STEP 
}

start_step phys_opt_design
set ACTIVE_STEP phys_opt_design
set rc [catch {
  create_msg_db phys_opt_design.pb
  phys_opt_design -directive AggressiveExplore
  write_checkpoint -force GPIO_demo_physopt.dcp
  close_msg_db -file phys_opt_design.pb
} RESULT]
if {$rc} {
  step_failed phys_opt_design
  return -code error $RESULT
} else {
  end_step phys_opt_design
  unset ACTIVE_STEP 
}

start_step route_design
set ACTIVE_STEP route_design
set rc [catch {
  create_msg_db route_design.pb
  route_design -directive Explore
  write_checkpoint -force GPIO_demo_routed.dcp
  catch { report_drc -file GPIO_demo_drc_routed.rpt -pb GPIO_demo_drc_routed.pb -rpx GPIO_demo_drc_routed.rpx }
  catch { report_methodology -file GPIO_demo_methodology_drc_routed.rpt -rpx GPIO_demo_methodology_drc_routed.rpx }
  catch { report_timing_summary -warn_on_violation -max_paths 10 -file GPIO_demo_timing_summary_routed.rpt -rpx GPIO_demo_timing_summary_routed.rpx }
  catch { report_power -file GPIO_demo_power_routed.rpt -pb GPIO_demo_power_summary_routed.pb -rpx GPIO_demo_power_routed.rpx }
  catch { report_route_status -file GPIO_demo_route_status.rpt -pb GPIO_demo_route_status.pb }
  catch { report_clock_utilization -file GPIO_demo_clock_utilization_routed.rpt }
  close_msg_db -file route_design.pb
} RESULT]
if {$rc} {
  write_checkpoint -force GPIO_demo_routed_error.dcp
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
  catch { write_mem_info -force GPIO_demo.mmi }
  write_bitstream -force -no_partial_bitfile GPIO_demo.bit 
  catch { write_sysdef -hwdef GPIO_demo.hwdef -bitfile GPIO_demo.bit -meminfo GPIO_demo.mmi -file GPIO_demo.sysdef }
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

