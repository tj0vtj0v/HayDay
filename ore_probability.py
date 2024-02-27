from DBConnection import DbConnection
from dotenv import get_key

# input data       -- structure: silver, gold, platinum, iron, coal, diamond
dynamite = [131, 83, 48, 71, 86, 10]
tnt = [166, 69, 43, 69, 74, 10]
shovel = [108, 73, 42, 61, 68, 10]
pickaxe = [165, 98, 45, 91, 62, 10]


# get percentages for each step
def percentages_each(miner: list[int]):
    total = sum(miner[0:5])

    return_list = []
    for element in range(0, len(miner)):
        return_list.append(round(miner[element] / total * 100, 2))

    return return_list


percentages = [percentages_each(dynamite),
               percentages_each(tnt),
               percentages_each(shovel),
               percentages_each(pickaxe)]

# get percentages for all
totals = []
for element in range(0, len(percentages[0])):
    totals.append(dynamite[element] + tnt[element] + shovel[element] + pickaxe[element])

total_totals = sum(totals)
total_percentages = []
for element in range(0, len(totals)):
    total_percentages.append(round(totals[element] / total_totals * 100, 2))

# get MAE for all percentages
MAE = []
for element in range(0, len(total_percentages)):
    MAE_element = 0
    for miner in range(0, len(percentages)):
        MAE_element += abs(total_percentages[element] - percentages[miner][element])
    MAE.append(round(MAE_element / len(percentages), 2))

# get diamonds per ore ratio
ore_per_diamond = [round(sum(dynamite[0:5]) / 10, 2),
                   round(sum(tnt[0:5]) / 10, 2),
                   round(sum(shovel[0:5]) / 10, 2),
                   round(sum(pickaxe[0:5]) / 10, 2),
                   round(total_totals / 40, 2)]

MAE_ore_per_diamond = 0
for miner in range(0, len(percentages)):
    MAE_ore_per_diamond += abs(ore_per_diamond[-1] - ore_per_diamond[miner])
ore_per_diamond.append(round(MAE_ore_per_diamond / len(percentages), 2))

# insert data in database
db = DbConnection(get_key(".env", "DB_USER"),
                  get_key(".env", "DB_PWD"),
                  get_key(".env", "DB_NAME"))

table = percentages
table.append(total_percentages)
table.append(MAE)
row_names = ['dynamite', 'TNT', 'shovel', 'pickaxe', 'overall', 'Mean_Absolute_Error']

for row in range(0, len(table)):
    tmp = [str(x) for x in table[row]]
    values = f'{row}, "{row_names[row]}", "' + '", "'.join(tmp) + f'", "{str(ore_per_diamond[row])}"'
    db.make_entry('ore_probability', values)
