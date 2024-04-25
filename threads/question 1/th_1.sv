module th_1();

bit a,b;

initial begin
 forever begin
 @(posedge a);
 fork 
  begin
   wait(b==1);
   $display("pass");
  end
  begin
   #15;
   #1; // this is for exact 15
   $display("Fail");
  end
 join_any
 disable fork;
 end
end

initial begin
 a=1;
 #1;
 //#16;
 b=1; 
end
  
endmodule
