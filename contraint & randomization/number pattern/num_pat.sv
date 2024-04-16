//1
//2 4
//3 6 9
//4 8 12 16
//5 10 15 20 25
module num_pat();

class exp;
rand int arr[5][5];

constraint con1{
 foreach(arr[i]){
  foreach(arr[i][j]){
	  if(i>=j){
	    arr[i][j]==(j+1)*(i+1);
	  }
	  else {
	   arr[i][j]==0;
	  }
  }
 }
}

function void dis();
	foreach(arr[i]) begin
		for(int j=0;j<5;j++) begin
	          $write("%d ",arr[i][j]);
	        end
		$display("\n");
	end
 $display("arr=%p",arr);
endfunction
endclass

exp e1;
initial begin
 e1=new();
 e1.randomize();
 e1.dis();


end

endmodule
