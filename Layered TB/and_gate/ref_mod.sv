class ref_mod;
mailbox #(and_transx) mon_pre;
mailbox #(and_transx) ref_scor;  
and_transx trans,trans_exp;

bit y_exp; //expected output 
function new(mailbox #(and_transx)mon_pre,mailbox #(and_transx)ref_scor);
	this.mon_pre=mon_pre;
	this.ref_scor=ref_scor;
	//trans=new();
	trans_exp=new();
endfunction

 task run_phase();
 forever begin
     mon_pre.get(trans);  //getting the inputs from monitor
     y_exp=trans.a&trans.b;
     trans_exp.y=y_exp;
     ref_scor.put(trans_exp); //passing expected output to the scoreboard
  end
  //$display(trans.a);
  //$display(trans.b);
  //$display(y_exp);
 
 endtask

endclass
