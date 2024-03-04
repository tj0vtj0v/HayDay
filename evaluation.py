from data_json import to_json
from DBConnection import DbConnection
from dotenv import get_key

items = to_json().items()
source = to_json().source()
ingredients = to_json().ingredients()


def get_complete_time(index: int, time_type: str) -> float:
    item = items[index]
    production_time = float(item[f'{time_type}_time'])
    item_ingredients = ingredients[items[index]['ingredients']]

    for ingredient in range(1, 5):
        if item_ingredients[f'ingredient_{ingredient}'] is not None:
            ingredient_time = get_complete_time(item_ingredients[f'ingredient_{ingredient}'], time_type)
            ingredient_quantity = float(item_ingredients[f'quantity_{ingredient}'])
            production_time += ingredient_time * ingredient_quantity

    return production_time


def get_cropless_time(index: int, time_type: str) -> float:
    item = items[index]
    production_time = float(item[f'{time_type}_time'])
    item_ingredients = ingredients[items[index]['ingredients']]

    if item_ingredients['ingredient_1'] is None:
        return 0

    for ingredient in range(1, 5):
        if item_ingredients[f'ingredient_{ingredient}'] is not None:
            ingredient_time = get_cropless_time(item_ingredients[f'ingredient_{ingredient}'], time_type)
            ingredient_quantity = float(item_ingredients[f'quantity_{ingredient}'])
            production_time += ingredient_time * ingredient_quantity

    return production_time


def get_profit(index: int) -> float:
    item = items[index]
    price = item['maximum_price']
    item_ingredients = ingredients[items[index]['ingredients']]

    ingredient_cost = 0
    for ingredient in range(1, 5):
        if item_ingredients[f'ingredient_{ingredient}'] is not None:
            ingredient_price = float(items[item_ingredients[f'ingredient_{ingredient}']]['maximum_price'])
            ingredient_quantity = float(item_ingredients[f'quantity_{ingredient}'])
            ingredient_cost += ingredient_price * ingredient_quantity

    return price - ingredient_cost


def get_complete_xp(index: int) -> int:
    item = items[index]
    experience = item['experience']
    item_ingredients = ingredients[items[index]['ingredients']]

    for ingredient in range(1, 5):
        if item_ingredients[f'ingredient_{ingredient}'] is not None:
            ingredient_xp = get_complete_xp(item_ingredients[f'ingredient_{ingredient}'])
            ingredient_quantity = float(item_ingredients[f'quantity_{ingredient}'])
            experience += ingredient_xp * ingredient_quantity

    return experience


db = DbConnection(get_key(".env", "DB_USER"),
                  get_key(".env", "DB_PWD"),
                  get_key(".env", "DB_NAME"))

for index in range(1, len(items) + 1):
    try:
        complete_production_time = round(get_complete_time(index, "production"), 2)
        cropless_production_time = round(get_cropless_time(index, "production"), 2)
        complete_mastered_time = round(get_complete_time(index, "mastered"), 2)
        cropless_mastered_time = round(get_cropless_time(index, "mastered"), 2)
        profit = round(get_profit(index), 2)
        complete_experience = get_complete_xp(index)

        values = f'{index}, {complete_production_time}, {complete_mastered_time}, {cropless_production_time}, {cropless_mastered_time}, {profit}, {complete_experience}'
        db.make_entry('evaluation', values)
    except ZeroDivisionError:
        pass
