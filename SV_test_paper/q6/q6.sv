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
  int a;
  function set_c(int a);
   this.a=a;
   super.a=a+2; 
    //b=a+a;   // child can not accers the local property of the parent
    c=a+32;
  endfunction
    function void dis();
	    super.dis();
      $display("the a of chid is %0d",this.a); 
      $display("the a of child inherited by parent is %0d",super.a); 
      $display("the c of child  %0d",c);
  endfunction
endclass


module exp();
  
  parent p1;
  child c1;
  initial begin
    p1=new();
    c1=new();
    
   p1.a=29;
   p1.set(18);
   p1.dis();
   c1.a=12;
   c1.set_c(29);
   c1.dis();
    $finish;
  end
endmodule
