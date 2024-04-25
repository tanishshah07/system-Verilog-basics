
module dff(dff_intf.dff_mp mo);

 always@(posedge mo.clk) begin
   if(mo.rst) mo.q<=0;
   else mo.q<=mo.d;
 end

endmodule 
