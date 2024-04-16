//Write a program using dynamic array. [i] array1: no. of elements should be between 30-40. [ii] array2: sum of all elements should be < 100 [iii] array3: sum of all elements should be > 100.
//
//
module exp();
class ar;
rand int arr1[];
rand int arr2[];
rand int arr3[];

constraint con1{
 arr1.size>30;
 arr1.size<40;
 arr2.size<30;
 arr3.size<30;
}

constraint con2{
	foreach(arr1[i]){
	 arr1[i] inside {[1:100]};
	}
	
	foreach(arr2[i]){
	 arr2[i] inside {[1:100]};
	}

	foreach(arr3[i]){
	 arr3[i] inside {[1:100]};
	}
 arr2.sum()<100;
 arr3.sum()>100;
}

function void dis();
  $display("arr1 = %p",arr1);
  $display("arr2 = %p",arr2);
  $display("arr3 = %p",arr3);
endfunction
endclass

ar a1;
initial begin
 a1=new();
 a1.randomize();
 a1.dis();
end

endmodule
