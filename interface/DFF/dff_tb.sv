
module dff_tb(dff_intf.tb_mp mi);

initial begin
	//#2;
	mi.dff_cb.rst<=0;
	$monitor($time,"Q is %d",mi.dff_cb.q);
	//#3;
@(mi.dff_cb);
  mi.dff_cb.d<=1;
 @(mi.dff_cb);
  mi.dff_cb.d<=0;

 @(mi.dff_cb);
  $display($time,"Q is %d",mi.dff_cb.q);
  mi.dff_cb.d<=1;
  
 # 50 $finish;
end
endmodule
