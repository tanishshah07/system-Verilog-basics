module th_2();
class exp;
 task write(int i);
 $display($time,"Entering into the method %d",i);
 #10;
 $display($time,"Exiting from the method %d",i);
 endtask
endclass

  exp e[4];
  initial begin
    foreach(e[i]) begin
      e[i]=new();
    end
   fork
     e[0].write(1);
     e[1].write(2);
     e[2].write(3);
     e[3].write(4);
   join
  $display("hello tanish");  
end


  
endmodule
