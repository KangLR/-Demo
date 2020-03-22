<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<%--
  Created by IntelliJ IDEA.
  User: klr106
  Date: 2020/3/21
  Time: 18:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>书籍展示</title>
    <script src="https://cdn.bootcss.com/jquery/3.4.1/jquery.min.js"></script>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<%--    ajax异步处理搜索--%>
    <script>
        function search() {
            var a=$(" input[ name='queryBookName' ] ").val()
            console.log(a);
            $.post({
                url:"${pageContext.request.contextPath}/book/keyword",
                data:{"bookName":$(" input[ name='queryBookName' ] ").val()},
                success:function (data,status) {
                    var html="";
                    console.log(data)
                    for(var i=0;i<data.length;i++){
                        html+="<option>"+data[i].bookName+"</option>"
                    }
                    console.log(html)
                    $("#nameList").html(html);
                }
            })

        }
    </script>


</head>
<body>

<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="page-header">
                <h1>
                    <small>书籍列表</small>
                </h1>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12 column" style="margin-left: 17px;">
<%--                toAddBook--%>
                <a class="btn btn-primary" href="${pageContext.request.contextPath}/book/toAddBookPage">新增书籍</a>
            </div>
            <div class="col-md-12 column"></div>

            <div class="col-md-11 column" style="margin-left:85px;">
                <%--                查询书籍--%>
                <form action="${pageContext.request.contextPath}/book/queryBook" method="post"  style="float:right;">
                    <input type="text" id="BookName" name="queryBookName" list="nameList" oninput="search()" placeholder="请输入要查询的书籍名称" class="form-inline">
                    <input type="submit" value="查询"   class="btn btn-primary">
                    <datalist id="nameList" ></datalist>
                </form>
            </div>
        </div>
    </div>
    <div class="row clearfix">
        <div class="col-md-12 column">
            <table class="table table-hover table-striped">
                <thead>
                    <tr>
                        <th>书籍编号</th>
                        <th>书籍名称</th>
                        <th>书籍数量</th>
                        <th>书籍详情</th>
                        <th>操作</th>
                    </tr>
                </thead>
<%--                书籍从数据库中查询出来，从这个list中遍历出来：foreach--%>
                <tbody>
                    <c:forEach var="book" items="${list}">
                            <tr>
                                <td>${book.bookID}</td>
                                <td>${book.bookName}</td>
                                <td>${book.bookCounts}</td>
                                <td>${book.detail}</td>
                                <td>
<%--                                    跳转的同时把bookID一起传过去，在去那边利用bookID往表单中填充,我们在这里实现RestFul风格的URL--%>
                                    <a href="${pageContext.request.contextPath}/book/toUpdatePage/${book.bookID}" >修改</a> &nbsp; | &nbsp;
                                    <a href="${pageContext.request.contextPath}/book/deleteBook/${book.bookID}">删除</a>
                                </td>
                            </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>

</div>
</body>
</html>
