from DBConnection import DbConnection
from dotenv import get_key


class to_json:
    def __init__(self):
        self.db = DbConnection(get_key(".env", "DB_USER"),
                               get_key(".env", "DB_PWD"),
                               get_key(".env", "DB_NAME"))

    def items(self):
        return self.__general_collector('items')

    def source(self):
        return self.__general_collector('source')

    def ingredients(self):
        return self.__general_collector('ingredients')

    def __general_collector(self, table: str) -> dict[dict]:
        data_dict = {}
        columns = self.__get_columns(table)

        self.db.actor.execute(f"SELECT * FROM `{table}`")

        for entry in self.db.actor.fetchall():
            entry_dict = {}
            for index in range(0, len(columns)):
                entry_dict[columns[index]] = entry[index]

            data_dict[entry[0]] = entry_dict

        return data_dict

    def __get_columns(self, table: str) -> list[str]:
        columns = []
        self.db.actor.execute(f'SHOW COLUMNS FROM `{table}`')

        for column_info in self.db.actor.fetchall():
            columns.append(column_info[0])

        return columns
