//`include "transcation.sv"

class and_gen;
 and_transx trans;
 mailbox #(and_transx)gen_drv;

 function new(mailbox #(and_transx) gen_drv);
   this.gen_drv=gen_drv;
   trans=new();
 endfunction

 task run_phase();

   if(!trans.randomize()) $error("Randomization of trans failed");
    gen_drv.put(trans);

 endtask
endclass
