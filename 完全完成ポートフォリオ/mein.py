from flask import Flask
import psycopg2

app = Flask(__name__)

def get_db_connection():
    conn = psycopg2.connect(host='posegresql',
                            database='5432',
                            user='postgres',
                            password='admin')
    return conn

@app.route('/')
def index():
    conn = get_db_connection()
    cur = conn.cursor()
    
    # Visit count を取得または初期化
    cur.execute('SELECT count FROM visits WHERE id = 1;')
    visit_count = cur.fetchone()
    if visit_count is None:
        cur.execute('INSERT INTO visits (count) VALUES (1);')
        visit_count = 1
    else:
        visit_count = visit_count[0] + 1
        cur.execute('UPDATE visits SET count = %s WHERE id = 1;', (visit_count,))
    
    conn.commit()
    cur.close()
    conn.close()
    
    return f'This page has been visited {visit_count} times.'

if __name__ == '__main__':
    app.run()
