<%@ page contentType="text/HTML; charset=UTF-8" %>
<%@ page import="org.apache.commons.net.util.Base64" %>
<%@ page import="org.apache.commons.fileupload.*"%>
<%@ page import="org.apache.commons.fileupload.servlet.*"%>
<%@ page import="org.apache.commons.fileupload.disk.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@include file="/NetMiner/common.jsp"%>

<%!
	public String encode(String data) {
		try {
			return new String(new org.apache.commons.net.util.Base64().encode(data.getBytes()));
		} catch (Exception e) {
			return null;
		}
	}
	public String decode(String data) {
		try {
			return new String(new org.apache.commons.net.util.Base64().decode(data.getBytes()));
		} catch (Exception e) {
			return null;
		}
	}
	public String getAnalysisData(String data) {
		String _temp = data.trim();
		return _temp.substring(1, _temp.length()-1);
	}
	public void closeAll(Connection connection, PreparedStatement preparedstatement)
	{
		if(preparedstatement != null) {
		    try { preparedstatement.close(); } catch(SQLException e) { e.printStackTrace(); }
		}
		if(connection != null) { 
			//try { DBConnectionPoolMgr.getInstance().returnConnection ("mssql", connection); } catch (DBPoolException e) { }
			try { connection.close(); } catch(SQLException e) { e.printStackTrace(); }
		}
	}
	public Integer insert(String sql, Object[] values, boolean isReturnGeneratedKeys, String userLogDbURL, String userLogDbUser, String userLogDbPwd) {
		Connection connection = null;
		PreparedStatement preparedstatement = null;
		Integer res = null;
		try
		{
			//DBConnectionPoolMgr dbconnectionpoolmgr = DBConnectionPoolMgr.getInstance();
		    //connection = dbconnectionpoolmgr.getConnection("mssql");
		    connection = DriverManager.getConnection(userLogDbURL, userLogDbUser, userLogDbPwd);
		    
			preparedstatement = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			for (int i = 0; i < values.length; i++) {
				preparedstatement.setObject(i+1, values[i]);
			}
			preparedstatement.executeUpdate();
			if (isReturnGeneratedKeys) {
				ResultSet rs = preparedstatement.getGeneratedKeys();
				rs.next();
				res = rs.getInt(1);
			}
			else {
				res = 1;
			}
		}
		catch (SQLException e)
		{
			e.printStackTrace();
			return null;
		}
		finally
		{
			closeAll(connection, preparedstatement);
		}
		return res;
	}
%>

<%

request.setCharacterEncoding("UTF-8");

String FILENAME = "FILENAME";
String VERSION = "VERSION";
String CPUNUM = "CPUNUM";
String CPU = "CPUINFO";
String MAXMEM = "MAXMEM";
String TOTALAVAILABLEMEM = "TOTALAVAILABLEMEM";
String HDDSERIAL = "HDDSERIAL";
String NUMBEROFANALYSIS = "NUMBEROFANALYSIS";
String NORMALTERMINATION = "NORMALTERMINATION";
String A = "A_";

String FILENAME_DATA = null;
String VERSION_DATA = null;
String CPUNUM_DATA = null;
String CPU_DATA = null;
Long MAXMEM_DATA = null;
Long TOTALAVAILABLEMEM_DATA = null;
String HDDSERIAL_DATA = null;
String NUMBEROFANALYSIS_DATA = null;
Integer NORMALTERMINATION_DATA = null;
LinkedList<Object[]> A_DATAS = new LinkedList<Object[]>();
LinkedList<Object[]> N_DATAS = new LinkedList<Object[]>();

