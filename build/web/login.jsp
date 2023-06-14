<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="db.DbConnection" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="db.LoginBean" %>
<jsp:useBean id="logindb" class="db.LoginBean" scope="session" />
<jsp:setProperty name="logindb" property="*" />
<jsp:useBean id="dbConnection" class="db.DbConnection" scope="application"></jsp:useBean>

<%
// Check if a session already exists, otherwise create a new one
HttpSession sessionObj = request.getSession(true);

// Retrieve the login bean from the session or create a new one if it doesn't exist
LoginBean sessionLoginBean = (LoginBean) sessionObj.getAttribute("logindb");
if (sessionLoginBean == null) {
    sessionLoginBean = new LoginBean();
    sessionObj.setAttribute("logindb", sessionLoginBean);
}

Connection cn = dbConnection.initializeJdbc();
PreparedStatement st = cn.prepareStatement("SELECT * FROM users WHERE username = ? AND password = ?");
st.setString(1, sessionLoginBean.getUsername());
st.setString(2, sessionLoginBean.getPassword());
ResultSet rs = st.executeQuery();
boolean authenticated = rs.next();
if (authenticated) {
    // Store the authenticated user information in the session
    sessionObj.setAttribute("username", sessionLoginBean.getUsername());
    sessionObj.setAttribute("isLoggedIn", true);

    // Redirect to the desired page after successful login
    response.sendRedirect("todo-form.html");
} else {
    // Clear any existing session data
    sessionObj.invalidate();

    // Redirect back to the login page
    response.sendRedirect("index.html?loginFailed=true");
}
%>
