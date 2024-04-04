module exp();

 class parent;
int a;
  virtual function void dis();
    
    $display("the value of a is %d",a);
    
  endfunction
endclass

  class child1 extends  parent;
   int a;
   function void dis();
     super.dis(); 
     $display("the value of a is %d",a);
   endfunction
  endclass

 class child2 extends  parent;
   int a;
   function void dis();
     super.dis();
     $display("the value of a is %d",a);
   endfunction
  endclass
  
  
  parent p1;
  child1 c1;
  child2 c2;
  
  initial begin
    p1=new();
    c1=new();
    c2=new();
    
    p1.a=44;
    c1.a=90;
    c2.a=67;
    p1=c1;
    //p1=c2;
    p1.dis();
  end
endmodule
