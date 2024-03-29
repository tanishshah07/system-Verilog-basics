module exp();
  int arr[];
  //int arr1[5]='{5{10}};
  int que[$];
  
initial begin
  arr=new[57];
  arr[20]=10;
  arr[34]=45;
  arr[56]=99;
  for(int i=0;i<=57;i++) begin
    que.push_front(0);
  end
   que.insert(20,10);
   que.insert(34,45);
   que.insert(56,99);
  
  $display("the array is arr[20]=%d",arr[20]);
  $display("the array is arr[34]=%d",arr[34]);
  $display("the array is arr[56]=%d",arr[56]);
  $display("hello %p",arr);
  
  $display("the queue is que[20]=%d",que[20]);
  $display("the queue is que[34]=%d",que[34]);
  $display("the queue is que[56]=%d",que[56]);
  $display("this is queue %p",que);
end
endmodule
