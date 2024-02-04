function addTask() {
    const taskInput = document.getElementById('taskInput');
    const taskDate = document.getElementById('taskDate');
    const taskTime = document.getElementById('taskTime');
    const tasksList = document.getElementById('tasksList');

    if (taskInput.value.trim() !== '' && taskDate.value !== '' && taskTime.value !== '') {
        const li = document.createElement('li');
        const taskText = `${taskInput.value} - ${taskDate.value} ${taskTime.value}`;
        const deleteBtn = document.createElement('button');
        deleteBtn.textContent = 'Delete';
        deleteBtn.classList.add('delete-btn');
        deleteBtn.onclick = function() {
            tasksList.removeChild(li);
        };

        li.textContent = taskText;
        li.appendChild(deleteBtn);
        tasksList.appendChild(li);

        // Clear input fields after adding
        taskInput.value = '';
        taskDate.value = '';
        taskTime.value = '';
    } else {
        alert('Please fill in all fields!');
    }
}
