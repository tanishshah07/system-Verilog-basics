////////////////////////////////////////////////
//
//Company_Name : Scaledge
//Author_Name  : TANISH_SHAH
//File_Name    : mem_gen_test_ibr.sv
//File_Path    : 
//Class_Name   : mem_gen_test_ibr               
//Project_Name : Dual_Port_Ram
//Description  :
//
/////////////////////////////////////////////////
`ifndef GEN_D_SV
`define GEN_D_SV

//typedef mem_test;
class mem_gen_test_ibr extends mem_gen;

int count=0;
//bit [`ADDR_WID-1:0] que[$];

task run_phase();
// $display("perfect skeleton till top side of generatiro");
  repeat(10) begin
   trans=new();
    if(!trans.randomize()) $error("randomization is failed");
   	   // in between reset;
	   if(count==8||count==5) begin
		   //tr.reset(vif); //reset by callback we have to pass the argument because it is taking the vif od the test
		   //#10;
		   ->reset_on;  //reset by event
	   end
	   count++;
	   super.put_wait();
	   //$display("count is %d",count);
	   //trans.flag=1;
	   //$display("inside gen");
  //#1;
  //$display("perfect skeleton till generator %b",trans.wr_data);
    trans.dis("inside extended generator");
  end
 endtask

endclass

`endif

