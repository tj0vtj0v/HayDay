import mysql.connector as db
from dotenv import get_key


class DbConnection:
    def __init__(self, user: str, password: str, database: str,
                 host: str = get_key(".env", "DB_HOST"),
                 port: str = get_key(".env", "DB_PORT")
                 ):
        self.database = db.connect(
            host=host,
            port=port,
            user=user,
            password=password,
            database=database
        )

        self.database.autocommit = True
        self.actor = self.database.cursor()

    def make_entry(self, table: str, values: str, log: bool = True):
        statement = f'''INSERT INTO `{table}` VALUES ({values});'''

        self.exec_statement(statement, log)

    def exec_statement(self, statement: str, log: bool = True):
        if log:
            print(statement)

        self.actor.execute(statement)
        self.database.commit()

    def close_connection(self):
        self.actor.close()
        self.database.close()
