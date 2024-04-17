`ifndef TYPE_DF_SV
`define TYPE_DF_SV

module diff_mailbox();

class tx;
 int x; 
 mailbox #(int) mbx;
 task petter();
   mbx=new();
   repeat(10) begin
     x=$urandom_range(1,34);
     mbx.put(x);
        $display("X is %d",x);
	$display("number is %d",t1.mbx.num());
   end
 endtask

endclass


class rx;
 int y;
 mailbox #(int) mbx1;
 task getter();
   repeat(10) begin
     mbx1.get(y);
     $display("Y is %d",y);
     $display("number of rx %d",mbx1.num());
   end
 endtask
 task connect(mailbox #(int) mbx);
	 this.mbx1=mbx;
 endtask

endclass

tx t1;
rx r1;

initial begin
 t1=new();
 r1=new();

 t1.petter();
 r1.connect(t1.mbx);
 r1.getter();
end
endmodule

`endif
