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

task build();
  gen=new();
  drv=new();
  mon=new();
  rfm=new();
  scr=new();
endtask


function void connect(virtual mem_intf vif);
  this.vif=vif;
  gen.connect(gen2drv);
  drv.connect(gen2drv,vif);
  mon.connect(mon2rfm,mon2scr,vif);
  rfm.connect(mon2rfm,rfm2scr);
  scr.connect(mon2scr,rfm2scr);
endfunction

task run_phase();
fork
 gen.run_phase();
 // $display("perfect skeleton till intenverionment ");
 drv.run_phase();
 mon.run_phase();
 rfm.run_phase();
 scr.run_phase();
join_any
endtask


endclass
`endif

