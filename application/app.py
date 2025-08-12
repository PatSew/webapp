from flask import Flask, render_template, request, redirect, jsonify
import psycopg2
import os

app = Flask(__name__)

# Database connection settings
DB_HOST = os.getenv("AZURE_POSTGRESQL_HOST", "db")
DB_NAME = os.getenv("AZURE_POSTGRESQL_NAME", "testdb")
DB_USER = os.getenv("AZURE_POSTGRESQL_USER", "testuser")
DB_PASSWORD = os.getenv("AZURE_POSTGRESQL_PASSWORD", "testpass")
DB_PORT = os.getenv("POSTGRES_PORT", 5432)

def get_conn():
    return psycopg2.connect(
        host=DB_HOST,
        dbname=DB_NAME,
        user=DB_USER,
        password=DB_PASSWORD,
        port=DB_PORT
    )

def init_db():
    """Create table if it doesn't exist."""
    conn = get_conn()
    cur = conn.cursor()
    cur.execute("""
        CREATE TABLE IF NOT EXISTS items (
            id SERIAL PRIMARY KEY,
            content TEXT NOT NULL
        );
    """)
    conn.commit()
    cur.close()
    conn.close()

# Run table creation at startup (important for Azure)
init_db()

@app.route("/db-health")
def db_health():
    try:
        conn = get_conn()
        cur = conn.cursor()
        cur.execute("SELECT 1;")
        cur.fetchone()
        cur.close()
        conn.close()
        return jsonify({"status": "ok", "db": "connected"})
    except Exception as e:
        return jsonify({"status": "error", "db": "not connected", "error": str(e)}), 500

@app.route("/", methods=["GET", "POST"])
def index():
    if request.method == "POST":
        data = request.form.get("data")
        if data:
            conn = get_conn()
            cur = conn.cursor()
            cur.execute("INSERT INTO items (content) VALUES (%s);", (data,))
            conn.commit()
            cur.close()
            conn.close()
        return redirect("/")

    conn = get_conn()
    cur = conn.cursor()
    cur.execute("SELECT id, content FROM items ORDER BY id DESC;")
    rows = cur.fetchall()
    cur.close()
    conn.close()
    return render_template("index.html", items=rows)

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000, debug=True)
