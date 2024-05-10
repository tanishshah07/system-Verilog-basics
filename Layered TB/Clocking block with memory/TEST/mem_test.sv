`ifndef TST_SV
`define TST_SV
class mem_test;
virtual mem_intf vif;
mem_env env;

mem_gen_test_ibr gen_ibr; //In between reset
mem_gen_sanity sanity;  //Sanity
mem_gen_b2b b2b;         // back 2 back
mem_gen_simul simul;    //simultaneous
mem_gen_sweep swp;      //sweep
mem_gen_cont cont;     //continuous

function void connect(virtual mem_intf vif);

if($test$plusargs("IBR")) begin
        gen_ibr=new();
	env.gen=gen_ibr;
end

if($test$plusargs("SANITY")) begin
        sanity=new();
	env.gen=sanity;
end

if($test$plusargs("B2B")) begin 
   b2b=new();
   env.gen=b2b;
end
if($test$plusargs("SIMUL")) begin 
   simul=new();
   env.gen=simul;
end
if($test$plusargs("SWWP")) begin 
   swp=new();
   env.gen=swp;
end
if($test$plusargs("CONT")) begin 
   cont=new();
   env.gen=cont;
end
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

//task for call back
/*
task reset(virtual mem_intf vif); 
 @(negedge vif.clk); // delay the reset 
  vif.rst=1'b1;
  repeat (1) @(negedge vif.clk);
  vif.rst=1'b0;
  $display("in reset");
endtask
*/

endclass

`endif
