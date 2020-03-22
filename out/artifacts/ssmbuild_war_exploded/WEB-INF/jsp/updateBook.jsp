<%--
  Created by IntelliJ IDEA.
  User: klr106
  Date: 2020/3/21
  Time: 22:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

    <title>修改书籍</title>
</head>
<body>



<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="page-header">
                <h1>
                    <small>修改书籍</small>
                </h1>
            </div>
        </div>
    </div>
<%--  别忘记把书籍ID一起传回去
        springmvc会自动把name属性和另一边的参数books进行匹配，不像以前需要getParameter那些

        id可以用隐藏域传
--%>
    <form class="form-horizontal" action="${pageContext.request.contextPath}/book/updateBook" method="post">
        <input type="hidden" name="bookID" value="${book.bookID}">
        <div class="form-group">
            <label for="bkname" class="col-sm-1 control-label">书籍名称</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="bkname" name="bookName" required value="${book.bookName}">
            </div>
        </div>
        <div class="form-group">
            <label for="bkcount" class="col-sm-1 control-label">书籍数量</label>
            <div class="col-sm-10">
                <input type="number" class="form-control" id="bkcount" name="bookCounts"required value="${book.bookCounts}">
            </div>
        </div>
        <div class="form-group">
            <label for="bkdetail" class="col-sm-1 control-label">书籍描述</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="bkdetail" name="detail" required value="${book.detail}">
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-1 col-sm-10">
                <button type="submit" class="btn btn-default">UPDATE</button>
            </div>
        </div>
    </form>
</div>

</body>
</html>
