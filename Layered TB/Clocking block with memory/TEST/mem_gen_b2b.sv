////////////////////////////////////////////////
//
//Company_Name : Scaledge
//Author_Name  : TANISH_SHAH
//File_Name    : mem_gen_b2b.sv
//File_Path    : 
//Class_Name   : mem_gen_sanity               
//Project_Name : Dual_Port_Ram
//Description  :
//
/////////////////////////////////////////////////
`ifndef GEN__B2B_SV
`define GEN_B2B_SV

class mem_gen_b2b extends mem_gen;
int count=0;
bit [`ADDR_WID-1:0] que[$];

//virtual mem_intf vif;

//for reMemory Verification Coding (ETA: 6/05/2024) set by event

task run_phase();
// $display("perfect skeleton till top side of generatiro");
  repeat(50) begin
   trans=new();
	//-----------------------------------------------------------------
	// BACK @ BACK
	if(count%2==0) begin
          if(!trans.randomize() with {trans.fnx_e==1;}) begin
		    $error("Randomization FAils");
                end
                 trans.dis("Back 2Back Write generator");
		 que.push_back(trans.wr_addr);
                 super.put_wait();
		 count++;
       end

       else if(count%2!=0) begin
          if(!trans.randomize() with {trans.fnx_e==2;trans.rd_addr==que[0];}) begin
		    $error("Randomization FAils");
                end
                 trans.dis("Back 2Back Read generator");
		 que.pop_front();
                 super.put_wait();
		 count++;
       
       end
   end
 endtask

endclass
`endif