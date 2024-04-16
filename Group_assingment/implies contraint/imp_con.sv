// randomize a varialbe (32 bits) b in such a way that it comes within the
// range 15 to 30 when another variable a is >5 && <20 ; it comes in range of
// 45 to 70 when a is >20 && <38 otherwise it always come in range 80 to 100

module imp_con();

class imp;
rand bit [31:0] b;
rand int a;

constraint con1{
                  if(a>5 && a<20){
		    b inside {[15:30]};
		  }
                  else if(a>20 && a<38) {
		    b inside {[45:70]};
		  }
                  else {
		   b inside {[80:100]};
		  }
               }

function void dis();
 $display("a==%d then b==%d",a,b);
endfunction
endclass

imp i1;
initial begin
 i1=new();
 repeat(10) begin
  i1.randomize();
  i1.dis();
 end

 i1.randomize() with {a==7;};
  i1.dis();
end


endmodule
