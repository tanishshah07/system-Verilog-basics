////////////////////////////////////////////////
//
//Company_Name : Scaledge
//Author_Name  : TANISH_SHAH
//File_Name    : apb_mon.sv
//File_Path    : 
//Class_Name   : apb_mon              
//Project_Name : APB SLAVE
//Description  :
//
/////////////////////////////////////////////////
`ifndef MON_SV
`define MON_SV
 //`define MI vif.DRV.mon_cb
class apb_mon;
 apb_trans trans;
 mailbox #(apb_trans) mon2rfm;
 mailbox #(apb_trans) mon2scr;

 virtual apb_intf vif;

function void connect (mailbox #(apb_trans) mon2rfm,mailbox #(apb_trans) mon2scr,virtual apb_intf vif);
	this.mon2rfm=mon2rfm;
	this.mon2scr=mon2scr;
	this.vif=vif;
endfunction


task run_phase();

	forever begin
	 trans=new();
	 @(vif.mon_cb);
	 $cast(trans.fnx_e,1);
	 trans.pwdata=vif.mon_cb.pwdata;
	 trans.paddr=vif.mon_cb.paddr;
	 mon2rfm.put(trans);
	 trans.dis("inside Monitior");
	end
endtask
endclass
`endif
