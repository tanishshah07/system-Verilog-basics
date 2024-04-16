//Constraint to generate the patern 0102030405
module pat();

class exp;
 rand int arr[10];

 constraint con1{
  foreach(arr[i]){
   if(i%2!=0) arr[i]==(i+1)/2;
   else arr[i]==0;
  }
 
 }
 function void dis();
  $display("arr=%p",arr);
 
 endfunction
endclass

exp e1;
initial begin
 e1=new();
 if(e1.randomize()!=1) $error("randomization fails");
 e1.dis();


end



endmodule
