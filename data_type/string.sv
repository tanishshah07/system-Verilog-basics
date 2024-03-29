module str();
string str1="System";
string str2="verilog";
string outr="@";
string st1_up,st2_lo;
byte out;
int l1,l2;

initial begin
 $display("the length of %s is %d",str1,str1.len());
 str1.putc(3,"T");
 $display("the changed %s" ,str1);
 out=str1.getc(4);
 $display("out is %d , %s",out,out); // or we can do the static casting for the string output out_string=string'(out);
 $display("the length of %s is %d",str2,str2.len());
 st1_up=str1.toupper();
 st2_lo=st1_up.tolower();
 $display("the updated strings are str1 = %s str2=%s",st1_up,st2_lo);
 l1=st1_up.compare(st2_lo);
 l2=st1_up.icompare(st2_lo);
 $display("the compare 1 is %d,compare 2 is %d",l1,l2); //passses return 0 fails returns non zero
 $display("the substr is %s ",str1.substr(0,3));
 //outr=outr.atoreal();
 //$display("atoreal is %d , %o ,%h ,%f, %b",outr.atoi(),outr.atooct(),outr.atohex(),outr.atoreal(),outr.atobin());
 $display("asiic to binary %b",outr.atobin());
 $finish;
end

endmodule
