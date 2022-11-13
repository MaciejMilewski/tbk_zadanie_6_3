import os
import psycopg2
from flask import Flask, request
import json

app = Flask(__name__)


def get_db_connection():
    conn = psycopg2.connect(host=os.environ.get("DB_HOST", "postgres"),
                            database='sample-db',
                            user='dbuser',
                            password='secretpassword')
    return conn


@app.route('/cars', methods=['GET'])
def index():
    year = request.args.get('year')
    if year is None:
        conn = get_db_connection()
        cur = conn.cursor()
        cur.execute('SELECT * FROM cars;')
        row_headers=[x[0] for x in cur.description] 
        cars = cur.fetchall()
        cur.close()
        conn.close()
        json_data=[]
        for car in cars:
                json_data.append(dict(zip(row_headers, car)))
        return json.dumps(json_data), 200
    else:
        conn = get_db_connection()
        cur = conn.cursor()
        cur.execute("SELECT * FROM cars WHERE year=" + year + ";")
        row_headers=[x[0] for x in cur.description] 
        cars = cur.fetchall()
        cur.close()
        conn.close()
        json_data=[]
        for car in cars:
                json_data.append(dict(zip(row_headers, car)))
        return json.dumps(json_data), 200


if __name__ == "__main__":
    app.run(debug=True, host="0.0.0.0", port=int(os.environ.get("PORT", 5000)))