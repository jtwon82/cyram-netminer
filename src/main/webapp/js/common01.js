//replaceAll ("111-111-111", "-", "") -> "111111111"
function replaceAll(str, target, replace){
	return str.split(target).join(replace);
}
 

//�몃┝
String.prototype.trim = function() {
		var TRIM_PATTERN = /(^\s*)|(\s*$)/g;
		return this.replace(TRIM_PATTERN, "");
}


function retNoScript(str){
  	strings=strings.replace(/</g,"&lt;").replace(/>/g,"&gt;").replace(/&/g,"&amp;"); //script �쒓굅
 	return str;
}


function winOpenCenter(name, url, nWidth, nHeight, toolbar, menubar, statusbar, scrollbar, resizable)
  {
	toolbar_str = toolbar ? 'yes' : 'no';
    menubar_str = menubar ? 'yes' : 'no';
    statusbar_str = statusbar ? 'yes' : 'no';
    scrollbar_str = scrollbar ? 'yes' : 'no';
    resizable_str = resizable ? 'yes' : 'no';
    var winPosLeft = (screen.width - nWidth) / 2;  
    var winPosTop = (screen.height - nHeight - 100) / 2; 
    window.open(url, name, 'left='+winPosLeft+',top='+winPosTop+',width='+nWidth+',height='+nHeight+',toolbar='+toolbar_str+',menubar='+menubar_str+',status='+statusbar_str+',scrollbars='+scrollbar_str+',resizable='+resizable_str);
  }


//�대찓�쇱껜��
function isValidEmail(email) {
	var format = /^((\w|[\-\.])+)@((\w|[\-\.])+)\.([A-Za-z]+)$/;
    if (email.search(format) != -1)
        return true; 
    return false;
}


//�쒓�泥댄겕
function isValidKorean(data){
	var format = /^[\uac00-\ud7a3]*$/g;
    if (data.search(format) != -1)
        return true; 
    return false;
}

//***********************************************************************
function inDate(obj){
		if ((event.keyCode<48) || (event.keyCode>57) ){
			event.returnValue=false;
		}
		//alert(value.length)
		if(obj.value.length == 4){
			obj.value=obj.value+"-";
		}
		if(obj.value.length == 7){
			obj.value=obj.value+"-";
		}
	}

//�좎쭨泥댄겕
function checkDate(id){
	var gDate=document.getElementById(id).value;
	arr=gDate.split("-");
	if(arr.length!=3){
		return false;
	}else{
		if(!isValidDate(arr[0],arr[1],arr[2])){
		 	return false;
		}
	} 
	return true;
}

function isValidDate(syear, smonth, sday) {
	var temp, year, month, day;
	var days = new Array (31, 0, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);

	syear = syear.trim();
	smonth = smonth.trim();
	sday = sday.trim();
    if(syear.length != 4 ||smonth.length!=2||sday.length!=2 )
		return false;

    year = parseInt(syear);

	temp = smonth;
    if(temp.charAt(0) == '0')
        temp = temp.charAt(1);
    month = parseInt(temp);

    temp = sday;
    if(temp.charAt(0) == '0')
        temp = temp.charAt(1);
    day = parseInt(temp);

    // 占쏙옙짜 占싯삼옙
	if(year%4==0 && year%100 !=0 || year%400==0)
		days[1]=29;
	else
		days[1]=28;

	if(month < 1 || month > 12)
		return false;

	if(day > days[month-1] || day < 1)
		return false;
	return true;
}


//�곷Ц+�レ옄留�
function onlyAlpNum() {
     if((event.keyCode < 48) || 
         ((event.keyCode > 57) && (event.keyCode < 65)) || 
         ((event.keyCode > 90) && (event.keyCode < 97)) || 
         (event.keyCode > 122))
        event.returnValue = false;
}

//�レ옄
function onlyNum() {
     if(event.keyCode < 48 || event.keyCode > 57 ){
        event.returnValue = false;
	}
}

function onlyNumWithDot() {
	
	if(event.keyCode != 46 ){		//姨쒗룷��
     if(event.keyCode < 48 || event.keyCode > 57 ){
        event.returnValue = false;
     }
	}
}

function fn_chk_number(obj){
	var str = obj.value;
	obj.value = str.replace(/[^0-9]/g,'');
}

function onlyNumWithDash() {
    if(event.keyCode != 45) {		//--��ы룷��
    	if(event.keyCode < 48 || event.keyCode > 57 ){
    		event.returnValue = false;	
    	}
    }
}

