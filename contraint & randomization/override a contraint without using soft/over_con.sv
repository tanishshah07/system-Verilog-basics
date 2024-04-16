//overide a constraint on a varialbe without using soft

module over_soft();
class ov;
 rand int x;
 function void dis();
  $display("X is %d",x);
 endfunction
 constraint con1{ 
                 x>2;
	         x<20;
                }
endclass

ov o1;
initial begin
 o1=new();
 repeat(10) begin
  std::randomize(o1.x) with {o1.x>20;}; //to override it we have to use the randomize from standard lib/
                                        //or we have to use the derived class
  o1.dis();
 end
end
endmodule
