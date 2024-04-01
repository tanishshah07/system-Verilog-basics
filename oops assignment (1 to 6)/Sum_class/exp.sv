class sum;
int num1,num2;
int num_s;
function void sum();
 num_s=num1+num2;
 $display("the summation is %d",num_s);
endfunction
endclass

module exp();
sum s[10];
initial begin
	foreach(s[i]) begin
	 s[i]=new();
	end
	foreach(s[i]) begin
	 s[i].num1=$urandom_range(1,10);
	 s[i].num2=$urandom_range(1,10);
	 s[i].sum();
	end



end
endmodule
