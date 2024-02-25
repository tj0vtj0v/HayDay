from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.common.action_chains import ActionChains
from DBConnection import DbConnection

driver = webdriver.Chrome()

# get all pets
driver.get("https://haydayguides.com/tools/pets-tool.php")

driver.implicitly_wait(1)
for cards in range(1, 6):
    driver.find_element(By.XPATH, f'/html/body/div[1]/div/div[1]/form/div[{cards}]/div/input').send_keys(10000)

driver.find_element(By.XPATH, "/html/body/div[1]/div/div[1]/form/div[6]/button").click()

pets_raw = driver.find_element(By.XPATH, "/html/body/div[1]/div/div[1]/div/div[1]/div/div").text

# get pet's magic-number
driver.get("https://justhayday.boards.net/thread/315/legacy-pets-animals-guide-drops")

driver.implicitly_wait(1)
driver.find_element(By.XPATH, "/html/body/div[1]/div/div/div/div[2]/div/button[2]").click()

ActionChains(driver).scroll_by_amount(0, 10000).perform()

driver.implicitly_wait(2)
tables_raw = driver.find_element(By.XPATH,
                                 "/html/body/div[2]/div/div[3]/div/div[4]/table/tbody/tr[2]/td/table/tbody/tr[1]/td[2]/article/div[2]").text


def __get_pets():
    # compute pet data       -- structure: name, cooldown, experience, level
    pets_list_raw = [pets_raw.split("\n")[x:x + 5] for x in range(0, len(pets_raw.split("\n")), 5)]
    pets = []
    for pet in pets_list_raw:
        pet[-1] = pet[-1].split(" ")[-1]
        pet.pop(1)
        pet[1] = pet[1].removesuffix("h")
        pets.append(pet)

    return pets


def __get_step_value():
    # compute step_value data       -- structure: level, name, step_value, experience, cooldown
    step_value = []
    for line in tables_raw.split("\n")[6:45]:
        if not line.startswith("-"):
            entity = [element for element in line.split(" ")]

            # edit line
            entity.pop(-1)
            entity.pop(-2)

            if len(entity[0]) == 0:
                entity.pop(0)

            if len(entity) > 5:
                entity[1] = " ".join(entity[1:len(entity) - 3])

                while len(entity) > 5:
                    entity.pop(2)

            entity[2] = entity[2].removeprefix("+")
            entity[3] = entity[3].removesuffix("xp")

            step_value.append(entity)

            if entity[1] == "Palomino" or entity[1] == "Andalusian" or entity[1] == "Appaloosa":
                entity[1] = entity[1] + " Horse"

    step_value[0][4] = str(round(int(step_value[0][4]) / 60, 2))

    return step_value


def __get_magic_numbers():
    # compute magic_number data       -- structure: level, magic_number
    magic_numbers = []
    magic_table = tables_raw.split("\n")[62:111]
    magic_table.reverse()
    for line in magic_table:
        if not line.startswith("-"):
            lvl_range = [element for element in line.split(" ")]
            if len(lvl_range[0].split("-")) > 1:
                for level in range(int(lvl_range[0].split("-")[0]), int(lvl_range[0].split("-")[1]) + 1):
                    magic_numbers.append([level, lvl_range[-1]])
            else:
                magic_numbers.append(lvl_range[0:2])

    return magic_numbers


def __build_animal_steps_values():
    id_counter = 1
    entries = []
    for animal in step_value:
        if id_counter < 6:
            entries.append(f'{id_counter}, "{animal[1]}", {animal[0]}, {animal[3]}, {animal[4]}, {animal[2]}')

        id_counter += 1

    for pet in pets:
        for animal in step_value:
            if pet[0] == animal[1]:
                entries.append(f'{id_counter}, "{animal[1]}", {animal[0]}, {animal[3]}, {animal[4]}, {animal[2]}')
                break
        else:
            entries.append(f'{id_counter}, "{pet[0]}", {pet[3]}, {pet[2]}, {pet[1]}, NULL')

        id_counter += 1

    return entries


db = DbConnection('hayday', 'i_am_hayday', 'hayday')

pets = __get_pets()
step_value = __get_step_value()
magic_numbers = __get_magic_numbers()

for entry in __build_animal_steps_values():
    db.make_entry('animal_steps', entry)

for entry in magic_numbers:
    db.make_entry('magic_number', f'{entry[0]}, {entry[1]}')
