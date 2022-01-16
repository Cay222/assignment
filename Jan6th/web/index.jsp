<%--
  Created by IntelliJ IDEA.
  User: 18751
  Date: 2022-01-10
  Time: 14:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>用户信息</title>
    <style type="text/css">
        table {
            margin-left: 500px;
            margin-top: 50px;
        }
        .page {
            margin-left: 500px;
            margin-top: 50px;
        }
    </style>
</head>
<body>
<table border="1" >
    <tr>
        <td>编号</td>
        <td>姓名</td>
        <td>密码</td>
        <td>邮箱</td>
        <td>头像</td>
        <td>操作</td>
    </tr>

    <c:forEach items="${requestScope.list}" var="temp">
        <tr>
            <td>${temp.id}</td>
            <td>${temp.name}</td>
            <td>${temp.password}</td>
            <td>${temp.email}</td>
            <td>
                <img alt="头像" src="${temp.avatar}" width="200px" height="100px">
            </td>
            <td>
                <a href="user?method=deleteById&userId=${temp.id}">删除</a>
                <a href="user?method=queryById&userId=${temp.id}">修改</a>
            </td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
