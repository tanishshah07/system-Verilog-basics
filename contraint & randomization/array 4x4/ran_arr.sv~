//randomize a 4x4 array in such a way that the value in the column is grater
//than its previous column
module ran_arr();

 class exp;
 rand int arr[4][4];
 
  constraint con1{
  foreach(arr[i]){
    foreach(arr[i][j]){
      arr[i][j] inside {[1:100]};
    }
  
  }

    foreach(arr[i]) {
      foreach(arr[i][j]){
	      if(j!=3){
       arr[i][3-j]>arr[i][2-j];
              }
      }
    }
  }

  function void dis();
    foreach(arr[i]) begin
      foreach(arr[i][j]) begin
        $display("arr[%0d][%0d]==%0d",i,j,arr[i][j]);
      end
    end
  endfunction 
 endclass

 exp e1;
 initial begin
  e1=new();
  repeat(1) begin
   if(e1.randomize()!=1)$error("Randomization is failed");
   e1.dis();
  end
 
 end


endmodule
