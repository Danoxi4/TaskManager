<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="db.DbConnection" %>
<%@ page import="db.LoginBean" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<jsp:useBean id="dbConnection" class="db.DbConnection" scope="application"></jsp:useBean>
<!DOCTYPE html>
<html>
    <head>
        <title>User Management Application</title>
        <style>
            .footer {
                position: fixed;
                bottom: 0;
                width:100%;
                height: 40px;
                background-color: tomato;
            }
        </style>
        <link rel="stylesheet"
              href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
              integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
              crossorigin="anonymous">
    </head>
    <body>
        <header>
            <nav class="navbar navbar-expand-md navbar-dark"
                 style="background-color: tomato">
                <div>
                    <a href="" class="navbar-brand">Todo App</a>
                </div>

                <ul class="navbar-nav">
                    <li><a href="todo-list.jsp" class="nav-link">Todos</a></li>
                </ul>

                <ul class="navbar-nav navbar-collapse justify-content-end">
                    <li><a href="logout.jsp" class="nav-link">Logout</a></li>
                </ul>
            </nav>
        </header>

        <div class="row">
            <div class="container">
                <h3 class="text-center">List of Todos</h3>
                <hr>
                <div class="container text-left">
                    <a href="todo-form.html" class="btn btn-success">Add Todo</a>
                </div>
                <br>
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>Title</th>
                            <th>Target Date</th>
                            <th>Todo Status</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                    <%		LoginBean loginBean = (LoginBean) session.getAttribute("logindb"); %>
                    <% ResultSet resultSet = dbConnection.getTodosByUsername(loginBean.getUsername()); %>
                        <% while(resultSet.next()) { %>
                            <tr>
                                <td><%= resultSet.getString(6) %></td>
                                <td><%= resultSet.getString(2) %></td>
                                <td><%= resultSet.getBoolean(3) %></td>
                                <td><%= resultSet.getString(4) %></td>  
                                <td> <form action="todoDone.jsp" method="post"><input type="hidden" name="id" value=<%= resultSet.getInt(1) %> ><input type="submit" value="Done"></form></a>
							</td>
                            </tr>
                            <% } %>
                    </tbody>
                </table>
            </div>
        </div>

        <footer class="footer font-small black">
            <div class="footer-copyright text-center py-3" style="color: white">
                © 2023
                <a href="">
                    <strong>CodeWizards</strong>
                </a>
            </div>
        </footer>
    </body>
</html>