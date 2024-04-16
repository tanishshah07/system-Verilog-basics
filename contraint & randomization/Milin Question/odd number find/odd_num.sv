//Derive odd numbers within the range of 10 to 30 using SV constraint.
//
module odd_num();

class exp;
rand int arr[];
constraint con1{
  arr.size()<30;
  arr.size()>=10;
}
constraint con2{
 foreach(arr[i]){
  arr[i]%2!=0;
  arr[i] inside {[10:30]};
 }
}


function void dis();
 $display("arr=%p",arr);
endfunction
endclass

exp e1;
initial begin
 e1=new();
 e1.randomize();
 e1.dis();

 
end

endmodule
