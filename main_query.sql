USE hayday;

SELECT i.maximum_price*i.maximum_price/e.complete_production_time,
       s.name                                                   AS `Production Building`,
       i.name                                                   AS `Item Name`,
       i.level                                                  AS `Unlock Level`,
       i.experience                                             AS `Experience`,
       e.complete_experience                                    AS `Sum of Experience and Experience of all and every Ingredient`,
       i.production_time                                        AS `Inital Production Time`,
       i.mastered_time                                          AS `Mastered Production Time`,
       e.profit                                                 AS `Profit`,
       e.profit / i.production_time                             AS `Profit per Initial Production Time`,
       i.maximum_price                                          AS `Maximum Price`,
       e.complete_experience / i.maximum_price                  AS `Experience Sum per Maximum Price`,
       e.complete_production_time                               AS `Sum of Initial Production Time and Initial Production Time of all and every Ingredient`,
       i.maximum_price / e.complete_production_time             AS `Maximum Price per Sum of Initial Production Time`,
       e.no_crops_production_time                               AS `Sum of Initial Production Time and all Ingredients which are Products`,
       e.complete_mastered_time                                 AS `Sum of Mastered Production Time and Mastered Production Time of all and every Ingredient`,
       i.maximum_price / e.complete_mastered_time               AS `Maximum Price per Sum of Mastered Production Time`,
       e.no_crops_mastered_time                                 AS `Sum of Mastered Production Time and all Ingredients which are Products`,
       e.complete_production_time / e.complete_mastered_time    AS `Ratio of Production Time to Mastered Time`,
       (SELECT name from items where items.id = d.ingredient_1) AS `Ingredient 1`,
       d.quantity_1                                             AS `Quantity of Ingredient 1`,
       (SELECT name from items where items.id = d.ingredient_2) AS `Ingredient 2`,
       d.quantity_2                                             AS `Quantity of Ingredient 2`,
       (SELECT name from items where items.id = d.ingredient_3) AS `Ingredient 3`,
       d.quantity_3                                             AS `Quantity of Ingredient 3`,
       (SELECT name from items where items.id = d.ingredient_4) AS `Ingredient 4`,
       d.quantity_4                                             AS `Quantity of Ingredient 4`
FROM items i
         JOIN evaluation e ON i.id = e.id
         JOIN source s ON i.source = s.id
         JOIN ingredients d ON i.ingredients = d.id
WHERE i.level <= 100
ORDER BY i.maximum_price*i.maximum_price / e.complete_production_time desc;

SELECT * from animal_steps Order by experience desc

