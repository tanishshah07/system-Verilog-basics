module exp();
class ex;
  randc byte unsigned arr[3][3];
  constraint con1{
    foreach(arr[i]){
      foreach(arr[j]){
        arr[i][j] inside {[0:10]};
      }
    }
   
  }
  constraint con{
    arr[0].sum()==15;
    arr[1].sum()==15;
    arr[2].sum()==15;
    foreach(arr[i]){
      arr[0][i]+arr[1][i]+arr[2][i]==15;
    }
        arr[0][0]+arr[1][1]+arr[2][2]==15;
    arr[0][2]+arr[1][1]+arr[2][0]==15;
    
  }
  function void dis();
    foreach(arr[i]) begin
      foreach(arr[j]) begin
        $write("%0d\t",arr[i][j]);
      end
      $display(" ");
    end
  endfunction
  
endclass
  ex e1;
  initial begin
    e1=new();
    repeat(1) begin
    if(!e1.randomize()) $error("Failed");
    e1.dis();
    end
  end
endmodule
