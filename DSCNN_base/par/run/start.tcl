source init_ctrl.tcl
set last_state 0

# reset system
write_source 00000
after 50
puts "-finish reset-"

# -----------INIT PARAMATER---------- # 
# start write part1 to ddr
# The first init part is already load in rom
# when program the FPGA
write_source 00011
chg_mem ../../rtl/16.ddr_para_init/parameter/weight_part1.mif
write_source 10011
write_source 00011
after 50
puts "-finish write parameter-part1 to ddr-"
puts "address from 1000 to 16557"

# start write part2 to ddr
chg_mem ../../rtl/16.ddr_para_init/parameter/weight_part2.mif
write_source 10011
write_source 00011
after 50
puts "-finish write parameter-part2 to ddr-"
puts "address from 16558 to 32115"

# start write part3 to ddr
chg_mem ../../rtl/16.ddr_para_init/parameter/weight_part3.mif
write_source 10011
write_source 00011
after 50
puts "-finish write parameter-part3 to ddr-"
puts "address from 32116 to 47673"

# start write part4 to ddr
chg_mem ../../rtl/16.ddr_para_init/parameter/weight_part4.mif
write_source 10011
write_source 00011
after 50
puts "-finish write parameter-part4 to ddr-"
puts "address from 47674 to 63231"

# start write part5 to ddr
chg_mem ../../rtl/16.ddr_para_init/parameter/weight_part5.mif
write_source 10011
write_source 00011
after 50
puts "-finish write parameter-part5 to ddr-"
puts "address from 63232 to 78789"

# start write part6 to ddr
chg_mem ../../rtl/16.ddr_para_init/parameter/weight_part6.mif
write_source 10011
write_source 00011
after 50
puts "-finish write parameter-part6 to ddr-"
puts "address from 78790 to 94347"

# start write part7 to ddr
chg_mem ../../rtl/16.ddr_para_init/parameter/weight_part7.mif
write_source 10011
write_source 00011
after 50
puts "-finish write parameter-part7 to ddr-"
puts "address from 94348 to 109905"

# start write part8 to ddr
chg_mem ../../rtl/16.ddr_para_init/parameter/weight_part8.mif
write_source 10011
write_source 00011
after 50
puts "-finish write parameter-part8 to ddr-"
puts "address from 109906 to 125463"

# start write part9 to ddr
chg_mem ../../rtl/16.ddr_para_init/parameter/weight_part9.mif
write_source 10011
write_source 00011
after 50
puts "-finish write parameter-part9 to ddr-"
puts "address from 125464 to 141021"

# start write part10 to ddr
chg_mem ../../rtl/16.ddr_para_init/parameter/weight_part10.mif
write_source 10011
write_source 00011
after 50
puts "-finish write parameter-part10 to ddr-"
puts "address from 141022 to 156579"

# start write part11 to ddr
chg_mem ../../rtl/16.ddr_para_init/parameter/weight_part11.mif
write_source 10011
write_source 00011
after 50
puts "-finish write parameter-part11 to ddr-"
puts "address from 156580 to 172137"

# start write part12 to ddr
chg_mem ../../rtl/16.ddr_para_init/parameter/weight_part12.mif
write_source 10011
write_source 00011
after 50
puts "-finish write parameter-part12 to ddr-"
puts "address from 172138 to 187695"

# start write part13 to ddr
chg_mem ../../rtl/16.ddr_para_init/parameter/weight_part13.mif
write_source 10011
write_source 00011
after 50
puts "-finish write parameter-part13 to ddr-"
puts "address from 187696 to 203253"

# start write part14 to ddr
chg_mem ../../rtl/16.ddr_para_init/parameter/weight_part14.mif
write_source 10011
write_source 00011
after 50
puts "-finish write parameter-part14 to ddr-"
puts "address from 203254 to 218811"

# -----------START NIOS-II-------------- #
write_source 01011
puts "start nios-ii"
after 50

# -----------START MOBILENETV2---------- # 
write_source 01111
puts "start mobilenetv2"

proc restart {} {
    write_source 01011
    write_source 01111
}

proc restart_nios {} {
    write_source 00111
    write_source 01111
}
