//Write a constraint for 4-bit dynamic array. The size of the array should be in between 15 to 20. There should be even number in odd locatons and odd number in even locations.

module arr();

class exp;
rand bit [0:3] ar [];
constraint con1{
 ar.size()<20;
 ar.size()>15;
}
constraint con2{
 foreach(ar[i]){
   if(i%2==0){
     ar[i]%2!=0;
   }
   else{
    ar[i]%2==0;
   }
 }
}

function void dis();
 $display("ar is %p",ar);
endfunction

endclass

exp e1;
initial begin
 e1=new();
 e1.randomize();
 e1.dis();

end

endmodule
