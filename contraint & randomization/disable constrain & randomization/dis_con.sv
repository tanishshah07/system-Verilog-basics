module dis_con();
 class exp;
  randc bit [3:0] x;
  rand int y;
  constraint con1{
                    y<19;
	            y>3;
                 }
  function void dis();
   $display("X=%b | Y=%d",x,y);
  endfunction 
 endclass

 exp e1;
 
 initial begin
  e1=new();
  repeat(5) begin
  int i;	  
   e1.randomize();
   e1.dis();
   if(i==3) e1.rand_mode(0);
   if(i==2) e1.constraint_mode(0);
   i++;
  end
 end

endmodule
