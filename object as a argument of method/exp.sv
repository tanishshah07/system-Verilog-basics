class sub;
  int a;
   function void diss();
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
  
  function void obj_arg(sub s);
    s.a=33;
    s.diss();
  endfunction
endclass


  module exp();
   main m1,m2;
    sub s3;
    initial begin
      s3=new(96);
      m1=new(2,3);
      m1.dis();
      m1.s1.diss();
      
//       m2=new(5,18);
//       m2.dis();
//       m2.s1.diss();
      
//       m2=m1;
//       m2.a=7;
//       m2.s1.a=17;
//       m1.dis();
//       m1.s1.diss();
      
      
      s3.diss();
      m1.obj_arg(s3);
      s3.diss();
      
      
    end
  endmodule
