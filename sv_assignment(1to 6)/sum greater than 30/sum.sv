module sum();
  int arr[200];
  int sum;
  initial begin
    for(int i=0;i<200;i++) begin
      arr[i]=$urandom_range(1,51);
    end
    $display("array is %p",arr);
    for(int i=0;i<200;i++) begin
      if(arr[i]>30) sum=sum+arr[i];
    end
    $display("the addition is %D",sum);
   end
endmodule
