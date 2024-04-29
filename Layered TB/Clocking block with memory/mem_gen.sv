////////////////////////////////////////////////
//
//Company_Name : Scaledge
//Author_Name  : TANISH_SHAH
//File_Name    : mem_gen.sv
//File_Path    : 
//Class_Name   : mem_gen               
//Project_Name : Dual_Port_Ram
//Description  :
//
/////////////////////////////////////////////////


`ifndef GEN_SV
`define GEN_SV
class mem_gen;
mem_transx trans;
int count=0;
bit [`ADDR_WID-1:0] que[$];
mailbox #(mem_transx) gen2drv;


function void connect(mailbox #(mem_transx) gen2drv);
 this.gen2drv=gen2drv;
endfunction

 task run_phase();
// $display("perfect skeleton till top side of generatiro");
  repeat(6) begin
   trans=new();
    if(!trans.randomize()) $error("randomization is failed");
    /*
	//-----------------------------------------------------------------
	// 3 write and 3 read;
	   if(count<3) begin 
		   trans.randomize() with {trans.fnx_e==1;};
		   que.push_back(trans.wr_addr);
	   end
  else if(count>=3) trans.randomize() with {trans.fnx_e==2;trans.rd_addr==que[count-3];};
  */
//-------------------------------------------------------------------------------------------
           //mem_top.reset(); //accesing reset task fail call back fail
	   gen2drv.put(trans);
	   // in between reset;
	   if(count==2||count==5) ->reset_on;
	   @(item_done);
	   count++;
	   //$display("count is %d",count);
	   //trans.flag=1;
	   //$display("inside gen");
  //#1;
  //$display("perfect skeleton till generator %b",trans.wr_data);
   //trans.dis("generator");
  end
 endtask


endclass
`endif

