class parent;
  int a;
  local int b;
  protected int c;
  
  function void dis();
    $display("the public is %0d ,local is %0d protected is %0d",a,b,c);  
  endfunction 
 
  function void set(int b); // how to access/update the local proper ty or method of the class
   this.b=b;
  endfunction 
endclass

class child extends parent;
  int a; // we have overidded the a now child has 2 a one of tis own and one from parent
  function set_c(int a);
   this.a=a;
   super.a=a+2; 
    c=a+32;
  endfunction
    function void dis_c();
      $display("the a of chid is %0d",this.a); 
      $display("the a of child inherited by parent is %0d",super.a); 
      $display("the c of child  %0d",c);
  endfunction
endclass

class grand_child extends child;
 int a;
  function void set_cc(int a);
   this.a=a;
    super.a=a+3;
    //super.super.a=a+4;
    c=a+4;
  endfunction
  function void dis_cc();
    $display("the a of grand chid is %0d",this.a); 
    $display("the a of grand child inherited by child is %0d",super.a); 
      $display("the c of child  %0d",c);
  endfunction

endclass

module exp();
  
  parent p1;
  child c1;
  grand_child cc1;
  initial begin
    p1=new();
    c1=new();
    cc1=new();
    
   p1.a=29;
   p1.set(18);
   p1.dis();
   c1.a=12;
   c1.set_c(7);
   c1.dis_c();
    cc1.set_cc(22);
    cc1.dis_cc();
    $finish;
  end
endmodule
