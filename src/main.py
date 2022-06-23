import psycopg2
import time

conn = psycopg2.connect(host="postgres",dbname="metalgear", user="postgres", password="postgres")
cur = conn.cursor()
while True:
    cur.execute("select * from providers;")
    obj = cur.fetchall()
    for o in obj:
        print(o)
    print(f"Sim, deu certo")
    time.sleep(10)
conn.close()
