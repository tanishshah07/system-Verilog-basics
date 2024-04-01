class sub;
  int a;
   function dis();
     $display("sub a is %d",a);
  endfunction
  function new(int a);
   this.a=a;
  endfunction
endclass

class main;
int a;
  sub s1;
  function void dis();
    $display("main a is %d",a);
  endfunction
  function new(int a,b);
    this.a=a;
    s1 = new(b);
  endfunction
endclass


  module exp();
   main m1,m2;
    
    initial begin
      m1=new(2,3);
      m1.dis();
      m1.s1.dis();
      
      m2=new(5,18);
      m2.dis();
      m2.s1.dis();
      
      m2=m1;
      m2.a=7;
      m2.s1.a=17;
      m1.dis();
      m1.s1.dis();
    end
  endmodule
