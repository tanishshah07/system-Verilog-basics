`ifndef TST_SV
`define TST_SV
class mem_test;
virtual mem_intf vif;
mem_env env;
function connect(virtual mem_intf vif);
	this.vif=vif;
	env.connect(this.vif);
endfunction

task build();
	env=new();
        env.build();
endtask

task run_phase();
  env.run_phase();
endtask

endclass

`endif
