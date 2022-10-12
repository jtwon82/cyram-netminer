				
		var pageUrl = document.location;
		
//		var urlArr = new Array()
//		urlArr.push("http://www.netminer.com/main/main-read.do");
//		urlArr.push("http://www.netminer.com/product/overview.do");
//		urlArr.push("http://www.netminer.com/product/package01.do");
//		urlArr.push("http://www.netminer.com/product/demo.do");
//		urlArr.push("http://www.netminer.com/product/gallery.do");
//		urlArr.push("http://www.netminer.com/download_buy/buy/buy-view.do");
//		urlArr.push("http://www.netminer.com/download_buy/download/download-readList.do");
//		urlArr.push("http://www.netminer.com/download_buy/appstore/appstore-readList.do");
//		urlArr.push("http://www.netminer.com/download_buy/license_price/license_price.do");
//		urlArr.push("http://www.netminer.com/community/faq/faq-readList.do");
//		urlArr.push("http://www.netminer.com/community/qna/qna-readList.do");
//		urlArr.push("http://www.netminer.com/community/event/event-readList.do");
//		urlArr.push("http://www.netminer.com/aboutus/publications.do");
//		urlArr.push("http://www.netminer.com/community/forum/forum-readList.do");
//		urlArr.push("http://www.netminer.com/aboutus/aboutus.do");
//		urlArr.push("http://www.netminer.com/aboutus/publications.do#brochure");
//		urlArr.push("http://www.netminer.com/aboutus/publications.do#whitePaper");
//		urlArr.push("http://www.netminer.com/aboutus/publications.do#casestudy");
//		urlArr.push("http://www.netminer.com/aboutus/publications.do#manual");

		
		(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
		  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
		  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
		  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');
		
		  ga('create', 'UA-23665693-1', 'auto');
		  ga('send', 'pageview', pageUrl);
		
//		for(var i = 0 ; i < urlArr.length; i++){
//			  if(urlArr[i] == pageUrl){
//				  
//				  ga('create', 'UA-23665693-1', 'auto');
//				  ga('send', 'pageview', pageUrl);
//			  }
//		  }


		function top_Home() {
			top.location.href = "/";
		}
		
		function top_fn_moveSign() {
			top.location.href = "/nmuser-read.do";
		}
		
		function top_setKorByAjax(kor) {
			$("#lang").val(kor);
		
			doAjax("topModel", "/common/layout/top-update.do", "", "fn_reload()");
		}
		
		function top_logout() {
			doAjax("topModel", "/login/login-delete.do", "You have been signed out.", "top_Home()");
		}

		
		
		function bottom_Support() {
			var topModel = document.getElementById("topModel");
	
			topModel.action = "/support.do";
			topModel.submit();
		}
		
		
		 