<%@ page import="com.example.Beans.Post" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.Beans.Comment" %>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Detail Movie</title>
    <jsp:useBean id="post" class="com.example.Beans.Post" scope="session"/>
    <% List<?> comments = (List<?>) request.getSession().getAttribute("comments");%>
    <jsp:useBean id="comment" class="com.example.Beans.Comment" scope="session"/>

</head>

<h2><a href="Login.jsp">Login</a></h2>
<div align="center">
    <h2>Add New Product</h2>
</div>
<div>
    <form action="PostDetailServlet" method="post">
        <table align="center">
            <tr>
                <td>Post Theme :</td>
                <td><jsp:getProperty name="post" property="theme"/></td>
            </tr>
            <tr>
                <td>Post Body :</td>
                <td><jsp:getProperty name="post" property="body"/></td>
            </tr>
            <tr>
                <td>Likes :</td>
                <td><jsp:getProperty name="post" property="likes"/></td>
            </tr>
            <tr>
                <td>Dislikes :</td>
                <td><jsp:getProperty name="post" property="dislikes"/></td>
            </tr>

        </table>
        <br>
        <table align="center">
            <tr>
                <th width="150">User</th>
                <th width="100">Comments</th>
            </tr>
            <%
                for (Object obj : comments) {
                    comment = (Comment) obj;
                    if (comment.getPost_id() == post.getId()){
            %>
            <tr>
                <td align="center"><%=comment.getUser_name()%></td>
                <td align="center"><%=comment.getComment()%></td>
            </tr>
            <%
                    }
                }
            %>
        </table>
    </form>
</div>
