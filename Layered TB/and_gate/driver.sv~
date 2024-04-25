class and_drv;
//instance of trans
and_transx trans;
 // mailbox for generator to driver
 mailbox #(and_transx)gen_drv;
 // virtual interface
 virtual and_intf vif;


function new(mailbox #(and_transx)gen_drv,virtual and_intf vif);
   this.gen_drv=gen_drv;//connection of mailbox
   this.vif=vif;        //connection of interface
 endfunction

 task run_phase();
  forever begin
   gen_drv.get(trans);  //getting the info from generator
   //trans_cp=new trans;
   vif.a=trans.a;   //trans level to pin level
   vif.b=trans.b;
  //$display($time,"from drvier %b",vif.a);
  //$display($time,"from driverr %b",vif.b);
  #2;
  end  
 endtask
 

endclass
