const express = require('express');
const sqlite3 = require('sqlite3');
const { open } = require('sqlite');

const app = express();
const port = 3000;

// SQLiteデータベースの設定
async function setupDatabase() {
    const db = await open({
        filename: 'visitors.db',
        driver: sqlite3.Database
    });

    await db.exec('CREATE TABLE IF NOT EXISTS visitors (visits INTEGER NOT NULL)');
    const count = await db.get('SELECT COUNT(*) AS count FROM visitors');
    if (count.count === 0) {
        await db.exec('INSERT INTO visitors (visits) VALUES (0)');
    }

    return db;
}

// データベースの初期化
let db;
setupDatabase().then(database => {
    db = database;
});

// 訪問者数を取得し、インクリメントするエンドポイント
app.get('/visit', async (req, res) => {
    const row = await db.get('SELECT visits FROM visitors');
    let visits = row.visits;
    visits++;

    await db.run('UPDATE visitors SET visits = ?', visits);
    res.send(`訪問者数: ${visits}`);
});

app.listen(port, () => {
    console.log(`サーバーがポート${port}で起動しています。`);
});
