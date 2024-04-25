class and_drv;
and_transx trans;
 mailbox #(and_transx)gen_drv;

function new(mailbox #(and_transx)gen_drv);
   this.gen_drv=gen_drv;
   trans=new();
 endfunction

 task run_phase();
    
         gen_drv.get(trans);
   
   
 endtask

 //task driv();
    
 
 //endtask
 

endclass
