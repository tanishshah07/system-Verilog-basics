module mod();
typedef enum {s1,s0,sx,sz} state;
 class exp;
  logic x;
  rand state sg; 
  function void dis();
    $display(x);
  endfunction
  function void post_randomize();
    case(sg)
	    s1:x=1'b1;
	    s0:x=1'b0;
	    sx:x=1'bx;
	    sz:x=1'bz;
    endcase

  endfunction
 endclass

 exp e1;

 initial begin

  e1=new();
  repeat(17) begin
  e1.randomize();
  e1.dis();
  end
 
 end

endmodule
