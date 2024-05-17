////////////////////////////////////////////////
//
//Company_Name : Scaledge
//Author_Name  : TANISH_SHAH
//File_Name    : apb_driv.sv
//File_Path    : 
//Class_Name   : apb_drv              
//Project_Name : APB SLAVE
//Description  :
//
/////////////////////////////////////////////////
`ifndef DRV_SV
`define DRV_SV
`define DI vif.DRV.drv_cb
class apb_drv;
 apb_trans trans;
 mailbox #(apb_trans) gen2drv;
 virtual apb_intf vif;

virtual function void connect (mailbox #(apb_trans) gen2drv,virtual apb_intf vif);
	this.gen2drv=gen2drv;
	this.vif=vif;
endfunction

virtual task run_phase();
 wait_for_reset_assert();//initial reset
 initialize(); // frive initial values
forever begin
 fork
	 
 begin
	  //@(`DI);
	reset_asserted(); //reset block
 end
 begin
//	 $display("Debut reset upeer");
  wait_for_reset_release(); //waiting for the reset release to 1
//	 $display("Debut reset lower");
 //if(`DI.prstn) begin
   drive_to_dut();  // drive the signal to DUT
->item_done;   // event triger to get the next transcation from generator
end
join_any
disable fork;
//wait_for_reset_release();
//end
 //disable fork;
 end
endtask

task reset_asserted();
	  @(`DI);
	  wait_for_reset_assert();
//	wait(`DI.prstn==0);
	  $display("inside reset");
	  initialize();
	  if(gen2drv.num()==0) begin
	    gen2drv.put(trans);
	  end
endtask

task drive_to_dut();
// $display("DEBUG D1");
$display("number vo value in mailbox %d",gen2drv.num());
 gen2drv.get(trans);
//$display("DEBUG D1");
 @(`DI);
 trans.dis("Driver");
 `DI.psel<=1;
 `DI.pwrite<=trans.pwrite;
 `DI.pwdata<=trans.pwdata;
 `DI.paddr<=trans.paddr;
// $display("DEBUG D2");
 @(`DI);
 //$display("DEBUG D3");
 `DI.penable<=1;
 //@(`DI);
 wait(`DI.pready==1);
 //@(`DI);
 `DI.penable<=0;
 //`DI.pwrite<=1'bz;
fork
 `DI.psel<=0;
join_none

endtask

task initialize();
 `DI.psel<=0;
 `DI.penable<=0;
endtask
task wait_for_reset_release();
 wait(`DI.prstn==1);
endtask

task wait_for_reset_assert();
 wait(`DI.prstn==0);
endtask
endclass
`endif
