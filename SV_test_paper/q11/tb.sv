module tb(hf_intf.tb_mp mo);
initial begin
int x=1;
 mo.a=1;
 mo.b=0;
 //#1;
 $display("sum is %d",mo.s);
 $display("X is %d",x);
 $display("carry is %d",mo.c);
end
endmodule
