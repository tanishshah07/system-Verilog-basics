//`include "transcation.sv"

class and_gen;
 and_transx trans; //taking the instance of the transaction class
 mailbox #(and_transx)gen_drv;  //mailbox for the generator to driver

 function new(mailbox #(and_transx) gen_drv);
   this.gen_drv=gen_drv;
 endfunction

 task run_phase();
   repeat(4) begin
   trans=new();
   if(!trans.randomize()) $error("Randomization of trans failed");
   //#1;
    gen_drv.put(trans);
     //$display($time,"Generator %b",trans.a);
     //$display($time,"generator %b",trans.b);
 end
 endtask
endclass
