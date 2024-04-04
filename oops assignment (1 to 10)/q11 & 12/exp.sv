class p;
   int a;
  static int b;
  function void set(int a,b);
   this.a=a;
    this.b=b;
  endfunction
  function void dis();
    $display("the a is %d b is %d",a,b);
  endfunction
endclass

class c extends p;
 int a;
  function void setc();
    set(3,2);
  endfunction
  function void disc();
    $display("the a is %d a parent is %d",a,super.a);
  endfunction
endclass

module exp();
  p p1;
  c c1;
  initial begin
    p1=new();
    c1=new();
    c1.setc();
    c1.dis();
    c1.disc(); 
    p1.b=99;
    c1.a=93;
    p1.dis();
    c1.dis();
  end
endmodule
