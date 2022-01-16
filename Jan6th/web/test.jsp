<%--
  Created by IntelliJ IDEA.
  User: 18751
  Date: 2022-01-10
  Time: 17:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script type="text/javascript" src="js/jquery-3.6.0.min.js"></script>

<html>
<head>
    <title>Title</title>
    <script type="text/javascript">
        /* 绑定事件的几种方式 */
    <%-- 页面加载完成后 --%>
<%--    window.onload = function () {
        var btn = document.getElementById("btn");
        btn.onclick = function () {
            alert("测试");
        }
    }--%>
/*    $(function (){
        $("#btn").click(function (){
            alert("test..")
        })
    })*/
    function test() {
        alert("test...");
    }
    </script>

</head>
<body>
<button id="btn" onclick="test()">测试</button>
<%--    <script type="text/javascript">
        var btn = document.getElementById("btn");
        btn.onclick = function () {
            alert("测试");
        }
    </script>--%>
</body>
</html>
