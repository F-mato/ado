function updateDateTime() {
    var now = new Date(); // 現在の日時を取得
    var year = now.getFullYear(); // 年
    var month = now.getMonth() + 1; // 月
    var day = now.getDate(); // 日
    var hour = now.getHours(); // 時
    var minute = now.getMinutes(); // 分
    var second = now.getSeconds(); // 秒

    // 日付と時間の文字列を作成
    var datetime = year + "年" + month + "月" + day + "日 " + 
                   hour + "時" + minute + "分" + second + "秒";

    // HTMLに挿入
    document.getElementById("datetime").innerHTML = datetime;
}

// 1秒ごとに日付と時間を更新
setInterval(updateDateTime, 1000);


function addTask() {
    const taskInput = document.getElementById('taskInput');
    const taskDate = document.getElementById('taskDate');
    const taskTime = document.getElementById('taskTime');
    const tasksList = document.getElementById('tasksList');

    if (taskInput.value.trim() !== '' && taskDate.value !== '' && taskTime.value !== '') {
        const li = document.createElement('li');
        const taskText = document.createTextNode(`${taskInput.value} - ${taskDate.value} ${taskTime.value}`);
        const checkbox = document.createElement('input');
        checkbox.type = 'checkbox';
        checkbox.classList.add('task-checkbox');

        const deleteBtn = document.createElement('button');
        deleteBtn.textContent = 'Delete';
        deleteBtn.classList.add('delete-btn');
        deleteBtn.onclick = function() {
            tasksList.removeChild(li);
        };

        li.appendChild(checkbox); // チェックボックスをli要素に追加
        li.appendChild(taskText); // タスクのテキストをli要素に追加
        li.appendChild(deleteBtn); // 削除ボタンをli要素に追加
        tasksList.appendChild(li); // 作成したli要素をリストに追加

        // 入力フィールドをクリア
        taskInput.value = '';
        taskDate.value = '';
        taskTime.value = '';
    } else {
        alert('Please fill in all fields!');
    }
}

//function addTask() {
    //const taskInput = document.getElementById('taskInput');
    //const taskDate = document.getElementById('taskDate');
    //const taskTime = document.getElementById('taskTime');
    //const tasksList = document.getElementById('tasksList');

    //if (taskInput.value.trim() !== '' && taskDate.value !== '' && taskTime.value !== '') {
        //const li = document.createElement('li');
        //const taskText = `${taskInput.value} - ${taskDate.value} ${taskTime.value}`;
       // const deleteBtn = document.createElement('button');
        //deleteBtn.textContent = 'Delete';
        //deleteBtn.classList.add('delete-btn');
        //deleteBtn.onclick = function() {
           // tasksList.removeChild(li);
       // };

       // li.textContent = taskText;
        //li.appendChild(deleteBtn);
        //tasksList.appendChild(li);

        // Clear input fields after adding
       // taskInput.value = '';
       // taskDate.value = '';
       // taskTime.value = '';
    //} else {
        //alert('Please fill in all fields!');
    //}
//}
