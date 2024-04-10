module bidir_con();
 class con;
  rand int x,y,z,t;
  constraint con1{
                    x>20;
	            y<90;
		    z==x+y;
		    z<250;
		    t inside {x,y,z};
                 }
 endclass

 con c1;
 initial begin
  c1=new();
  c1.randomize();
  $display("%p",c1);
 
 end
endmodule
