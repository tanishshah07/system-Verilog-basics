`ifndef SCR_SV
`define SCR_SV

class mem_scr;
	mem_transx trans,trans_exp;
 mailbox #(mem_transx) mon2scr;
 mailbox #(mem_transx) rfm2scr;

function new(mailbox #(mem_transx) mon2scr,rfm2scr);
	this.mon2scr=mon2scr;
	this.rfm2scr=rfm2scr;
	trans_exp=new();
endfunction

task run_phase();
forever begin
 mon2scr.get(trans);
 rfm2scr.get(trans_exp);
 //#1;
 //$display("inside scr");
 trans.dis("scoreboard");
 if(trans.fnx_e!=0) begin
 if((trans.rd_data==trans_exp.rd_data) && trans.fnx_e==2) $display("scoreboard in read, passed");
 if((trans.wr_data==trans_exp.wr_data) && trans.fnx_e==1) $display(" scoreboard in write passed");

end
end
endtask

endclass





`endif
