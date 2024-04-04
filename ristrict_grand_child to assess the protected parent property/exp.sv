class parent;
 int a;
  protected int b;
  function void dis();
    $display("the value of a and b are %d and %d",a,b);
  endfunction
  function void set(int a,b);
    this.a=a;
    this.b=b;
  endfunction
endclass

 class child  extends parent;
  int b;
  function dis();
    $display("the protected variable is %D",super.b);
  endfunction
endclass

class grand_child extends child;
  function dis();
    $display("the protected variable not acces here %d",super.b);
  
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
  p1.set(3,77);
  p1.dis();
  c1.dis();
  cc1.dis();

end
endmodule
