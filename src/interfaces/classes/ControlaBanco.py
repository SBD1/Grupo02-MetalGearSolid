import psycopg2


class ControlaBanco:

    def __init__(self):
        self.conn = psycopg2.connect(host="postgres", dbname="metalgear", user="cleiton", password="cleiton123")
        self.cur = self.conn.cursor()

    def util(self):
        for a in self.select("NPC", "idNPC,nome"):
            print(a)


    def processa_string(self,linhas):
        tuplasProcessadas = []
        for linha in linhas:
            tempColuna = []
            for coluna in linha:
                if type(coluna) is str:
                    coluna = coluna.strip()
                tempColuna.append(coluna)
            tuplasProcessadas.append(tuple(tempColuna))
        return tuplasProcessadas
    
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

        listaTuplasProcessadas = self.processa_string(self.cur.fetchall())

        return listaTuplasProcessadas

    def update(
            self,
            tabela: str = '',
            colunas: str = '',
            onde: str = ''
            ):
        print(f"update {tabela} set {colunas} where {onde};")

        self.cur.execute(f"update {tabela} set {colunas} where {onde};")
        self.conn.commit()

    def delete(
            self,
            tabela: str,
            onde: str
            ):

        self.cur.execute(f"delete from {tabela} where {onde};")
        self.conn.commit()


    def insert(
            self,
            tabela: str = '',
            colunas: str = '',
            valores: str = '',
            ):

        print(f"insert into {tabela} ({colunas}) values ({valores});")

        self.cur.execute(f"insert into {tabela} ({colunas}) values ({valores});")
        self.conn.commit()

