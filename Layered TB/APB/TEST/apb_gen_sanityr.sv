////////////////////////////////////////////////
//
//Company_Name : Scaledge
//Author_Name  : TANISH_SHAH
//File_Name    : apb_gen_sanityr.sv
//File_Path    : 
//Class_Name   : apb_gen_sanityr               
//Project_Name : APB SLAVE
//Description  :
//
/////////////////////////////////////////////////
`ifndef GEN_SR_SV
`define GEN_SR_SV
class apb_gen_sanityr extends apb_gen;
int addr_store;

task run_phase();
  repeat(no_of_trans) begin
   trans=new();
   if(!trans.randomize() with {trans.fnx_e==1;}) $fatal("Randomization Fails");
    addr_store=trans.paddr;
   trans.dis("generator");
   put_wait();
   trans=new();
   if(!trans.randomize() with {trans.fnx_e==0;trans.paddr==addr_store;}) $fatal("Randomization Fails");
   trans.dis("generator");
   put_wait();
  end
 endtask


endclass


`endif

