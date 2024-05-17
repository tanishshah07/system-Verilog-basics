////////////////////////////////////////////////
//
//Company_Name : Scaledge
//Author_Name  : TANISH_SHAH
//File_Name    : apb_pkg.sv
//File_Path    : 
              
//Project_Name : APB SLAVE
//Description  :
//
/////////////////////////////////////////////////
`ifndef PKG_SV
`define PKG_SV

//`include "apb_def.sv"
//`include "apb_intf.sv"
package pkg;

event item_done;
event reset_on;

int no_of_trans=6;
//define file

`include "apb_def.sv"

//trans file
`include "apb_trans.sv"

//generator file
`include "apb_gen.sv"
//Sanity write
`include "apb_gen_sanityw.sv"
//Sanity Read
`include "apb_gen_sanityr.sv"
//Reset in between
`include "apb_gen_reset_b.sv"
//driver
`include "apb_driv.sv"

//monitor
`include "apb_mon.sv"

//refrence model
`include "apb_rfm.sv"
//Functional Coverage
`include "apb_fc.sv"

//scoreboard
`include "apb_scr.sv"
//
//enviroment
`include "apb_env.sv"

//test
`include "apb_test.sv"

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
