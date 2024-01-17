<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!DOCTYPE html>
<html>
<head>
    <!-- 他のヘッダー要素は省略 -->
    <title>映画情報更新結果</title>
</head>
<body>

    <h2>映画情報更新結果</h2>

    <c:choose>
        <c:when test="${param.action eq 'updateTitle'}">
            <sql:update dataSource="jdbc/myDB" var="result">
                UPDATE movies SET title = ? WHERE id = ?;
                <sql:param value="${param.newTitle}" />
                <sql:param value="${param.movieId}" />
            </sql:update>
            <c:if test="${result >= 0}">
                <p>映画のタイトルが更新されました。</p>
            </c:if>
        </c:when>
        <c:when test="${param.action eq 'updateTime'}">
            <sql:update dataSource="jdbc/myDB" var="result">
                UPDATE movies SET time = ? WHERE id = ?;
                <sql:param value="${param.newTime}" />
                <sql:param value="${param.movieId}" />
            </sql:update>
            <c:if test="${result >= 0}">
                <p>映画の時間が更新されました。</p>
            </c:if>
        </c:when>
    </c:choose>

    <!-- 他のコンテンツは省略 -->

</body>
</html>