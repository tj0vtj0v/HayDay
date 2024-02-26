USE hayday;

SELECT
	s.name AS `Production Building`,
    i.name AS `Item Name`,
    i.level AS `Unlock Level`,
    i.experience AS `Experience`,
    e.complete_experience AS `Sum of Experience and Experience of all and every Ingredient`,
    i.production_time AS `Inital Production Time`,
    i.mastered_time AS `Mastered Production Time`,
    e.profit AS `Profit`,
    e.profit/i.production_time AS `Profit per Initial Production Time`,
    i.maximum_price AS `Maximum Price`,
    e.complete_experience/i.maximum_price AS `Experience Sum per Maximum Price`,
    e.complete_time AS `Sum of Initial Production Time and Initial Production Time of all and every Ingredient`,
    i.maximum_price/e.complete_time AS `Maximum Price per Initial Production Time Sum`,
    e.no_crops_time AS `Sum of Initial Production Time and all Ingredients which although have Ingredients`,
    (SELECT name from items where items.id = d.ingredient_1) AS `Ingredient 1`,
    d.quantity_1 AS `Quantity of Ingredient 1`,
    (SELECT name from items where items.id = d.ingredient_2) AS `Ingredient 2`,
    d.quantity_2 AS `Quantity of Ingredient 2`,
    (SELECT name from items where items.id = d.ingredient_3) AS `Ingredient 3`,
    d.quantity_3 AS `Quantity of Ingredient 3`,
    (SELECT name from items where items.id = d.ingredient_4) AS `Ingredient 4`,
    d.quantity_4 AS `Quantity of Ingredient 4`
FROM items i
JOIN evaluation e ON i.id = e.id
JOIN source s ON i.source = s.id
JOIN ingredients d ON i.ingredients = d.id;

