////////////////////////////////////////////////
//
//Company_Name : Scaledge
//Author_Name  : TANISH_SHAH
//File_Name    : apb_gen_sanityw.sv
//File_Path    : 
//Class_Name   : apb_gen_sanityw               
//Project_Name : APB SLAVE
//Description  :
//
/////////////////////////////////////////////////
`ifndef GEN_SW_SV
`define GEN_SW_SV
class apb_gen_sanityw extends apb_gen;

task run_phase();
  repeat(no_of_trans) begin
   trans=new();
   if(!trans.randomize() with {trans.fnx_e==1;}) $fatal("Randomization Fails");
   trans.dis("generator");
   put_wait();
  end
 endtask


endclass


`endif

