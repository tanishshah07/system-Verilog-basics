////////////////////////////////////////////////
//
//Company_Name : Scaledge
//Author_Name  : TANISH_SHAH
//File_Name    : abp_test.sv
//File_Path    : 
//Class_Name   : apb_env              
//Project_Name : APB SLAVE
//Description  :
//
/////////////////////////////////////////////////

class apb_test;
 apb_env env;
 virtual apb_intf vif;
 function void build();
  env=new();
    env.build();
 endfunction

 function void connect(virtual apb_intf vif);
	 this.vif=vif;
   env.connect(this.vif); 	 
 endfunction
 task run_phase();
   env.run_phase();
 endtask
endclass	
