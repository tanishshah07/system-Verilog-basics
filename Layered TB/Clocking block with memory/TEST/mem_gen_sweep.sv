////////////////////////////////////////////////
//
//Company_Name : Scaledge
//Author_Name  : TANISH_SHAH
//File_Name    : mem_gen_sweep.sv
//File_Path    : 
//Class_Name   : mem_gen_sweep               
//Project_Name : Dual_Port_Ram
//Description  :
//
/////////////////////////////////////////////////
`ifndef GEN__SWP_SV
`define GEN_SWP_SV

class mem_gen_sweep extends mem_gen;
int count=0;
bit [`ADDR_WID-1:0] que[$];



task run_phase();
// $display("perfect skeleton till top side of generatiro");
   for (int i=0;i<16;i++) begin
      trans=new();
          if(!trans.randomize() with {trans.fnx_e==1;trans.wr_addr==i;}) begin
		    $error("Randomization FAils");
	    end
                 super.put_wait();
   end

 for (int i=0;i<16;i++) begin
      trans=new();
          if(!trans.randomize() with {trans.fnx_e==2;trans.rd_addr==i;}) begin
		    $error("Randomization FAils");
          end
          super.put_wait();
 end
 endtask

endclass
`endif
