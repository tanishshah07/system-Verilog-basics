module img();

class ex;
rand int pix[16][16];

constraint con1{
  foreach(pix[i]){
    foreach(pix[j]){
      pix[i][j] inside {256,0};
    }
  }
  foreach(pix[i]){
    foreach(pix[j]){
      pix[i][j] dist {256:=40,0:=60};
    }
  }
}


function void dis();
	foreach(pix[i]) begin
		for(int j=0;j<16;j++) begin
	          $write("%d ",pix[i][j]);
	        end
		$display("\n");
	end
 $display("arr=%p",pix);
endfunction
endclass

ex e1;
initial begin
 e1=new();
 e1.randomize();
 e1.dis();

end


endmodule
