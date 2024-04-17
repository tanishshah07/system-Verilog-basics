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
   #1;
   $display("Fail");
  end
 join_any
 disable fork 
 end
end

initial begin
 a=1;
 #13;
 

end
  
endmodule
