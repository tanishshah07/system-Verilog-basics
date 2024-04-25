module que1();

 class trans;
  rand bit msg[];
  typedef enum {data,control} typ;
  rand typ t1;
  constraint con1{
     msg.size() inside {[8:80]};
  }
 endclass

 class tx;
  trans tx_msg;
  mailbox #(trans) mbx;
  
  function new(mailbox #(trans) mbx);
	  this.mbx=mbx;
  endfunction

  task putter();
	  repeat(8) begin
    tx_msg=new();
    tx_msg.randomize();
    mbx.put(tx_msg);
    end
  endtask

endclass

class rx;
 trans rx_msg;
 mailbox #(trans) mbx;

 function new(mailbox #(trans) mbx);
    this.mbx=mbx;
 endfunction

 task getter();
   forever begin
        mbx.get(rx_msg);
        $display("the properties are %p",rx_msg);
   end
 endtask


endclass

mailbox #(trans) mbox=new();

tx t1;
rx r1;
initial begin
 t1=new(mbox);
 r1=new(mbox);
fork
 t1.putter();
 r1.getter();
join
end


endmodule
