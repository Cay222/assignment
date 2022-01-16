<%--
  Created by IntelliJ IDEA.
  User: 18751
  Date: 2022-01-13
  Time: 9:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%-- 保证可以使用绝对路径 --%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <%-- 表明当前页面的相对路径所使用的根路径 --%>
    <base href="<%=basePath%>">

    <title>My JSP 'userAllInfo.jsp' starting page</title>

    <!-- 网页不保存在缓存中，每次访问都刷新页面。这样设定，访问者将无法脱机浏览。 -->
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <!-- 设定网页的到期时间，一旦网页过期，必须到服务器上重新传输，0表示永不过期 -->
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <!--
        <link rel="stylesheet" type="text/css" href="styles.css">
        -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <style type="text/css">
        .div_list {
            width: 75%;
            margin: 0 auto;
            margin-top: 50px;
            margin-left: 20%;

        }

        #tableClass {
            margin: 0 auto;
            width: 100%

        }

        .form1 {
            width: 200px;
            display: inline-block
        }

        font {
            color: red;
            font-weight: bold;
            text-align: center;
        }

        table {
            margin: 0 auto;
        }

        table tr td {
            text-align: center;
            width: 150px;
            height: 40px;
        }

        a {
            text-decoration: none;
        }
    </style>

</head>

<body>
<form action="PageServlet" method="post">
    <div class="div_list panel panel-default">
        <div class="panel-heading">用户信息</div>
        <table class="table panel-body" id="tableClass">
            <tr>
                <td>学号</td>
                <td>姓名</td>
                <td>密码</td>
                <td>联系电话</td>
                <td>身份</td>
                <td>操作</td>
            </tr>
            <c:forEach var="list" items="${list.getPbjs() }">
                <tr>
                    <td>${list.getUserNum() }</td>
                    <td>${list.getUserName() }</td>
                    <td>${list.getPassword() }</td>
                    <td>${list.getPhone() }</td>
                    <td>${list.getRoleName() }</td>
                    <td>&nbsp;<a
                            href="ServletSelectUser?userID=${list.getUserID() }">修改</a>&nbsp;
                    </td>
                </tr>
            </c:forEach>
            <tr>

                <td colspan="6">

                    <a href="PageServlet?pageNo=1&totalPage=${list.totalPage}">首页</a>
                    <a href="PageServlet?pageNo=${list.pageNo-1}&totalPage=${list.totalPage}">上一页</a>
                    <a href="PageServlet?pageNo=${list.pageNo+1}&totalPage=${list.totalPage}">下一页</a>
                    <a href="PageServlet?pageNo=${list.totalPage}&totalPage=${list.totalPage}"> 最后一页 </a>
                    <br/>
                    跳转到： <input id="pageNo" type="text" class="form-control form1"
                                name="pageNo" value="${list.pageNo}"/> 每页记录数： <input class="form-control form1"
                                                                                     type="text" name="pageCount"
                                                                                     value="${list.pageCount}"/> <input
                        class="btn btn-primary"
                        type="submit" value="跳转"/> 共有 ${list.totalPage} 页
                </td>

            </tr>
        </table>

    </div>
</form>
</body>
</html>
