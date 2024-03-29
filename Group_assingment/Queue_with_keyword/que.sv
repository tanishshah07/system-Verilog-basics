module que();

  int queue[$]; // queue
  int sumd[$];  // sum queue is having all the values greater than 40
  int index[$]; //index queue is having all the indices greater than 40
  int sum;
  initial begin  
    for(int i=0;i<100;i++) begin
      queue.push_front($urandom_range(0,60));
    end
    sumd=queue.find(x) with (x>40);
    index=queue.find(x) with (x>40);
    sum=sumd.sum();
    $display("the queue is %p",queue);
    $display("the sum d aarray is %p",sumd);
    $display("the sum is %d",sum);
    $display("the index is %p",index);
  end
endmodule
