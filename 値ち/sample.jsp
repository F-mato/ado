<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>JSP to JavaScript Array</title>
</head>
<body>

<%
    // JSPで配列を定義
    String[] jspArray = {"apple", "banana", "orange"};
%>

<script>
    // JSPで定義された配列をJavaScriptに渡す
    var javascriptArray = [<%
        for (int i = 0; i < jspArray.length; i++) {
            out.print("'" + jspArray[i] + "'");
            if (i < jspArray.length - 1) {
                out.print(",");
            }
        }
    %>];

    // JavaScriptで配列を表示
    console.log(javascriptArray);
</script>

</body>
</html>
