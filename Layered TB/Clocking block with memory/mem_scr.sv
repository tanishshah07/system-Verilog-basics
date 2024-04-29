`ifndef SCR_SV
`define SCR_SV

class mem_scr;
	mem_transx trans,trans_exp;
 mailbox #(mem_transx) mon2scr;
 mailbox #(mem_transx) rfm2scr;

function void connect(mailbox #(mem_transx) mon2scr,rfm2scr);
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
 if(trans.fnx_e!=0) //begin
 fork
   begin
    if((trans.rd_data==trans_exp.rd_data)) $display("scoreboard in read, passed at %t",$time);
    else if((trans.rd_data!=trans_exp.rd_data))  $display("scoreboard in read, failed %t",$time);

    //if((trans.wr_data==trans_exp.wr_data) && trans.fnx_e==1) $display(" scoreboard in write passed");
    //else if ((trans.wr_data!=trans_exp.wr_data) && trans.fnx_e==2)  $display("scoreboard in write, failed %t",$time);
   end
   begin
     #20;
     $display("time out %t",$time);
   end
 
 join_any
 disable fork;
 //end
end

endtask

endclass





`endif
