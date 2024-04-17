`ifndef TYPE_DF_SV
`define TYPE_DF_SV

module diff_mailbox();

mailbox #(int) mbox=new();

class tx;
 int x; 
 mailbox #(int) mbx;
 task petter();
   //mbx=new();
   repeat(10) begin
     x=$urandom_range(1,34);
     mbx.put(x);
        $display("X is %d",x);
	$display("number is %d",mbx.num());
   end
 endtask
 function new(mailbox #(int) mbx);
	 this.mbx=mbx;
 endfunction

endclass


class rx;
 int y;
 mailbox #(int) mbx1;
 task getter();
   forever begin
     mbx1.get(y);
     $display("Y is %d",y);
     $display("number of rx %d",mbx1.num());
   end
 endtask
 function new(mailbox #(int) mbx);
	 this.mbx1=mbx;
 endfunction

endclass

tx t1;
rx r1;

initial begin
 t1=new(mbox);
 r1=new(mbox);
 t1.petter();
 r1.getter();
end
endmodule

`endif
