from data_json import to_json
from pprint import pprint

items = to_json().items()
source = to_json().source()
ingredients = to_json().ingredients()


def get_complete_production_time(index: int) -> float:
    item = items[index]
    production_time = float(item['production time'])
    item_ingredients = ingredients[items[index]['ingredients']]

    for index in range(1, 5):
        if item_ingredients[f'ingredient_{index}'] is not None:
            production_time += get_complete_production_time(item_ingredients[f'ingredient_{index}']) * float(
                item_ingredients[f'quantity_{index}'])

    return production_time


def get_craftems_production_time(index: int) -> float:
    item = items[index]
    production_time = float(item['production time'])
    item_ingredients = ingredients[items[index]['ingredients']]

    if item_ingredients['ingredient_1'] is None:
        return 0

    for index in range(1, 5):
        if item_ingredients[f'ingredient_{index}'] is not None:
            production_time += get_craftems_production_time(item_ingredients[f'ingredient_{index}']) * float(
                item_ingredients[f'quantity_{index}'])

    return production_time


complete_return_ratio = {}
products_return_ratio = {}
for x in range(1, len(items) + 1):
    try:
        complete_return_ratio[x] = round(items[x]['maximum price'] / get_complete_production_time(x), 4)
        products_return_ratio[x] = round(items[x]['maximum price'] / get_craftems_production_time(x), 4)
    except ZeroDivisionError:
        pass

pprint(complete_return_ratio)

""" https://justhayday.boards.net/thread/449/miningtools-ore-10-diamonds?page=1&scrollTo=5764
structure = ['silver', 'gold', 'platinum', 'iron' ,'coal', 'diamond']
dynamite = [131,83,48,71,86,10]
tnt = [166,69,43,69,74,10]
shovel = [108,73,42,61,68,10]
pickaxe = [165,98,45,91,91,62]


"""
