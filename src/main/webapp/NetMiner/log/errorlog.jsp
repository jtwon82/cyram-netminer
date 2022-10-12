<%@ page contentType="text/HTML; charset=UTF-8" %>
<%@ page import="org.apache.commons.fileupload.*"%>
<%@ page import="org.apache.commons.fileupload.servlet.*"%>
<%@ page import="org.apache.commons.fileupload.disk.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>

<%

request.setCharacterEncoding("UTF-8");

String FILENAME = null;
String ERRORTEXT = null;

ServletFileUpload upload = new ServletFileUpload(new DiskFileItemFactory());
List<FileItem> uploadItems = upload.parseRequest(request);
for( FileItem uploadItem : uploadItems ) {
	if( uploadItem.isFormField() ) {
		try {
			String fieldName = uploadItem.getFieldName();
			String value = uploadItem.getString();
			
			if (fieldName.equals("FILENAME")) FILENAME = value;
			else if (fieldName.equals("ERRORTEXT")) ERRORTEXT = value;
			
		} catch (Exception e) {}
	}
}

BufferedWriter bw = new BufferedWriter(new FileWriter(new File("D:/NetMinerErrorLog", FILENAME)));
bw.write(ERRORTEXT);
bw.close();

%>