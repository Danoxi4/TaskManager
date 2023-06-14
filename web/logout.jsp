 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
// Get the current session
HttpSession sessionObj = request.getSession(false);

// Check if a session exists
if (sessionObj != null) {
    // Invalidate the session to destroy it
    sessionObj.invalidate();
}

// Redirect to the login page
response.sendRedirect("index.html");
%>
