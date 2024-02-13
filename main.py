from data_json import to_json

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
            ingredient_cost += items[item_ingredients[f'ingredient_{ingredient}']]['maximum_price']

    return price - ingredient_cost


complete_production_time = {}
cropless_production_time = {}
profit = {}
for x in range(1, len(items) + 1):
    try:
        complete_production_time[x] = round(get_complete_production_time(x), 2)
        cropless_production_time[x] = round(get_cropless_production_time(x), 2)
        profit[x] = get_profit(x)
    except ZeroDivisionError:
        pass


