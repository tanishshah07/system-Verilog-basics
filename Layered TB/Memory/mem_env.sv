`ifndef ENV_SV
`define ENV_SV
class mem_env;
 mailbox #(mem_transx) gen2drv=new();
 mailbox #(mem_transx) mon2rfm=new();
 mailbox #(mem_transx) mon2scr=new();
 mailbox #(mem_transx) rfm2scr=new();
 virtual mem_intf vif;

 mem_gen gen;
 mem_driv drv;
 mem_moni mon;
 mem_rfm rfm;
 mem_scr scr;

function new(virtual mem_intf vif);
  gen=new(gen2drv);
  drv=new(gen2drv,vif);
  mon=new(mon2rfm,mon2scr,vif);
  rfm=new(mon2rfm,rfm2scr);
  scr=new(mon2scr,rfm2scr);
  this.vif=vif;
endfunction

task run_phase();
fork
 gen.run_phase();
 // $display("perfect skeleton till intenverionment ");

 drv.run_phase();
 mon.run_phase();
 rfm.run_phase();
 scr.run_phase();
join_none
endtask


endclass
`endif

