////////////////////////////////////////////////
//
//Company_Name : Scaledge
//Author_Name  : TANISH_SHAH
//File_Name    : mem_gen_sanity.sv
//File_Path    : 
//Class_Name   : mem_gen_sanity               
//Project_Name : Dual_Port_Ram
//Description  :
//
/////////////////////////////////////////////////
`ifndef GEN__SANITY_SV
`define GEN_SANITY_SV

class mem_gen_sanity extends mem_gen;
int count=0;
bit [`ADDR_WID-1:0] que[$];

//virtual mem_intf vif;

//for reset by event

task run_phase();
// $display("perfect skeleton till top side of generatiro");
  repeat(50) begin
   trans=new();
	//----------------------------------------------------------------
	   if(count<25) begin 
		   if(!trans.randomize() with {trans.fnx_e==1;trans.wr_addr inside {0,15};}) begin
		    $error("Randomization FAils");
		   end
                   //trans.dis("Sanity generator");
		   //trans.wr_data=8'd26;
		   que.push_back(trans.wr_addr);
	   end
	   else if(count>=25) begin 
		   if(!trans.randomize() with {trans.fnx_e==2;trans.rd_addr==que[count-25];}) begin
		     $error("Randomization FAils");
		   end
                   //trans.dis("Sanity generator");
	   end
  count++;
  super.put_wait();
  end
 endtask

endclass
`endif

