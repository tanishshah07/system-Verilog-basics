module mod();

class exp;
 rand int arr[17];
  function void dis();
    $display("arr is %p",arr);
  endfunction
  constraint con1{
    unique{arr};
    foreach(arr[i]) {
     arr[i] inside {[1:30]};
    }
  }
endclass
  
  exp e1;
  initial begin
    e1=new();
    void'(e1.randomize());
    e1.dis();
  end
endmodule
