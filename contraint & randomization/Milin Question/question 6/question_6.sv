module top();
class A;
	rand int arr1[];
	rand int arr2[];
	rand bit [3:0] arr3[];
       int sum;
	constraint con1{arr1.size()<40;
		        arr1.size()>30; 
			arr2.size()<30;
			arr3.size()<30;
		  }
        
constraint con2{
	foreach(arr1[i]){
	 arr1[i] inside {[1:100]};
	}
	
	foreach(arr2[i]){
	 arr2[i] inside {[1:100]};
	}

	//foreach(arr3[i]){
	 //arr3[i] inside {[1:100]};
	//}
 arr2.sum()<100;
 //arr3.sum()>100;
}
	function void disp();
		sum = arr2.sum;
		$display("arr1 : %p",arr1);
		$display("arr2 : %p",arr2);
		$display("sum of arr2%d",sum);
		$display("arr3 : %p",arr3);
		$display("size of arr1 : %0d",arr1.size);
		$display("size of arr2 : %0d",arr2.size());
		$display("size of arr3 : %0d",arr3.size());
		$display("sum of arr3 : %0d",arr3.sum);
	endfunction 

endclass

	A obj;
	initial begin
		obj = new();
		repeat(1) begin
			if(obj.randomize()!=1) $error("randomization is failes");
			obj.disp();
		        
		$display("sum of arr2 : %d",obj.sum);
		end 
	end 
endmodule 
