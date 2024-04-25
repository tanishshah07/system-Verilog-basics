class and_scor;
mailbox #(and_transx) mon_pre;
mailbox #(and_transx) mon_scor;
mailbox #(and_transx) ref_scor;
and_transx trans;
and_transx trans_exp;

function new(mailbox #(and_transx)mon_scor,mailbox #(and_transx)ref_scor);
//trans=new();
//trans_exp=new();

this.mon_scor=mon_scor;
this.ref_scor=ref_scor;
endfunction


task run_phase();
	forever begin
	mon_scor.get(trans);
	ref_scor.get(trans_exp);
	#1;
	//$display(trans.y);
	//$display(trans_exp.y);
 if(trans.y==trans_exp.y) $display("passeed at input %b and %b out is %b",trans.a,trans.b,trans.y);
 else $error("FAil");
 end

endtask

endclass
