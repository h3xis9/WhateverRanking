function formCheck(){
			    
    //var flag = 0;
    

    var flag = 0;
    
    var i = 0;
    
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
    
    if( flag ){
        window . alert( '必須項目は全て入力して下さい。' );
        return false;
    }else{
        return true;
    }
    
    
    /*
    if( document . Form1 . InputText1 . value == "" ){
	    
        flag = 1;
        document . getElementById( 'notice-input-text-1' ) . style . display = "block";
        
    }else if( document.Form1.InputText2.value == "" ){
	    
	    flag = 1;
        document . getElementById( 'notice-input-text-2' ) . style . display = "block";
        
	}else if( document.Form1.InputText3.value == "" ){
	    
	    flag = 1;
        document . getElementById( 'notice-input-text-3' ) . style . display = "block";
        
	}else if( document.Form1.InputText4.value == "" ){
	    
	    flag = 1;
        document . getElementById( 'notice-input-text-4' ) . style . display = "block";
        
	}else{
        
        document . getElementById( 'notice-input-text-1' ) . style . display = "none";
        document . getElementById( 'notice-input-text-2' ) . style . display = "none";
        document . getElementById( 'notice-input-text-3' ) . style . display = "none";
        document . getElementById( 'notice-input-text-4' ) . style . display = "none";
        
        
    }
   
    if( flag ){
        window . alert( '必須項目は全て入力して下さい。' );
        return false;
    }else{
        return true;
    }
    
    */
}