class p;
 int a;
  function new (int a);
    this.a=a;
    $display("the a is %d",this.a);
  endfunction
endclass

class c extends p(1);
 int b;
//   function new();
//     super.new(4);
//     $display("tu child me hai");
//   endfunction
endclass

module m();
  c c1;
  p p1;
  initial begin
    p1=new(3);
    c1=new();
  
  end
endmodule
