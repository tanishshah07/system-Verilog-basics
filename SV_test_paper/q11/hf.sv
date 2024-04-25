module hf(hf_intf.hf_mp mp);
 assign mp.s=mp.a+mp.b;
  assign mp.c=mp.a&mp.b;
endmodule
