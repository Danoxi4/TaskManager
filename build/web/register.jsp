<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="db.DbConnection" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="Register.RegisterBean" %>
<jsp:useBean id="registerdb" class="Register.RegisterBean" scope="session"></jsp:useBean>
<jsp:setProperty name="registerdb" property="*" />
<jsp:useBean id="dbConnection" class="db.DbConnection" scope="application"></jsp:useBean>
<%@ page import="db.LoginBean" %>

<%
Connection cn = dbConnection.initializeJdbc();
PreparedStatement st = cn.prepareStatement("INSERT INTO users (first_name, last_name, username, password) VALUES (?, ?, ?, ?)");
st.setString(1, registerdb.getFirstName());
st.setString(2, registerdb.getLastName());
st.setString(3, registerdb.getUserName());
st.setString(4, registerdb.getPassword());
st.executeUpdate();

// Retrieve the login bean from the session or create a new one
LoginBean sessionLoginBean = (LoginBean) session.getAttribute("logindb");
if (sessionLoginBean == null) {
    sessionLoginBean = new LoginBean();
    session.setAttribute("logindb", sessionLoginBean);
}

// Set the login bean properties with the registered user's information
sessionLoginBean.setUsername(registerdb.getUserName());
sessionLoginBean.setPassword(registerdb.getPassword());

// Redirect to the desired page after successful registration
response.sendRedirect("todo-form.html");
%>
