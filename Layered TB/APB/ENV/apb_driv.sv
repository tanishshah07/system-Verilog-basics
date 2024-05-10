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
//`define DI vif.DRV.drv_cb
class apb_drv;
 apb_trans trans;
 mailbox #(apb_trans) gen2drv;
 virtual apb_intf vif;

function void connect (mailbox #(apb_trans) gen2drv,virtual apb_intf vif);
	this.gen2drv=gen2drv;
	this.vif=vif;
endfunction

task run_phase();
forever@(vif.drv_cb) begin
	//fork
 //begin
	 if(!vif.drv_cb.prstn) begin
		 $display("inside resert");
	  vif.drv_cb.psel<=0;
          vif.drv_cb.penable<=0;
	 end
 
 //end
else begin
 gen2drv.get(trans);
 trans.dis("Driver");
 //@(vif.drv_cb);
 vif.drv_cb.psel<=1;
 vif.drv_cb.pwrite<=1;
 vif.drv_cb.pwdata<=trans.pwdata;
 vif.drv_cb.paddr<=trans.paddr;
 @(vif.drv_cb);
 vif.drv_cb.penable<=1;
 ->item_done;
 end
 //join_any
 //disable fork;
 end
endtask

endclass
`endif