ServletFileUpload upload = new ServletFileUpload(new DiskFileItemFactory());
List<FileItem> uploadItems = upload.parseRequest(request);
for( FileItem uploadItem : uploadItems ) {
	if( uploadItem.isFormField() ) {
		try {
			String fieldName = uploadItem.getFieldName();
			String value = uploadItem.getString();
			
			if (fieldName.equals(FILENAME)) FILENAME_DATA = decode(value);
			else if (fieldName.equals(VERSION)) VERSION_DATA = decode(value);
			else if (fieldName.equals(CPUNUM)) CPUNUM_DATA = decode(value);
			else if (fieldName.equals(CPU)) CPU_DATA = decode(value);
			else if (fieldName.equals(HDDSERIAL)) HDDSERIAL_DATA = decode(value);
			else if (fieldName.equals(NUMBEROFANALYSIS)) NUMBEROFANALYSIS_DATA = decode(value);
			else if (fieldName.equals(MAXMEM)) {
				try {
					MAXMEM_DATA = Long.valueOf(decode(value));
				} catch (Exception e) {}
			}
			else if (fieldName.equals(TOTALAVAILABLEMEM)) {
				try {
					TOTALAVAILABLEMEM_DATA = Long.valueOf(decode(value));
				} catch (Exception e) {}
			}
			else if (fieldName.equals(NORMALTERMINATION)) {
				String temp = decode(value);
				NORMALTERMINATION_DATA = temp == null ? 0  : temp.equals("true") ? 1 : 0;
			}
			else if (fieldName.startsWith(A)) {
				Object[] aDatas = new Object[8];
				
				aDatas[0] = Integer.valueOf(fieldName.substring(2)); // ANALYSIS_INDEX
				
				String analysisData = decode(value);
				String[] analysisItems = analysisData.split(";");
				aDatas[7] = getAnalysisData(analysisItems[0].trim()); // DATE
				aDatas[1] = getAnalysisData(analysisItems[1].trim()); // ANALYSIS_HASH
				
				String[] aNames = getAnalysisData(analysisItems[2].trim()).split(">>");
				aDatas[2] = aNames[0].trim(); // MENU_1
				aDatas[3] = aNames[1].trim(); // MENU_2
				aDatas[4] = aNames[2].trim(); // MENU_3
				
				//analysisItems[3] //pass
				
				aDatas[5] = Integer.valueOf(getAnalysisData(analysisItems[4].trim())); // NODESET_SIZE
				
				String[] networks = getAnalysisData(analysisItems[5].trim()).split(",");
				String[] networkSizes = getAnalysisData(analysisItems[6].trim()).split(",");
				for ( int j = 0 ; j < networks.length ; j++ ) {
					String network = networks[j].trim();
					if ( network.length() == 0 ) continue;
					String networkSize = networkSizes[j].trim();
					if ( networkSize.length() == 0 ) continue;
					Object[] nDatas = new Object[3];
					nDatas[0] = aDatas[0]; // ANALYSIS_INDEX
					nDatas[1] = network; // INPUT_TYPE
					nDatas[2] = networkSize; // INPUT_SIZE
					N_DATAS.add(nDatas);
				}
				
				String time = getAnalysisData(analysisItems[7].trim());
				aDatas[6] = time.substring(0, time.length()-2); // CONSUMED_TIME
				
				A_DATAS.add(aDatas);
			}
		} catch (Exception e) {}
	}
}

boolean isDebug = true;
if (isDebug) {
	out.println("VERSION_DATA : " + VERSION_DATA); out.println(" ; ");
	out.println("CPUNUM_DATA : " + CPUNUM_DATA); out.println(" ; ");
	out.println("CPU_DATA : " + CPU_DATA); out.println(" ; ");
	out.println("MAXMEM_DATA : " + MAXMEM_DATA); out.println(" ; ");
	out.println("TOTALAVAILABLEMEM_DATA : " + TOTALAVAILABLEMEM_DATA); out.println(" ; ");
	out.println("HDDSERIAL_DATA : " + HDDSERIAL_DATA); out.println(" ; ");
	out.println("A_DATAS : "); out.println(" ; ");
	for (Object[] A_DATA : A_DATAS) { out.println(Arrays.toString(A_DATA)); out.println(" ; "); } 
	out.println("N_DATAS : "); out.println(" ; ");
	for (Object[] N_DATA : N_DATAS) { out.println(Arrays.toString(N_DATA)); out.println(" ; "); } 
	out.println("NUMBEROFANALYSIS_DATA : " + NUMBEROFANALYSIS_DATA); out.println(" ; ");
	out.println("NORMALTERMINATION_DATA : " + NORMALTERMINATION_DATA); out.println(" ; ");
	out.println("--------------------------------------------------"); out.println(" ; ");
}

Integer logID = insert("insert into user_collect_log (filename, normaltermination, version) values (?, ?, ?);", 
						new Object[]{FILENAME_DATA, NORMALTERMINATION_DATA, VERSION_DATA}, true, userLogDbURL, userLogDbUser, userLogDbPwd);

if (logID != null) {
	
	insert("insert into user_collect_hardware (log_id, cpu, maxmem, availmem, hddserial) values (?, ?, ?, ?, ?);", 
		new Object[]{logID, CPU_DATA, MAXMEM_DATA, TOTALAVAILABLEMEM_DATA, HDDSERIAL_DATA}, false, userLogDbURL, userLogDbUser, userLogDbPwd);
	
	Integer analysisID = null;
	
	for (int i = 0; i < A_DATAS.size(); i++) {
		Object[] aValues = A_DATAS.get(i);
		Object analysisIndex = aValues[0];
		aValues[0] = logID;
		
		analysisID = insert("insert into user_collect_analysis (log_id, analysis_hash, menu_1, menu_2, menu_3, nodeset_size, consumed_time, date) values (?, ?, ?, ?, ?, ?, ?, ?);", 
								aValues, true, userLogDbURL, userLogDbUser, userLogDbPwd);
		
		if (analysisID != null) {
			for ( Object[] nValues : N_DATAS ) {
				if ( nValues[0].equals(analysisIndex) ) {
					nValues[0] = analysisID;
					insert("insert into user_collect_network (analysis_id, input_type, input_size) values (?, ?, ?);", nValues, true, userLogDbURL, userLogDbUser, userLogDbPwd);
				}
			}
		}
	}

}


%>