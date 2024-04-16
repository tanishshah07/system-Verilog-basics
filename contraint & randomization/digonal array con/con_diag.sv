module con();
 class exp;
  rand int arr [5][5];
  
  constraint con1{
      foreach(arr[i]){
        foreach(arr[j]){
	   if(i!=0){
	     if(i==j){
	       arr[i][j]>arr[i-1][j];
               arr[i][j]>arr[i-1][j-1];
	     }
	   }
	}
      
      }
  }

constraint con2{
   foreach(arr[i]){
     foreach(arr[j]){
       arr[i][j]%2==1;
       arr[i][j] inside {[1:100]};
     }
   }
}

  function void dis();
    foreach(arr[i]) begin
      for(int j=0;j<5;j++) begin
       $write("%d ",arr[i][j]);
      end
      $display("\n");
    end
    $display("arr is %p",arr);
  endfunction
 
 endclass

exp e1;
initial begin
 e1=new();
 e1.randomize();
 e1.dis();

end

endmodule
