module unique_element();
  int arr[0:19];
  int k;
  int arru[$];
  initial begin
    for(int i=0;i<20;i++) begin
      arr[i]=$urandom_range(1,15);
    end
    
    $display("array is %p",arr);
    /*
    for(int i=0;i<20;i++) begin
      k=0;
      for(int j=0;j<20;j++) begin
        if (i!=j) if(arr[i]==arr[j]) k++;
        //else continue;
      end
      if(k==0) begin
        $display("unique %d",arr[i]);
      end
    end
    */
   arru=arr.unique;
    $display("array is %p",arru);
   end
endmodule
