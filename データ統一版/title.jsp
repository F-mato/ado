<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://xmlns.jcp.org/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!DOCTYPE html>
<html>
<head>
    <!-- 他のヘッダー要素は省略 -->
    <title>映画情報更新</title>
</head>
<body>

    <h2>映画情報更新</h2>

    <form action="<%= request.getContextPath() %>/updateMovieInfo.jsp" method="post">
        <!-- 他のフォーム要素は省略 -->
        
        <!-- 映画のタイトル更新フォーム -->
        <label for="newTitle">新しい映画のタイトル:</label>
        <input type="text" id="newTitle" name="newTitle" required>
        <button type="submit" name="action" value="updateTitle">タイトル更新</button>

        <!-- 映画の時間更新フォーム -->
        <label for="newTime">新しい映画の時間:</label>
        <input type="text" id="newTime" name="newTime" required>
        <button type="submit" name="action" value="updateTime">時間更新</button>
    </form>


</body>
</html>