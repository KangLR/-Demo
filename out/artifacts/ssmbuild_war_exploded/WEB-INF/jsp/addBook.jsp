<%--
  Created by IntelliJ IDEA.
  User: klr106
  Date: 2020/3/21
  Time: 21:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>增加书籍</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
</head>
<body>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="page-header">
                <h1>
                    <small>新增书籍</small>
                </h1>
            </div>
        </div>
    </div>
<%--    input中的name属性一定要与实体类Books的字段名一样
        require确保表单都填了才能提交，不然只填一个就提交会报错
--%>
    <form class="form-horizontal" action="${pageContext.request.contextPath}/book/addBook" method="post">
        <div class="form-group">
            <label for="bkname" class="col-sm-1 control-label">书籍名称</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="bkname" name="bookName" required>
            </div>
        </div>
        <div class="form-group">
            <label for="bkcount" class="col-sm-1 control-label">书籍数量</label>
            <div class="col-sm-10">
                <input type="number" class="form-control" id="bkcount" name="bookCounts"required>
            </div>
        </div>
        <div class="form-group">
            <label for="bkdetail" class="col-sm-1 control-label">书籍描述</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="bkdetail" name="detail" required>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-1 col-sm-10">
                <button type="submit" class="btn btn-default">ADD</button>
            </div>
        </div>
    </form>
</div>



</body>
</html>
