
module m();
int x;
class p;
 int a;
  function new (int a);
    this.a=a;
    $display("the a is %d",this.a);
  endfunction
endclass

class c extends p(x);
 int b;
//   function new();
//     super.new(4);
//     $display("tu child me hai");
//   endfunction
endclass

  c c1;
  p p1;
  initial begin
    p1=new(3);
    c1=new(x);       //the only problem with the extends pass is not passes the variables
  
  end
endmodule
