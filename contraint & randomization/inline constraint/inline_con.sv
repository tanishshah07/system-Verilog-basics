module inline_con();

 class con;
  rand int x,y,z;
   
  constraint con1 {soft x<50;
	           soft x>9;
		   soft y==x;
		   soft z>3;
		   soft z<19;
                  }


  function void dis();
    $display("X=%d | Y=%d | Z=%d",x,y,z);
  endfunction
 
 endclass

 con c1;
 initial begin
   c1=new();
   repeat(10) begin
     c1.randomize() with {y==4;};
     c1.dis();
   
   end
   
 end


endmodule
