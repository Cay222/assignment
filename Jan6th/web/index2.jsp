<%--
  Created by IntelliJ IDEA.
  User: 18751
  Date: 2022-01-11
  Time: 14:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>用户信息</title>
    <script type="text/javascript" src="js/jquery-3.6.0.min.js"></script>
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
    <script type="text/javascript">
        /* 页面加载完成时触发 */
        $(function (){
            $.ajax({
                type:"post",
                url:"user2",
                data:{
                    "state":0
                    /*"id":1,
                    "name":$("#name").val()*/
                },
                dataTypes:"json",
                /* 响应的数据 */
                // 发送 Ajax 请求获得 data，是用户信息的集合
                success:function (data){
                    // 数据拼接
                    var str="<tr><td>编号</td><td>姓名</td><td>密码</td><td>邮箱</td><td>头像</td><td>操作</td></tr>";
                    // 遍历集合，n 表示遍历的每一个对象，i 相当于数据下标，n 数组元素
                    $.each(data, function (i, n){
                        // 遍历也是拼接的过程
                        str+="<tr><td>"+n.id+"</td><td>"+n.name+"</td><td>"+n.password+
                            "</td><td>"+n.email+"</td><td><img alt='头像' src="+n.avatar+
                            "width='200px' height='100px'></td><td>";
                        str+="<a href='user?method=deleteById&userId="+n.id+"'>删除</a>" +
                            "<a href='user?method=queryById&userId="+n.id+"'>修改</a></td></tr>"
                    });
                    // html()获取值，html(xx) 赋值
                    // 把拼接好的 str 放到 table 里
                    $("#tb").html(str)
                }
            })
        })
    </script>
</head>
<body>
<table border="1" id="tb">

</table>
</body>
</html>
