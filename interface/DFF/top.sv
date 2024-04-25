
`include "intf.sv"
`include "dff_tb.sv"
`include "dff.sv"

module top();
   bit clk;
dff_intf intf(clk);
dff_tb tb(intf);
dff dut(intf);

initial begin
forever begin
         #5 clk=~clk;
  end
end

endmodule
