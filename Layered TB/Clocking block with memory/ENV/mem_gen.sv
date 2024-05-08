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

//typedef mem_test;
class mem_gen;
mem_transx trans;

//mem_test tr;

//int count=0;
//bit [`ADDR_WID-1:0] que[$];
local mailbox #(mem_transx) gen2drv;
//virtual mem_intf vif;

//for reset by event

function void connect(mailbox #(mem_transx) gen2drv);
 this.gen2drv=gen2drv;
endfunction

/*
function void connect(mailbox #(mem_transx) gen2drv,virtual mem_intf vif);
 this.vif=vif;
 this.gen2drv=gen2drv;
endfunction
*/

virtual task run_phase();
// $display("perfect skeleton till top side of generatiro");
  //repeat(6) begin
   //trans=new();
  //  if(!trans.randomize()) $error("randomization is failed");
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
            //accesing reset task fail call back fail
	   // in between reset;
	   //if(count==2||count==5) begin
		   //tr.reset(vif); //reset by callback we have to pass the argument because it is taking the vif od the test
	//	   ->reset_on;  //reset by event
	  // end
	   //count++;
	   //put_wait();
	   //$display("count is %d",count);
	   //trans.flag=1;
	   //$display("inside gen");
  //#1;
  //$display("perfect skeleton till generator %b",trans.wr_data);
   //trans.dis("generator");
//  end
 endtask
 
protected task put_wait();
  gen2drv.put(trans);
  @(item_done);
 endtask
endclass
`endif

