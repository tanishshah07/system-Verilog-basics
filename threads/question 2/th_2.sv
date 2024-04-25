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
  //automatic int j;
    foreach(e[i]) begin
      e[i]=new();
    end
  //foreach(e[i]) begin:f2
  for(int i=0;i<4;i++) begin:f1
  automatic int j;     //we have to give different j to all the for join_none so that we get differnt value in the function
    j=i;   
    fork
      e[j].write(j);
    join_none 
  end

  $display("hello tanish");  
end


  
endmodule
