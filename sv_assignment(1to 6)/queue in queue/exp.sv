module exp();
  typedef int que1[$];
  que1 que[$];
  
  initial begin
    for(int i=0;i<16;i++) begin
      for(int j=0;j<56;j++) begin
        que[i].push_back(j);
     end
    end

    $display("the que is %p",que);
  end
endmodule
