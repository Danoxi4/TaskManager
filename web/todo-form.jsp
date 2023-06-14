<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="db.DbConnection" %>
<%@ page import="db.LoginBean" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<jsp:useBean id="dbConnection" class="db.DbConnection" scope="application"></jsp:useBean>
<%
		// Process the form data and insert into the database
		if (request.getMethod().equals("POST")) {
			String title = request.getParameter("title");
			String description = request.getParameter("description");
			boolean isDone = Boolean.parseBoolean(request.getParameter("isDone"));
			String targetDate = request.getParameter("targetDate");

			LoginBean loginBean = (LoginBean) session.getAttribute("logindb");
			String username = loginBean.getUsername();
			Connection cn = dbConnection.initializeJdbc();
			PreparedStatement st = cn.prepareStatement("INSERT INTO todos (username, title, description, is_done, target_date) VALUES (?, ?, ?, ?, ?)");
			st.setString(1, username);
			st.setString(2, title);
			st.setString(3, description);
			st.setBoolean(4, isDone);
			st.setString(5, targetDate);
			st.executeUpdate();

			// Redirect to the desired page after successful insertion
                        %><jsp:forward page="todo-list.jsp"/><%
		}
	%>
        
        