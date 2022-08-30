import psycopg2


class ConectaBanco:

    def __init__(self):
        self.conn = psycopg2.connect(host="postgres", dbname="metalgear", user="cleiton", password="cleiton123")
        self.cur = self.conn.cursor()

    def util(self):
        for a in self.select("NPC", "idNPC,nome"):
            print(a)

    def select(
            self,
            tabela: str = '',
            colunas: str = '',
            onde: str = None
            ):

        if not onde:
            self.cur.execute(f"select {colunas} from {tabela};")
        else:
            self.cur.execute(f"select {colunas} from {tabela} where {onde};")

        self.conn.commit()

        return self.cur.fetchall()

    def update(
            self,
            tabela: str = '',
            colunas: str = '',
            onde: str = ''
            ):
        print(f"update {tabela} set {colunas} where {onde};")

        self.cur.execute(f"update {tabela} set {colunas} where {onde};")
        self.conn.commit()

    def delete(self):
        pass

    def insert(
            self,
            tabela: str = '',
            colunas: str = '',
            valores: str = '',
            ):

        print(f"insert into {tabela} ({colunas}) values ({valores});")

        self.cur.execute(f"insert into {tabela} ({colunas}) values ({valores});")

        self.conn.commit()

