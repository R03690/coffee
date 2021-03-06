<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2020-10-09
  Time: 14:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>

    <!-- 1. 导入CSS的全局样式 -->
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <!-- 2. jQuery导入，建议使用1.9以上的版本 -->
    <script src="${pageContext.request.contextPath}/js/jquery-2.1.0.min.js"></script>
    <!-- 3. 导入bootstrap的js文件 -->
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

    <script>
        function update(id) {
            var password = $("#password").val();
            var telephone = $("#telephone").val();
            location.href="/user/modify?password="+password+"&telephone="+telephone+"&id="+id;
        }
        function delete1(id) {
            location.href="/user/delete1?id="+id;
        }
    </script>
</head>
<body>
    <h1>用户信息维护</h1>
    <form action="${pageContext.request.contextPath}/user/userInformation" method="post">
        <input type="submit" value="刷新">
    </form>
    <table>
        <tr>
            <th align="center" >ID</th>
            <th align="center" >用户名称</th>
            <th align="center" >密码</th>
            <th align="center" >联系方式</th>
        </tr>
        <c:forEach items="${list}" var="userInformation">
            <tr>
                <td align="center">${userInformation.id}</td>
                <td align="center">${userInformation.username}</td>
                <td align="center">
                    <input name="password" id="password" value="${userInformation.password}">
                </td>
                <td align="center">
                    <input name="telephone" id="telephone" value="${userInformation.telephone}">
                </td>
                <td>
                    <a href="javascript:update(${userInformation.id})" class="btn btn btn-primary">修改</a>
                </td>
                <td>
<%--                    <form action="delete.do?id=${userInformation.id}" method="post">
                        <input type="submit" value="删除">
                    </form>--%>
                    <a href="javascript:delete1(${userInformation.id})" class="btn btn btn-primary">删除</a>
                </td>
            </tr>
        </c:forEach>
    </table>
    ${msg}
</body>
</html>
