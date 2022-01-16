<%--
  Created by IntelliJ IDEA.
  User: 18751
  Date: 2022-01-13
  Time: 13:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">

    <title>🔷注册</title>

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">

</head>

<style type="text/css">
    html, body {
        margin: 0;
        padding: 0;
        width: 100%;
        height: 100%;
        background-image: linear-gradient(to bottom, #243949 0%, #517fa4 100%);
        overflow: hidden;
    }

    canvas {
        position: absolute;
        top: 0;
    }

    .div_ads {
        z-index: 3;
        width: 30%;
        margin: 0 auto;
        margin-top: 50px;
        border: 1px solid #ccc;
        background: rgba(238, 235, 235, 1);
        position: relative;
        border-radius: 6px;
        height: 650px;
    }

    table {
        position: absolute;
        left: 10%;
    }

    table tr td {
        text-align: center;
        height: 44px;
        width: 8%;
        text-align: center;
    }

    h3 {
        text-align: center;
        padding-top: 20px;
    }

    hr {
        margin-left: 15px;
        margin-right: 15px;
        background: #ccc;
    }

    .btn1 {
        background: #afc5d6;
    }

    font {
        font-size: .7rem;
        float: left;
    }
</style>


<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/4.0.0/css/bootstrap.min.css"
      integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="js/jquery-3.3.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/particle-bg.umd.min.js"></script>
<script type="text/javascript">
    window.onload = function () {
        particleBg('body', {
            color: 'rgba(255, 255, 255, 0.5)'
        });
    }
</script>
<script type="text/javascript">

    function AjaxChecked() {
        var xmlHttpRequest = null;
        if (XMLHttpRequest) {
            // 除IE5、IE6以外的浏览器以window的子对象XMLHttpRequest实例化一个XMLHttpRequest子对象
            xmlHttpRequest = new XMLHttpRequest();
        } else {
            // IE5、IE6以ActiveXObject的方式引入XMLHttpRequest对象
            xmlHttpRequest = new ActiveXObject("Microsoft.XMLHTTP");
        }
        if (xmlHttpRequest != null) {
            //拿到账号（学号）
            // Document的方法getElementById()返回一个匹配特定ID的元素
            // getElementById()只有在作为document的方法时才能起作用
            var stuNum = document.getElementById("stuNum");
            if (stuNum.value == "") {
                // innerHTML属性设置或返回表格行的开始和结束标签之间的HTML
                document.getElementById("stuNumcheck").innerHTML = "学号不能为空";
            } else {
                var url = "ServletRegisterStu?stuNum=" + stuNum.value;
                // 实例化成功后，使用open()方法初始化XMLHttpRequest对象，指定HTTP方法和要使用的服务器URL
                xmlHttpRequest.open("get", url, true);

                xmlHttpRequest.send();
                xmlHttpRequest.onreadystatechange = function () {
                    // 当请求状态readyState变为XMLHttpRequest.DONE (4)，且status值为200（"OK"）时，
                    // responseText是全部后端的返回数据
                    /**
                     * status 200 代表一个成功的请求。
                     * 如果服务器响应中没有明确指定status码，XMLHttpRequest.status将会默认为200。
                     * XMLHttpRequest.readyState属性返回一个XMLHttpRequest代理当前所处的状态。
                     * 值为4，状态为DONE，请求操作已经完成。这意味着数据传输已经彻底完成或失败
                     */
                    if (xmlHttpRequest.readyState == 4 && xmlHttpRequest.status == 200) {
                        var text = xmlHttpRequest.responseText;
                        //alert(text);
                        document.getElementById("stuNumcheck").innerHTML = text;
                    }
                };
            }
        }
    }

    function namecheck() {
        var stuName = document.getElementById("stuName").value;
        var rename = /^[\u4e00-\u9fa5]+$/gi;          //中文判断
        if (stuName == "") {
            document.getElementById("stuNamecheck").innerHTML = "用户名不能为空";
        } else if (!rename.test(stuName)) {
            document.getElementById("stuNamecheck").innerHTML = "请输入中文名，如：王文军";
        } else {
            document.getElementById("stuNamecheck").innerHTML = "正确";
        }
    }

    function pwdcheck() {
        var pwd1 = document.getElementById("password").value;
        if (pwd1 == "") {
            document.getElementById("stuPwdcheck").innerHTML = "密码不能为空";
        } else if (pwd1.length < 6) {
            document.getElementById("stuPwdcheck").innerHTML = "密码不能小于六位";
        } else {
            document.getElementById("stuPwdcheck").innerHTML = "正确";
        }
    }

    function pwdc() {

        var pwd1 = document.getElementById("password").value;
        var pwd2 = document.getElementById("pwd").value;

        if (pwd1 != pwd2) {

            document.getElementById("stuPwdrcheck").innerHTML = "两次密码不一致";
        } else {
            document.getElementById("stuPwdrcheck").innerHTML = "正确";
        }
    }
</script>
</head>

<body>
<form action="ServletRegistersStudent" method="post">

    <div class="div_ads">
        <font color="red">${msg}</font>
        <font color="red">${msg1}</font>
        <font color="red">${msg2}</font>
        <h3>注册页面</h3>
        <hr class="color:black">

        <table>
            <tr>
                <td colspan="2"><input type="text" name="stuNum" class="put form-control" id="stuNum"
                                       onblur="AjaxChecked();" placeholder="学号" aria-describedby="basic-addon1" required/></td>
                <td><font id="stuNumcheck"></font></td>
            </tr>
            <tr>

                <td colspan="2"><input type="text" name="stuName" class="put form-control" id="stuName"
                                       onblur="namecheck();" placeholder="姓名" aria-describedby="basic-addon1" required/></td>
                <td><font id="stuNamecheck"></font></td>
            </tr>
            <tr>

                <td colspan="2"><input type="password" name="password" class="put form-control" id="password"
                                       onblur="pwdcheck();" placeholder="密码" aria-describedby="basic-addon1" required/></td>
                <td><font id="stuPwdcheck"></font></td>
            </tr>
            <tr>

                <td colspan="2"><input type="password" name="pwd" class="put form-control" id="pwd" onblur="pwdc();"
                                       placeholder="确认密码" aria-describedby="basic-addon1" required/></td>
                <td><font id="stuPwdrcheck"></font></td>
            </tr>
            <tr>

                <td colspan="2"><input type="radio" name="stuSex" value="男" checked="checked"/>男&nbsp;&nbsp;
                    <input type="radio" name="stuSex" value="女"/>女
                </td>
            </tr>
            <tr>

                <td colspan="2"><input type="number" name="stuAge" class="put form-control" placeholder="年龄"
                                       min="15" max="25" aria-describedby="basic-addon1" required pattern="\15-25\"/></td>
            </tr>
            <tr>

                <td colspan="2"><input type="text" name="stuClass" class="put form-control" placeholder="班级"
                                       aria-describedby="basic-addon1" required/></td>
            </tr>
            <tr>

                <td colspan="2"><input type="text" name="major" class="put form-control" placeholder="专业"
                                       aria-describedby="basic-addon1" required/></td>
            </tr>
            <tr>

                <td colspan="2"><input type="text" name="department" class="put form-control" placeholder="院系"
                                       aria-describedby="basic-addon1" required/></td>
            </tr>
            <tr>

                <td colspan="2"><input type="text" name="phone" class="put form-control" placeholder="电话"
                                       aria-describedby="basic-addon1" required/></td>
            </tr>
            <tr>
                <td colspan="2"><input type="hidden" name="role" value="0"/></td>
            </tr>
            <tr>
                <td><input type="submit" value="注册" class="putb btn btn1"/></td>
                <td><input type="reset" value="清空" class="putb btn btn1"/></td>
            </tr>
        </table>
    </div>
</form>
</body>
</html>
