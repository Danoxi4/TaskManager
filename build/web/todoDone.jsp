<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.*" %>
<%@ page import="db.DbConnection" %>
<%@ page import="db.LoginBean" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.ResultSet" %>
<jsp:useBean id="dbConnection" class="db.DbConnection" scope="application"></jsp:useBean>

<%
    // Retrieve the login bean from the session
    if (request.getMethod().equals("POST")) {
			int id = Integer.parseInt(request.getParameter("id"));

			Connection cn = dbConnection.initializeJdbc();
                        
                        Statement stmt = cn.createStatement();
                        stmt.executeUpdate("UPDATE todos SET is_done = 1 WHERE id = " + id);

			// Redirect to the desired page after successful insertion
                        %><jsp:forward page="todo-list.jsp"/><%
		}
%>