//�レ옄留�
function onlyNumber(from) {
	for ( var i = 0; i < from.value.length; i++) {
		var str = from.value.charCodeAt(i);
		if (str < 48 || str > 57) {
			alert("�レ옄留� �낅젰�섏떎�� �덉뒿�덈떎. ");
			from.value = from.value.replace(from.value.charAt(i),"");
			// from.select(); //�댁슜�좏깮
			return false;
		}
	}
	return true;
}

//�쒓�留�
function onlyHangul() {
		if((event.keyCode < 12592) || (event.keyCode > 12687))
			event.returnValue = false
}


//�곷Ц+�レ옄
function isValidEngNum(str) {
		for(var i=0;i<str.length;i++) {
			achar = str.charCodeAt(i);                 
			if( achar > 255 )
				return false;
		}
		return true; 
}

//�꾪솕踰덊샇寃��
function isValidPhone(tel) {
	var format = /^(\d+)-(\d+)-(\d+)$/;		//xxx-yyyy-xxxx
	var format2 = /^(\d+)(\d+)(\d+)$/;		//xxxyyyyxxxx
	var format3 = /^(\d+)(\d+)-(\d+)$/;     //xxxyyyy-xxxx
	var format4 = /^(\d+)-(\d+)(\d+)$/;     //xxx-yyyy-xxxx
	
    if (tel.search(format) != -1 || tel.search(format2) != -1|| 
    	tel.search(format3) != -1 || tel.search(format4) != -1)
        return true;  
    return false;
}

 


//�ъ뾽�먮쾲�몄껜��
function check_companynum(num){
	
	 var checkID = new Array(1, 3, 7, 1, 3, 7, 1, 3, 5, 1);
	 var saupnum = num;
	 var i, Sum=0, c2, remander;
	 
	 for (i=0; i<=7; i++) Sum += checkID[i] * saupnum.charAt(i);
	
	 c2 = "0" + (checkID[8] * saupnum.charAt(8));
	 c2 = c2.substring(c2.length - 2, c2.length);
	
	 Sum += Math.floor(c2.charAt(0)) + Math.floor(c2.charAt(1));
	
	 remander = (10 - (Sum % 10)) % 10 ;
	 
	 if (Math.floor(saupnum.charAt(9)) != remander){
	  	return false;
	  	
	 }else{
	 	return true;
	 }
	 
}



//由ъ궗�댁쭠 �띿뒪�몄뿉由ъ뼱 
function resize_textarea(){ 
	var ad_obj=document.getElementsByTagName("textarea");
		 
		for(var i=0; i<ad_obj.length; i++){
			
			//parentNode name �ㅼ젙
			if(ad_obj[i].parentNode.name=="resize_ok") {	
				var borderH=(ad_obj[i].offsetHeight-ad_obj[i].clientHeight)/2;
				var lineC=(ad_obj[i].scrollHeight-borderH)/((ad_obj[i].clientHeight-borderH)/ad_obj[i].rows);
				
				
				if(isNaN(lineC)) lineC =0;	//NaN 처占쏙옙
				
				if (  lineC*16 < 300 ){ 
					ad_obj[i].style.height = 300;
				}else {
					ad_obj[i].style.height = lineC*16;	
				}
			}
		}
}

  


//媛쒖껜 �꾩튂 �뺤씤 
function getBounds(tag){ 
	var ret = new Object(); 
	if(document.all) { 
        var rect = tag.getBoundingClientRect(); 
        ret.left = rect.left + (document.documentElement.scrollLeft || document.body.scrollLeft); 
        ret.top = rect.top + (document.documentElement.scrollTop || document.body.scrollTop); 
        ret.width = rect.right - rect.left; 
        ret.height = rect.bottom - rect.top; 
    } else {
        var box = document.getBoxObjectFor(tag); 
        ret.left = box.x; 
        ret.top = box.y; 
        ret.width = box.width; 
        ret.height = box.height; 
    } 
	return ret; 
} 
	
	

	
//�띿뒪�몄뿉由ъ뼱 湲몄씠 泥댄겕 
function CheckTextAreaSize(obj,maxlen)
{
	var temp;  
	var msglen;
	msglen = 0;
	
	l = obj.value.length;
	
	tmpstr = "" ;
	
	
		for(k=0;k<l;k++)
		{
			temp = obj.value.charAt(k);

			if (escape(temp).length > 4)
				msglen += 2;
			else
				msglen++;
		
			if(msglen > maxlen) 
			{
				alert("�쒓� ��" + maxlen + "源뚯� �낅젰�� �� �덉뒿�덈떎");
				obj.value = tmpstr;
				break;
			}
			else 
			{
			
				tmpstr += temp;
			}
			
		}
	
}
	

