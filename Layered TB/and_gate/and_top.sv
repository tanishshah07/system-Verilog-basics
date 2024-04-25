`include "pkag.sv"
`include "interface.sv"
`include "and.sv"
// including dut and interface and pakage as it is going to impot
module top();
//importing package
import pkg::*;
//taking instance of interface
 and_intf intf();
 //passing it through DUT
 and_d dut(intf);

 //taking instance of environment
 env eh;
 initial begin
	 //passing interface to virtual interface
	 eh=new(intf);
   eh.run_phase();
   //$display(intf.a);
   //$display(intf.b);
   //$display(intf.y);
  end

endmodule
