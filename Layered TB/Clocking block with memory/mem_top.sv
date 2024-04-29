`ifndef TOP_SV
`define TOP_SV

//`include "mem_def.sv"
`include "ram_16x8.sv"
`include "mem_inter.sv"
`include "mem_pkg.sv"
module mem_top();
import pkg::*;
bit clk,rst;

mem_intf intf(clk,rst);
mem_test test;

ram dut(.clk(clk),
        .rst(rst),
	.wr_enb(intf.wr_enb),
	.rd_enb(intf.rd_enb),
	.wr_addr(intf.wr_addr),
	.rd_addr(intf.rd_addr),
	.rd_data(intf.rd_data),
	.wr_data(intf.wr_data)
      );

initial begin
 forever begin
  #5 clk=~clk;
 end
end

initial begin
 run_test();
 reset();
 //$display("tu top hai");
 #20;
 $finish;
end


initial begin
 //#23;
 forever begin
   @(reset_on);
   $display("reset task called @%t",$time);
   reset();
 end
end

task reset();
 @(negedge clk); // delay the reset 
  rst=1'b1;
  repeat (1) @(negedge clk);
  rst=1'b0;
endtask

task run_test();
 test=new();
 test.build();
 test.connect(intf);
 test.run_phase();
endtask

endmodule

`endif
