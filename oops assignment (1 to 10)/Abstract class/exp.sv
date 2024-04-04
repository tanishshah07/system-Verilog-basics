module exp();

virtual class parent;
  int a;
  pure virtual function void dis();
    
endclass

  class child1 extends parent;
   int a;
   function void dis();
     $display("the value of a is %d",a);
   endfunction
  endclass

 class child2 extends parent;
   int a;
   function void dis();
     $display("the value of a is %d",a);
   endfunction
  endclass
  
  
  parent p1;
  child1 c1;
  child2 c2;
  
  initial begin
    // p1=new();  // error 
    c1=new();
    c2=new();
    c1.a=90;
    c2.a=67;
    p1=c1;
    //p1=c2;
    p1.dis();
    
    
  
  end



endmodule
