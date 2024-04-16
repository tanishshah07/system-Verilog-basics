//Write a constraint such that when rand bit[3:0] a is randomized, the value of “a” should not be same as 5 previous occurrences of the value of “a”.
module exp();

class exp;
rand bit [3:0] a;
bit [3:0] chek[$];
int count;
constraint con1{
 foreach(chek[i]){
  a!=chek[i];
 }
}


function void post_randomize();
 count++;
 if(count>5) chek.pop_front;
 chek.push_back(a);
endfunction
function void dis();
 $display("a-%d",a);
endfunction

endclass 

exp e1;
initial begin
 e1=new();

 repeat(10) begin
  e1.randomize();
  e1.dis();
 end
end
endmodule
