`include "interface.sv"
`include "and.sv"
`include "env.sv"
module top();
 and_intf intf();
 and_d dut(intf);
 envir en(intf);

 //env eh;
 initial begin
   en.e1.run_phase();
   //#1;
   //$display(intf.a);
   //$display(intf.b);
   //$display(intf.y);
    //e_h.run_phase();
 end

endmodule
