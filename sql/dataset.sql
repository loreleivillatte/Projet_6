-- show customer information Jane Doe
SELECT *
FROM client
WHERE  lastname='doe' AND firstname='jane';

-- display Jane doe's sales order information
SELECT *
FROM order_line
INNER JOIN order_form o on order_line.order_form_number = o.number
INNER JOIN client c on o.client_id = c.id
WHERE  c.id=5;

SELECT *
FROM payment
INNER JOIN order_form o on payment.order_form_number = o.number
INNER JOIN client c on o.client_id = c.id
WHERE c.id = 5;

-- shows the remaining quantity of a product in a restaurant
SELECT quantity
FROM stock
WHERE ingredient_id=10 AND restaurant_id=3;

-- shows the recipe of a pizza
SELECT ingredient.name, quantity
FROM ingredient
INNER JOIN pizza_ingredient pi on ingredient.id = pi.ingredient_id
INNER JOIN pizza p on pi.pizza_id = p.id
WHERE p.name = 'royale';

