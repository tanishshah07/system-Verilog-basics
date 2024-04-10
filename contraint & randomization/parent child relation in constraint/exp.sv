module top();

  class parent;
    rand int x;
    constraint con1{100>x;x>2;}
    function void dis();
      $display("X==%d",x);
    endfunction  
  endclass
  
  class child extends parent;
    rand int y;
    constraint con1{x>100;}
    constraint con2{100>y;y>2;}
    function void diss();
      $display("Y==%d",y);
      $display(" in heritad X==%d",super.x);
    endfunction    
  endclass

  parent p1;
  child c1;
   
  initial begin
    p1=new();
    c1=new();
    p1=c1;
    repeat(5) begin
      p1.randomize();
      c1.diss();
    end 
  end 
endmodule
