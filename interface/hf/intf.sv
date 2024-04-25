interface hf_intf(input bit clk);
 logic s,c;
 logic a,b;
  modport hf_mp(input a,b,output s,c);
  modport tb_mp(output a,b,input s,c);
endinterface
