class exp;
int a;
function void hello();
 $display("NAMASTE");
endfunction
endclass

module m();
 //exp ex1;
 initial begin
  ex1=new();

  ex1.hello();
 end
endmodule
