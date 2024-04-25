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

 function void dcopy(main m1);
   this.a=m1.a;
   this.s1=new m1.s1;
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
      
      //m2= new m1;
      m2.dcopy(m1); // this is deep copy 
      m2.a=7;
      m2.s1.a=17;
      m2.dis();
      m2.s1.dis();
      m1.s1.dis();  // disadvantage to shallow copy
    end
  endmodule
