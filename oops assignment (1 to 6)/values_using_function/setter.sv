class exp;
int s1,s2;
function void setter(input int s1,input int s2);
 this.s1=s1;
 this.s2=s2;
 $display("the number 1st is %d",this.s1);
 $display("the number 2nd is %d",this.s2);
endfunction
endclass

module setter();
exp ex[2:0];
int nul;
initial begin
ex[1]=new();
ex[2]=new();
ex[1].setter(10,20);
//this is for question no.6
nul=ex.sum with (int'(item!=null));
$display("the nul is %d",nul);
end


endmodule
