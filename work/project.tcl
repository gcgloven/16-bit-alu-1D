set projDir "C:/Users/Hoshyu/Documents/mojo/finalv7/work/planAhead"
set projName "finalv7"
set topName top
set device xc6slx9-2tqg144
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "C:/Users/Hoshyu/Documents/mojo/finalv7/work/verilog/mojo_top_0.v" "C:/Users/Hoshyu/Documents/mojo/finalv7/work/verilog/test_adder_1.v" "C:/Users/Hoshyu/Documents/mojo/finalv7/work/verilog/test_compare_2.v" "C:/Users/Hoshyu/Documents/mojo/finalv7/work/verilog/test_boole_3.v" "C:/Users/Hoshyu/Documents/mojo/finalv7/work/verilog/test_shifter_4.v" "C:/Users/Hoshyu/Documents/mojo/finalv7/work/verilog/test_multiply_5.v" "C:/Users/Hoshyu/Documents/mojo/finalv7/work/verilog/test_error_6.v" "C:/Users/Hoshyu/Documents/mojo/finalv7/work/verilog/multi_seven_seg_7.v" "C:/Users/Hoshyu/Documents/mojo/finalv7/work/verilog/functionCombi_8.v" "C:/Users/Hoshyu/Documents/mojo/finalv7/work/verilog/reset_conditioner_9.v" "C:/Users/Hoshyu/Documents/mojo/finalv7/work/verilog/adder16_10.v" "C:/Users/Hoshyu/Documents/mojo/finalv7/work/verilog/compare16_11.v" "C:/Users/Hoshyu/Documents/mojo/finalv7/work/verilog/boole16_12.v" "C:/Users/Hoshyu/Documents/mojo/finalv7/work/verilog/shift16_13.v" "C:/Users/Hoshyu/Documents/mojo/finalv7/work/verilog/multiply16_14.v" "C:/Users/Hoshyu/Documents/mojo/finalv7/work/verilog/adder16_10.v" "C:/Users/Hoshyu/Documents/mojo/finalv7/work/verilog/counter_16.v" "C:/Users/Hoshyu/Documents/mojo/finalv7/work/verilog/seven_seg_17.v" "C:/Users/Hoshyu/Documents/mojo/finalv7/work/verilog/decoder_18.v" "C:/Users/Hoshyu/Documents/mojo/finalv7/work/verilog/adder16_10.v" "C:/Users/Hoshyu/Documents/mojo/finalv7/work/verilog/boole16_12.v" "C:/Users/Hoshyu/Documents/mojo/finalv7/work/verilog/compare16_11.v" "C:/Users/Hoshyu/Documents/mojo/finalv7/work/verilog/shift16_13.v" "C:/Users/Hoshyu/Documents/mojo/finalv7/work/verilog/multiply16_14.v"]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set ucfSources [list  "C:/Program\ Files/Mojo\ IDE/library/components/io_shield.ucf" "C:/Program\ Files/Mojo\ IDE/library/components/mojo.ucf"]
import_files -fileset [get_filesets constrs_1] -force -norecurse $ucfSources
set_property -name {steps.bitgen.args.More Options} -value {-g Binary:Yes -g Compress} -objects [get_runs impl_1]
set_property steps.map.args.mt on [get_runs impl_1]
set_property steps.map.args.pr b [get_runs impl_1]
set_property steps.par.args.mt on [get_runs impl_1]
update_compile_order -fileset sources_1
launch_runs -runs synth_1
wait_on_run synth_1
launch_runs -runs impl_1
wait_on_run impl_1
launch_runs impl_1 -to_step Bitgen
wait_on_run impl_1
