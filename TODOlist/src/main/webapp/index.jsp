<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./css/style.css">
    <title>ToDo List with Calendar</title>
    
</head>
<body>
    <h1>予定リスト</h1>

    <div id="datetime"></div>

    <div class="app">
        <input id="taskInput" type="text" placeholder="予定や内容を入力してください" required>
        <input id="taskDate" type="date" required>
        <input id="taskTime" type="time" required>
        <button onclick="addTask()">内容決定</button>
        <ul id="tasksList"></ul>
    </div>
    <script src="./js/script.js"></script>
</body>
</html>