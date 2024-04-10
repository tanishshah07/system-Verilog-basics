module sol_bef();

class con;
 rand bit[2:0] en;
 rand int val;
 constraint con1{solve en before val;
                  (en<=2) -> val inside {[5:10]}; 		 
 		} 
endclass

con c1;
initial begin
 c1=new();
 repeat(10) begin
  c1.randomize();
  $display("propertires are %p",c1);
 end
    end
endmodule
