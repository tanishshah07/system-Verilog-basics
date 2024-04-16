//randomize a class variable which is not declare as rand or randc in
//3 differnet ways

module ex();

class exp;
 int a;
 logic [3:0] y;

 function void dis();
   $display("A==%d | y==%d",a,y);
 endfunction

endclass

exp e1;
initial begin
 e1=new();
 repeat (10) begin
   //e1.a=$urandom_range(1,19);  // method 1
   //e1.y=$urandom_range(1,13);
   std::randomize(e1.a,e1.y) with {e1.a>13;e1.a<100;e1.y<12;};  //method 2
   //method 3??

   e1.dis();
 end
end




endmodule
