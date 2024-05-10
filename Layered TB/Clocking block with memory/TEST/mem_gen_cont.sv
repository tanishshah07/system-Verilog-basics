////////////////////////////////////////////////
//
//Company_Name : Scaledge
//Author_Name  : TANISH_SHAH
//File_Name    : mem_gen_cont.sv
//File_Path    : 
//Class_Name   : mem_gen_CONT               
//Project_Name : Dual_Port_Ram
//Description  :
//
/////////////////////////////////////////////////
`ifndef GEN__CONT_SV
`define GEN_CONT_SV

class mem_gen_cont extends mem_gen;
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
		   if(!trans.randomize() with {trans.fnx_e==1;trans.wr_addr==7;}) begin
		    $error("Randomization FAils");
		   end
                   //trans.dis("Sanity generator");
		   //trans.wr_data=8'd26;
		   //que.push_back(trans.wr_addr);
	   end
	   else if(count>=25) begin 
		   if(!trans.randomize() with {trans.fnx_e==2;trans.rd_addr==7;}) begin
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

