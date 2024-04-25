`ifndef TST_SV
`define TST_SV
class mem_test;
virtual mem_intf vif;
mem_env env;
function new(virtual mem_intf vif);
	this.vif=vif;
	env=new(this.vif);
endfunction

task run_phase();
  env.run_phase();
endtask
endclass

`endif
