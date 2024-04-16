//Constraint to generate unique numbers between 99 to 100

module uni_real();
class exp;
 randc real x;
 constraint con1{
  x inside {[99:100]};
 
 }
function void dis();
  $display("x is %f",x);
endfunction

endclass

exp e1;
initial begin
 e1=new();
 repeat(10) begin
  e1.randomize();
  e1.dis();
 end
end

endmodule
