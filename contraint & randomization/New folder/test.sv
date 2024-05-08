module exp();
class exp;
  string packet [];
  rand bit [2:0] num_pkt;
  
  constraint exp_c {num_pkt inside {[1:4]};}
  
  constraint exp_c1 {
    num_pkt == 1 ->  packet[1] == "Only";
    num_pkt == 2 ->  packet[2] == "First" ;
    num_pkt == 3 ->  packet[2] == "Last";
    num_pkt == 4 ->  packet[3] == "Middle";
  }

  
  
function void pre_randomize();
     packet=new[4];
   endfunction
 endclass

  exp h1;

  initial begin
    h1 = new();
    if(!h1.randomize()) $error("Failed");
    $display("%0d,%0p", h1.num_pkt, h1.packet);
  end
endmodule
