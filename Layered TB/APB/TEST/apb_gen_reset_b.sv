////////////////////////////////////////////////
//
//Company_Name : Scaledge
//Author_Name  : TANISH_SHAH
//File_Name    : apb_gen_reset_b.sv
//File_Path    : 
//Class_Name   : apb_gen_reset_b               
//Project_Name : APB SLAVE
//Description  :
//
/////////////////////////////////////////////////
`ifndef GEN_RB_SV
`define GEN_RB_SV


class apb_gen_reset_b extends apb_gen;
int count;
task run_phase();
repeat(no_of_trans) begin
   trans=new();
   count++;
   if(!trans.randomize()) $fatal("Randomization Fails");
   trans.dis("generator");
   if(count==3) ->reset_on;
   put_wait();
  end
 

endtask

endclass
`endif
