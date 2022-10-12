<%@ page contentType="text/html; charset=utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title></title>
<style type="text/css">
p {
	text-align: center !important
}
</style>
<script>
	function _download(bf_file) {
		var bf_source = bf_file.split('/')[1];
		$('#downloadFileHTML')
				.html(
						"<iframe name='filedownload' style = 'width:0px;height0px;display:none'></iframe>");
		var formData = "<form name='attachFileModel' method = 'post' target = 'filedownload' action = '/common/attachfile/attachFile_download_storage-read.do?bf_file="
				+ bf_file + "&bf_source=" + bf_source + "'></form>";
		$(formData).appendTo('body').submit().remove();
	}
</script>
</head>

<body>
	<!--하단컨텐츠-->
	<div id="container02">
		<div class="submain">
			<div>
				<img src="/images/sub/contitle_ext.png" alt="extension" />
			</div>

			<div class="wrapdownbox10">
				<div class="downboxsub25">
					<dl>
						<dt>
							<ul>
								<li>NetMiner Extension is small program to extend the
									functionality of NetMiner. In other words, it enables you to
									customize NetMiner according to your needs. By adding ‘NetMiner
									Extension’, you can expand your research.</li>
							</ul>
						</dt>
						<dt>
							<img src="/images/overview/ext_overview.png" width="830px"></img>
						</dt>
					</dl>
				</div>
				<div class="downboxsub13">
					<h1>[Brochure] NetMiner Extension</h1>
					<div class="btn_mnoti"
						onclick="_download('brochure/intro_extension.pdf');"
						style="cursor: pointer">Down</div>
				</div>


				<div class="downboxsub26">
					<h1>Extensions</h1>
					<div style="float: right; font-size: 12px;">※ All or part of the service could be suspended or terminated by data provider company.</div>
					<h2>SNS Data Collector</h2>
					<dl>
						<dt>
							<ul>
								<li>NetMiner SNS Data Collector collects data from
									Facebook, YouTube, Twitter or Instagram which have large number
									of SNS users worldwide. You can see public opinion on specific
									issues or organizations. Also it can identify opinion leaders.</li>
							</ul>
						</dt>
						<dt style="margin-left: 15%;">
							<iframe width="560" height="315"
								src="https://www.youtube.com/embed/1hBH5-j0GdM?rel=0"
								frameborder="0" allow="autoplay; encrypted-media"
								allowfullscreen></iframe>
						</dt>
						<dt>
							<li>Collect Social Media Data</li>
							<div>It collects data from Facebook, Twitter, YouTube and
								Instagram. It allows you to identify public opinion on specific
								issues and analyze the message of a brands. Also you can figure
								out what people are saying about a particular area or
								attractions in Instagram. Within a few clicks, you can collect
								social media data whenever you need.</div>
							<li>Text Mining for Social Media</li>
							<div>It can extract words from the text(e.g. tweets, titles
								of videos, posts, comments) and get a word network and visualize
								it. Also, TF-IDF and Frequency can be used for filtering data
								and ‘Word Cloud(Tag Cloud). In addition, you can identify topics
								using ‘Topic modeling’.</div>
							<div>
								<a href="package11.do">Learn More >></a>
							</div>
							<li>Extract Various Networks from Social Media</li>
							<div>Social media contains various network can be
								visualized and analyzed. For instance, it creates user-to-user
								retweet network if a user retweet another user’s tweet. Besides,
								it provides various networks such as user-to-post network,
								user-to-word network.</div>
						</dt>
					</dl>
				</div>
				<div class="downboxsub26">
					<h2>Biblio Data Collector</h2>
					<dl>
						<dt>
							<ul>
								<li>NetMiner Biblio Data Collector can collect
									bibliographic information directly from online or import the
									paper bibliographic information files that have been already
									collected and saved from other sites such as Web of Science,
									SCOPUS.</li>
							</ul>
						</dt>
						<dt style="margin-left: 15%;">
							<iframe width="560" height="315"
								src="https://www.youtube.com/embed/U7V8cfgZDj8?rel=0"
								frameborder="0" allow="autoplay; encrypted-media"
								allowfullscreen></iframe>
						</dt>
						<dt>
							<li>Collect Bibliographic Data from Online</li>
							<div>With search keywords, you can collect bibliographic
								information directly from online(2019.02. Springer, KCI are
								supported). Or it can import the bibliographic information
								files(*.ris) that have been saved from several bibliographic
								database.</div>
							<li>Offer Preprocessing Options for Author and Text</li>
							<div>
								In research trend analysis, the preprocessing is complicated and
								time consuming jobs. It can extract keyword from text(title,
								abstract)(<a style="float: inherit;" href="package11.do">More
									>></a>) and reduce the extra process. For example, author keywords
								can be registered as proper noun. And it helps distinguish
								authors with same name based on the related bibliographic
								information.
							</div>
							<li>Extract Various Networks from Bibliographic information</li>
							<div>It can easily extract a variety of network(e.g.
								co-word network, co-authorship network between authors,
								affiliations and keyword co-occurrence network) from
								bibliographic data.</div>
						</dt>
					</dl>
				</div>
			</div>
		</div>
	</div>

	<!-- 하단컨텐츠 -->

</body>
</html>
