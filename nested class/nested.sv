module nested();

class pkt;
	function new();
	  
	endfunction
 class my_pkt;
  class sample;
    static int count;
    int b;
    static function void set(int co);
      count=co;
    endfunction  
  endclass : sample
 
 endclass : my_pkt

endclass : pkt

pkt p1;
my_pkt mp1;
sample s1;
initial begin
 pkt::my_pkt::sample::set(8);
 $display("count is %d",pkt::my_pkt::sample::count);
 pkt::my_pkt::sample::count=87;
 $display("count is %d",pkt::my_pkt::sample::count);
 p1=new();
 
 p1.mp1.s1.count=99;

end


endmodule