//�レ옄瑜� 湲덉븸�⑥쐞濡� 蹂��
function getNumberToHangul(string,unit) 
{ 
    hn = new Array("��","��","��","��","��","��","��","移�","��","援�"); 
    hj = new Array("","留�","��","議�","寃�","��","��","��","援�","媛�","��","��","洹�","��븯��","�꾩듅吏","�섏쑀�","遺덇��ъ쓽","臾대웾���"); 
    ul = new Array("�곸쿇","�곷갚","�곸떗","��"); 
    tm = new Array(); 
    result = ""; 

    if (string.charAt(0)=="-"){ result = "留덉씠�덉뒪 ";              
    	string = string.substr(1,string.length-1); 
    } 
    loop_size = Math.ceil(string.length/4); 
    string2 = ""; 
    
    for (count=string.length; count >= 0; count--) 
        string2 += string.substring(count,count-1); 
        string = string2; 
        for (A=0;A<loop_size;A++) 
        { 
                  sum = hj[A] + " "; 
                  tm[A] = string.substr(A*4,4); 
                  tm2 = ""; 
                  for (count=tm[A].length; count >= 0; count--) 
                	  	tm2 += tm[A].substring(count,count-1); 
                        tm[A] = tm2; 
                        part_jari = tm[A].length; 
                        for (D=0;D<10;D++){ 
                        	for (B=0;B<10;B++) tm[A] = tm[A].replace(B,hn[B]); 
                        } 

                  if (part_jari == 4) tm[A] = tm[A].charAt(0)+"泥�"+tm[A].charAt(1)+"諛�"+tm[A].charAt(2)+"��"+tm[A].charAt(3); 
                  else if (part_jari == 3) tm[A] = tm[A].charAt(0)+"諛�"+tm[A].charAt(1)+"��"+tm[A].charAt(2); 
                  else if (part_jari == 2) tm[A] = tm[A].charAt(0)+"��"+tm[A].charAt(1);              
                  else tm[A] = tm[A].charAt(0); 
                  for (C=0;C<4;C++) 
                  { 
                        if (tm[A].match(ul[C])){ part_jari--; tm[A] = tm[A].replace(ul[C],""); } 
                  } 
                  if (part_jari != 0) tm[A] += sum; 
    } 
    for (loop_size;loop_size>-1;loop_size--) result += tm[loop_size]; 
          result = result.replace("undefined",""); 

    return result+unit; 
}





//3�먮━留덈떎 肄ㅻ쭏李띻린
function commify(n) {
  var reg = /(^[+-]?\d+)(\d{3})/;   // �뺢퇋��
  n += '';                          // �レ옄瑜� 臾몄옄�대줈 蹂��

  while (reg.test(n))
    n = n.replace(reg, '$1' + ',' + '$2');

  return n;
}


//�꾩껜移섑솚
function replaceAll(sValue, param1, param2) {
    return sValue.split(param1).join(param2);
}

//�レ옄媛믪뿉  肄ㅻ쭏 遺숈뿬�ｊ린 
function setMoneyString(obj){
	obj.value = commify(replaceAll(obj.value,",","") );
}


//Lpad zero
function lpadZero(n, digits) {
	  var zero = '';
	  n = n.toString();

	  if (n.length < digits) {
	    for (i = 0; i < digits - n.length; i++)
	      zero += '0';
	  }
	  return zero + n;
	}

//�낅젰李� 湲�먯닔 �쒗븳
function checkContentLength(content, max_length){
	var i;
	var string = content.value;
	var one_char;
	var str_byte = 0;
	var str_length = 0;
	for (i=0; i< string.length; i++){
		//�쒓� 異붿텧
		one_char = string.charAt(i);
		
		//�쒓��� 寃쎌슦 2瑜� �뷀븳��.
		if(escape(one_char).length > 4){
			str_byte = str_byte + 2;
		}
		
		//洹몄쇅�� 寃쎌슦�� 1�� �뷀븳��.
		else{
			str_byte++;
		}
		
		//�꾩껜 �ш린媛 max瑜� �섏� �딆쓣 寃쎌슦
		if(str_byte <= max_length){
			str_length = i + 1;
		}
	}
	
	//�꾩껜湲몄씠瑜� 珥덇낵�섎㈃
	if(str_byte > max_length){
		alert("湲�먯닔瑜� 珥덇낵 �낅젰�� �� �놁뒿�덈떎. \n 珥덇낵�� �댁슜� �먮룞�쇰줈 ��젣 �⑸땲��.");
	    content.value = string.substr(0, str_length);
	}
}

