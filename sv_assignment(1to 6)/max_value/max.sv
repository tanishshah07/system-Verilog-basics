module max_value();
  int arr[200];
  int k;
  int max [$];
  initial begin
    for(int i=0;i<200;i++) begin
      arr[i]=$urandom_range(1,11);
    end
    $display("array is %p",arr);
   /* for(int i=0;i<200;i++) begin
      k=0;
      for(int j=0;j<200;j++) begin
        if(arr[i]<arr[j]) k++;
      end
      if(k==0) $display("the maximum value is %d",arr[i]);
    end */
    arr.sort();
    max=arr.max();
    $display("thee maximum is %d",arr[199]);
    $display("thee maximum is %p",max);

   end
endmodule
