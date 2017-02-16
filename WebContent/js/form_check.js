function formCheck(){

    var flag = 0;
    
    var i = 0;
    
    if( document.getElementById("select_age").value == "0" ){
	    flag = 1;
	    document.getElementById("warning_age").style.display = "block";
	}else{
		document.getElementById("warning_age").style.display = "none";
	}
    
    while(i<4){
    	
    	var strIndex = (i+1) + "";
    	
	    if( document.getElementById("InputText" + strIndex).value == "" ){
		    flag = 1;
		    document.getElementById("notice-input-text-" + strIndex).style.display = "block";
		}else{
			document.getElementById("notice-input-text-" + strIndex).style.display = "none";
		}
    	
	    i++;
    }
    
   
    
    if(flag){
        
    	window.alert( '必須項目は全て入力して下さい。' );
        return false;
        
    }else{
        return true;
    }
    
}