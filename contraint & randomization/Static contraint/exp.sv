module sta_con();

class exp;
 rand int x;
 rand logic [3:0] y;

 constraint con1{
                 x>20;
	         x<80;
                }
static constraint con2{
                        y<9;
                      }

 function void dis();
   $display("X=%D | Y=%b",x,y);
 endfunction
endclass


exp e1,e2;
initial begin
 e1=new();
 e2=new();

repeat(10) begin
  e1.randomize();
  e1.dis();
end
e1.con2.constraint_mode(0);   // as con2 is static it is also getting off for the e2 
$dipslay(\n" ");
repeat(10) begin
  e2.randomize();
  e2.dis();
end
end
endmodule
