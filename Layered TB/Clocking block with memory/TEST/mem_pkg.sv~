////////////////////////////////////////////////
//
//Company_Name : Scaledge
//Author_Name  : TANISH_SHAH
//File_Name    : mem_pkg.sv
//File_Path    : 
              
//Project_Name : Dual_Port_Ram
//Description  :
//
/////////////////////////////////////////////////

`ifndef PKG_SV
`define PKG_SV
//`include "mem_def.sv"
package pkg;
event item_done;
event reset_on;

//define file
`include "mem_def.sv"
//trans file
`include "mem_trans.sv"
//generator file
`include "mem_gen.sv"

//IBR
`include "mem_gen_ibr.sv"
//sanity test
`include "mem_gen_sanity.sv"
// Back @ Back test
`include "mem_gen_b2b.sv"
// Simulteneous
`include "mem_gen_simul.sv"
// Sweep test
`include "mem_gen_sweep.sv"
//driver
`include "mem_driv.sv"
//monitor
`include "mem_moni.sv"
//refrence model
`include "mem_rfm.sv"
//scoreboard
`include "mem_scr.sv"
//enviroment
`include "mem_env.sv"
//test
`include "mem_test.sv"

int obj_cnt;

function void raise_obj(input string str);
 obj_cnt++;
 $display("obj_cnt=%d",obj_cnt);
 $display("it it in %s",str);
endfunction

function void drop_obj(input string str);
 obj_cnt--;
 $display("obj_cnt=%d",obj_cnt);
 $display("it it in %s",str);
endfunction


endpackage
`endif
