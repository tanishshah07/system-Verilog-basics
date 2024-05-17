////////////////////////////////////////////////
//
//Company_Name : Scaledge
//Author_Name  : TANISH_SHAH
//File_Name    : apb_scr.sv
//File_Path    : 
//Class_Name   : apb_scr              
//Project_Name : APB SLAVE
//Description  :
//
/////////////////////////////////////////////////
`ifndef SCR_SV
`define SCR_SV
class apb_scr;

apb_trans trans,trans_exp;
mailbox #(apb_trans) mon2scr;
mailbox #(apb_trans) rfm2scr;

virtual function void connect(mailbox #(apb_trans) mon2scr,rfm2scr);
 this.mon2scr=mon2scr;
 this.rfm2scr=rfm2scr;
 trans_exp=new();
endfunction

virtual task run_phase();
	
	forever begin
	  mon2scr.get(trans);
	  rfm2scr.get(trans_exp);
	  trans.dis("scoreboard");
          fork
	   prdata_checker();
	   plsverr_checker();
	  join
	end
endtask

task plsverr_checker();
 fork
 begin
    wait(trans.pslverr==trans_exp.pslverr) $info(" Pslverr test is passed");
 end
 begin
		#TIME_OUT;
		$error("TIME OUT FAILED of PRDATA");
 end
 join_any
 disable fork;
endtask

task prdata_checker();
   fork
                begin
			wait(trans.prdata==trans_exp.prdata) $info("read data test is passed");
		end
	begin
		#TIME_OUT;
		$error("TIME OUT FAILED of PRDATA");
	end
   join_any
   disable fork;

endtask
endclass
`endif
