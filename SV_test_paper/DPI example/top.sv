//`include "add.c"
module top();
import "DPI-C" function void plus(int a,int b);
initial begin
plus(3,9);

end


endmodule
