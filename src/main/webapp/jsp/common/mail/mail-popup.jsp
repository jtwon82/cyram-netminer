<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title></title>

<link rel="stylesheet" type="text/css" href="/css/admin.css" />

<script type="text/javascript" src="/js/netminer.js"></script>
<script type="text/javascript" src="/js/jquery-1.7.min.js"></script>
<script type="text/javascript" src="/js/jquery.form.js"></script>
<script type="text/javascript" src="/js/tinymce/tinymce.min.js"></script>

<script type="text/javaScript">
	<c:if test="${mailModel.kor eq 'true'}">
	tinymce
			.init({
				selector : "textarea",
				menubar : false,
				toolbar : "insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image | print preview media fullpage | forecolor backcolor emoticons",
				style_formats : [ {
					title : 'Bold text',
					inline : 'b'
				}, {
					title : 'Red text',
					inline : 'span',
					styles : {
						color : '#ff0000'
					}
				}, {
					title : 'Red header',
					block : 'h1',
					styles : {
						color : '#ff0000'
					}
				}, {
					title : 'Example 1',
					inline : 'span',
					classes : 'example1'
				}, {
					title : 'Example 2',
					inline : 'span',
					classes : 'example2'
				}, {
					title : 'Table styles'
				}, {
					title : 'Table row 1',
					selector : 'tr',
					classes : 'tablerow1'
				} ],
				plugins : [ "link", "image", "preview" ],
				link_list : [ {
					title : 'My page 1',
					value : 'http://www.tinymce.com'
				}, {
					title : 'My page 2',
					value : 'http://www.moxiecode.com'
				} ],
				image_list : [ {
					title : 'My image 1',
					value : 'http://www.tinymce.com/my1.gif'
				}, {
					title : 'My image 2',
					value : 'http://www.moxiecode.com/my2.gif'
				} ]
			});
	</c:if>

	function checkMail() {
		if ($("#uiMail").val() == '') {
			alert('보낼 메일 주소가 없습니다.');
			$("#uiMail").focus();
			return false;
		}

		<c:if test="${mailModel.kor eq 'true'}">
		var contents = tinyMCE.activeEditor.getDoc().body.innerHTML;

		$("#message").val(contents);
		</c:if>

		if ($("#message").val() == '') {
			alert("메일 내용을 입력해주세요.");
			$("#message").focus();
			return false;
		}

		return true;
	}

	function create() {
		if (checkMail()) {
			doAjax("mailModel", "/common/mail/mail-create.do", "메일이 발송되었습니다.",
					"fn_close()");
		}
	}

	function fn_close() {
		this.close();
	}
</script>

</head>

<body>

	<div class="popup_01">

		<!--타이틀-->
		<div class="btitle">메일 발송</div>
		<!--//타이틀-->

		<form:form commandName="mailModel">
			<form:hidden path="html" />
			<form:hidden path="filename" />
			<form:hidden path="fromEmail" />

			<div class="popuplist">

				<ul>

					<li>
						<table width="710" border="0" cellspacing="0" cellpadding="0"
							class="buss_tb2">

							<tr>
								<td style="width:80px;height:28px;" class="mdt15 mdb10">To email</td>
								<td class="mdt15 mdb10"><form:input path="uiMail"
										class="input_w200" /></td>
							</tr>

							<tr>
								<td style="width:80px;height:28px;" class="mdt15 mdb10">Subject</td>
								<td class="mdt15 mdb10"><form:input path="subject"
										class="input_w600" /></td>
							</tr>

							<tr>
								<td style="width:80px;" class="mdt15 mdb10">Message</td>
								<td class="mdt15 mdb10"><form:textarea path="message"
										class="txt_popup" /></td>
							</tr>
							<tr>
								<td class="viewline"><strong> file <c:out
											value="${attachFileButton}" escapeXml="false" />
								</strong></td>
								<td class="viewline"><c:out value="${attachFileScript}"
										escapeXml="false" /></td>
							</tr>
						</table>
					</li>

					<li style="float: right" class="txtalign">
						<div class="btn_search">
							<a href="javascript:fn_close();">닫기</a>
						</div>
						<div class="btn_search">
							<a href="javascript:create();">메일 발송</a>
						</div>
					</li>

				</ul>
			</div>

		</form:form>

	</div>

</body>
</html>