function tooltip(target, tooltip_seq ){
	var tooltip_index = null;
 	var replace_text = null;
 	/*	for(var i=0; i < $(".sub_conttxt tr  td").length; i++){
 		tooltip_index = $(".sub_conttxt tr  td").get(i);
 		replace_text = $(tooltip_index).html();
 		if(replace_text.indexOf("img") < 0 && replace_text.indexOf("input") < 0 &&  replace_text.indexOf("<a") < 0){
 			$(tooltip_index).html(replaceAll(replace_text, target, "<span class='KimDaeHyun' style='color : blue' onclick='viewTooltipCont("+tooltip_seq+")'>"+target+"</span>"));
 		}
 	}*/
 	
 	for(var i=0; i < $(".sub_conttxt ul  li").length; i++){
 		tooltip_index = $(".sub_conttxt ul  li").get(i);
		replace_text = $(tooltip_index).html();
		if(replace_text.indexOf("img") < 0 && replace_text.indexOf("input") < 0 &&  replace_text.indexOf("<a") < 0 &&  replace_text.indexOf("gif") < 0 &&  replace_text.indexOf("jpg") < 0 ){
 			$(tooltip_index).html(replaceAll(replace_text, target, "<span id='"+tooltip_seq+""+i+"' class='KimDaeHyun' style='color : blue;cursor: pointer;' onclick='viewTooltipCont("+tooltip_seq+","+tooltip_seq+""+i+",this)'>"+target+"</span>"));
 		}
 	}
}


function viewTooltipCont(tooltip_seq , tooltip_Id,obj){
   /* var isIE = false;
	if (navigator.appName == "Microsoft Internet Explorer"){
        isIE = true;
    }else{
        isIE = false;
    }
	if(isIE){*/
	
		var tooltipPosition = [$("#"+tooltip_Id).offset().left,$("#"+tooltip_Id).offset().top ];
	//	var tooltipPosition = doMove(tooltip_Id);
		getToolTipCont(tooltip_seq,tooltipPosition);
	
}


//�꾩튂媛�몄삤湲�
function doMove(tooltip_Id)
{
    var divLayer = document.getElementById(tooltip_Id);
    var x, y;

   x = event.x;
    y = event.y;
    return [x,y];
}

//�꾩껜寃쎈줈 �뚯씪紐낅쭔 異붿텧
function fileName(str){
	var len = str.length;
	var last = str.lastIndexOf("\\");
	var ext = str.substring(last + 1, len);  //�뚯씪紐� 異붿텧 ( �쒖쇅)
	return ext;
}


//�낅젰�� 湲몄씠 泥댄겕
function fn_chk_byte(aro_name,ari_max,count,max_str) {
	var ls_str     = aro_name.value; // �대깽�멸� �쇱뼱�� 而⑦듃濡ㅼ쓽 value 媛�
	var li_str_len = ls_str.length;  // �꾩껜湲몄씠
	var objName = 'sum_' + aro_name.name+count;
	
	// 蹂�섏큹湲고솕
	var li_max      = ari_max; // �쒗븳�� 湲�먯닔 �ш린
	var i           = 0;  // for臾몄뿉 �ъ슜
	var li_byte     = 0;  // �쒓��쇨꼍�곕뒗 2 洹몃컱�먮뒗 1�� �뷀븿
	var li_len      = 0;  // substring�섍린 �꾪빐�� �ъ슜
	var ls_one_char = ""; // �쒓��먯뵫 寃�ы븳��
	var ls_str2     = ""; // 湲�먯닔瑜� 珥덇낵�섎㈃ �쒗븳�좎닔 湲�먯쟾源뚯�留� 蹂댁뿬以��.
	
	for(i=0; i< li_str_len; i++) {
		// �쒓��먯텛異�
		ls_one_char = ls_str.charAt(i);
		
		// �쒓��대㈃ 3瑜� �뷀븳��.
		if (escape(ls_one_char).length > 4){
		    li_byte += 3;
		}
		// 洹몃컱�� 寃쎌슦�� 1�� �뷀븳��.
		else {
		    li_byte++;
		}
		// �꾩껜 �ш린媛 li_max瑜� �섏��딆쑝硫�
		    if(li_byte <= li_max) {
		        li_len = i + 1;
		}
	}
	// �꾩껜湲몄씠瑜� 珥덇낵�섎㈃
	if(li_byte > li_max) {
	    alert( li_max + " byte瑜� 珥덇낵�섏뿬 �낅젰�� �� �놁뒿�덈떎. \n珥덇낵�� �댁슜� �먮룞�쇰줈 ��젣 �⑸땲��. ");
	    ls_str2 = ls_str.substr(0, li_len);
	    li_byte=li_max;
	    aro_name.value = ls_str2;
	}
	document.getElementById(objName).innerHTML = '( ' +li_byte + ' /'+max_str+')';
}