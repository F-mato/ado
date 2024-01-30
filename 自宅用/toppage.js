document.addEventListener('DOMContentLoaded', () => {
    const text = ["40代未経験", "プログラマー作品"];
    const container = document.getElementById('text-container');

    text.forEach(line => {
        let lineElem = document.createElement('div');

        for (let i = 0; i < line.length; i++) {
            let char = document.createElement('span');
            char.textContent = line[i];
            char.classList.add('char');
            lineElem.appendChild(char);
        }

        container.appendChild(lineElem);
    });

    let lineIndex = 0;
    let charIndex = 0;

    function animate() {
        if (lineIndex < text.length) {
            const line = container.children[lineIndex];
            if (charIndex < line.children.length) {
                const char = line.children[charIndex];
                char.style.opacity = '1';
                char.style.transform = 'translateY(0)';
                charIndex++;
                setTimeout(animate, 150);
            } else {
                lineIndex++;
                charIndex = 0;
                setTimeout(animate, 300);
            }
        } else {
            addBlinkEffect();
        }
    }

    function addBlinkEffect() {
        container.classList.add('blink');
    }

    setTimeout(animate, 500);
});



//javascriptのカウント
document.addEventListener('DOMContentLoaded', () => {
    fetch('/')
        .then(response => response.json())
        .then(data => {
            document.getElementById('view-count').textContent = `閲覧数: ${data.view_count}`;
        })
        .catch(error => console.error('Error:', error));
});

