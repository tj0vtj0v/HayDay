from data_json import to_json
from DBConnection import DbConnection

items = to_json().items()
source = to_json().source()
ingredients = to_json().ingredients()


def get_complete_production_time(index: int) -> float:
    item = items[index]
    production_time = float(item['production_time'])
    item_ingredients = ingredients[items[index]['ingredients']]

    for ingredient in range(1, 5):
        if item_ingredients[f'ingredient_{ingredient}'] is not None:
            production_time += get_complete_production_time(item_ingredients[f'ingredient_{ingredient}']) * float(
                item_ingredients[f'quantity_{ingredient}'])

    return production_time


def get_cropless_production_time(index: int) -> float:
    item = items[index]
    production_time = float(item['production_time'])
    item_ingredients = ingredients[items[index]['ingredients']]

    if item_ingredients['ingredient_1'] is None:
        return 0

    for ingredient in range(1, 5):
        if item_ingredients[f'ingredient_{ingredient}'] is not None:
            production_time += get_cropless_production_time(item_ingredients[f'ingredient_{ingredient}']) * float(
                item_ingredients[f'quantity_{ingredient}'])

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


# save evaluated data
complete_production_time = {}
cropless_production_time = {}
profit = {}

db = DbConnection('hayday', 'i_am_hayday', 'hayday')

for index in range(1, len(items) + 1):
    try:
        complete_production_time[index] = round(get_complete_production_time(index), 2)
        cropless_production_time[index] = round(get_cropless_production_time(index), 2)
        profit[index] = round(get_profit(index), 2)

        values = f'{index}, {complete_production_time[index]}, {cropless_production_time[index]}, {profit[index]}'
        db.make_entry('evaluation', values)
    except ZeroDivisionError:
        pass


