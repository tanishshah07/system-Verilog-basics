////////////////////////////////////////////////
//
//Company_Name : Scaledge
//Author_Name  : TANISH_SHAH
//File_Name    : mem_gen_simul.sv
//File_Path    : 
//Class_Name   : mem_gen_simul               
//Project_Name : Dual_Port_Ram
//Description  :
//
/////////////////////////////////////////////////
`ifndef GEN__SIMUL_SV
`define GEN_SIMUL_SV

class mem_gen_simul extends mem_gen;
int count=0;
bit [`ADDR_WID-1:0] que[$];

//virtual mem_intf vif;

//for reset by event

task run_phase();
// $display("perfect skeleton till top side of generatiro");
  repeat(50) begin
   trans=new();
   //---------------simultaneous------------------------------------------   
 if(!trans.randomize() with {trans.fnx_e==3;}) begin
		    $error("Randomization FAils");
                end
		super.put_wait();

end
endtask

endclass

`endif
