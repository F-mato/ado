document.addEventListener('DOMContentLoaded', () => {
    const text = ["40代未経験","プログラマー作品"];
    const container = document.getElementById('text-container');

    text.forEach(line => {
        let lineElem = document.createElement('div'); // 新しい行用のdiv

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
                setTimeout(animate, 300); // 次の行への遅延
            }
        }
    }

    setTimeout(animate, 500);
});

document.addEventListener('DOMContentLoaded', () => {
    // 既存のコード...

    // ログインボタンのクリックイベント
    const loginButton = document.getElementById('login-button');
    loginButton.addEventListener('click', () => {
        // 'main.html'にリダイレクト
        window.location.href = 'main.html';
    });
});

document.addEventListener('DOMContentLoaded', function() {
    // すべての'#contact'リンクにイベントリスナーを追加
    document.querySelectorAll('a[href="#contact"]').forEach(anchor => {
        anchor.addEventListener('click', function(e) {
            e.preventDefault();

            // スクロール先の要素を取得
            const contactSection = document.querySelector(this.getAttribute('href'));

            // スムーズスクロールを実行
            contactSection.scrollIntoView({ behavior: 'smooth' });
        });
    });
});