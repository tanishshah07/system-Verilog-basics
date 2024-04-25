`include "pkag.sv"
module envir(and_intf.tb_mp mp);
import pkg::*;

class env;
 
 mailbox #(and_transx) gen_drv=new();
 and_gen g1;
 and_drv d1;
 
function new();
  g1=new(gen_drv);
  d1=new(gen_drv);
  //trans=new();
 endfunction

 task run_phase();
	 //g1=new(gen_drv);
	 //d1=new(gen_drv);
//	 trans=new();
       
	 g1.run_phase();
	 d1.run_phase();
         mp.a=d1.trans.a;
	 mp.b=d1.trans.b;
 endtask
endclass

env e1=new();
endmodule
