//`include "pkag.sv"
//import pkg::*;
class env;
 virtual and_intf vif; //virtual interface 
 mailbox #(and_transx) gen_drv=new();  //generator to driver
 mailbox #(and_transx) mon_pre=new();  //monitior to predictor
 mailbox #(and_transx) mon_scor=new(); //monitor to scoreboard
 mailbox #(and_transx) ref_scor=new(); //predictor to scoreboard
 and_gen g1; //instance of generator
 and_drv d1;  //instance of Driver
 and_moni m1;  //instance of Moonitor
 ref_mod rf1;  //instance of refrence moddel
 and_scor scr;  //instance of scoreborad


function new(virtual and_intf vif);
  this.vif=vif;
  g1=new(gen_drv);
  d1=new(gen_drv,vif);
  m1=new(mon_pre,mon_scor,vif);
  rf1=new(mon_pre,ref_scor);
  scr=new(mon_scor,ref_scor);
 endfunction

 task run_phase();
	 fork
	 g1.run_phase();
	 d1.run_phase();
	 m1.run_phase();
         rf1.run_phase();
	 scr.run_phase();
 join_any
 endtask
endclass

