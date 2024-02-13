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



// クリック数を保持する変数
let clickCount = 0;

function countClick() {
    // ローカルストレージから現在のクリック数を取得し、1増やす
    let clickCount = parseInt(localStorage.getItem('clickCount') || '0') + 1;

    // 更新されたクリック数をローカルストレージに保存
    localStorage.setItem('clickCount', clickCount);

    // カウンターの値を更新する
    updateCounterDisplay();
}

function updateCounterDisplay() {
    // ローカルストレージからクリック数を取得して表示
    let clickCount = localStorage.getItem('clickCount') || '0';
    document.getElementById('counter').textContent = `サイト閲覧数: ${clickCount}`;
}

// ページが読み込まれたときにカウンターの表示を更新する
document.addEventListener('DOMContentLoaded', updateCounterDisplay);









