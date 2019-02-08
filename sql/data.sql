INSERT INTO public.restaurant (id, name)
VALUES (3, 'oc_toulouse_nord'),
(4, 'oc_toulouse_sud');

INSERT INTO public.pizza (id, name, description, price)
VALUES (1, 'catalane', 'tomate, thon, emmental, oignons, poivrons, tomates fraîches, olives', 15.00),
(2, 'forestière', 'crème fraîche, champignons, emmental, lardons, persillade', 14.00),
(3, 'royale', 'tomate, champignons, jambon, emmental', 13.50),
(4, 'romaine', 'tomate, jambon, emmental, oeufs', 14.50),
(5, 'paysanne', 'tomate, champignons, emmental, olives, tomates fraîches', 12.50),
(6, 'carbonara', 'crème fraîche, jambon, emmental, oignons, jaune d’oeuf crû', 14.00);

INSERT INTO public.ingredient (id, name)
VALUES (1, 'champignon'),
(2, 'emmental'),
(3, 'jambon'),
(4, 'sauce tomate'),
(5, 'tomate fraîche'),
(6, 'crème fraîche'),
(7, 'persil'),
(8, 'oignon'),
(9, 'oeuf dur'),
(10, 'oeuf'),
(11, 'olive'),
(12, 'thon');

INSERT INTO public.pizza_ingredient (pizza_id, ingredient_id, quantity)
VALUES (3, 4, 1),
(3, 1, 1),
(3, 3, 1),
(3, 2, 2),
(4, 4, 1),
(4, 3, 1),
(4, 2, 2),
(4, 9, 1),
(5, 4, 1),
(5, 1, 1),
(5, 2, 2),
(5, 11, 1),
(5, 5, 1),
(2, 6, 1),
(2, 1, 1),
(2, 2, 2),
(2, 3, 1),
(2, 7, 1),
(1, 4, 1),
(1, 2, 2),
(1, 8, 1),
(1, 12, 1),
(1, 5, 1),
(1, 11, 1),
(6, 6, 1),
(6, 3, 1),
(6, 2, 2),
(6, 8, 1),
(6, 10, 1);

INSERT INTO public.place (id, title, address, zipcode, city, phone_number, restaurant_id)
VALUES (1, 'oc_nord', '39 avenue des minimes', '31200', 'toulouse', '0561228485', 3),
(2, 'oc_sud', '112 rue du feretra', '31400', 'toulouse', '0561252525', 4),
(3, 'maison', '8 rue condeau', '31200', 'toulouse', '0601020304', 3),
(4, 'maison', '10 chemin du raisin', '31000', 'toulouse', '0602030405', 3),
(5, 'maison', '44 rue du faubourg bonnefoy', '31500', 'toulouse', '0610203040', 3),
(6, 'maison', '24 avenue st-exupéry', '31400', 'toulouse', '0612213113', 4),
(7, 'maison', '39 allée jules guesde', '31400', 'toulouse', '0656873502', 4),
(8, 'maison', '10 avenue edouard belin', '31055', 'toulouse', '0687153966', 4);


INSERT INTO public.client (id, firstname, lastname, mail, password, place_id)
VALUES (2, 'john', 'doe', 'john_doe@mail.com', 'passjohn', 3),
(3,'jane', 'doe', 'jane_doe@mail.com', 'passjane', 4),
(4, 'fred', 'bloggs', 'fred_bloggs@mail.com', 'passfred', 5),
(5, 'joe', 'bloggs', 'joe_bloggs@mail.com', 'passjoe', 6),
(6, 'mary', 'major', 'mary_major@mail.com', 'passmary', 7),
(7, 'ann', 'yone', 'ann_yone@ail.com', 'passann', 8);

INSERT INTO public.employee (id, place_id, firstname, lastname, mail, password)
VALUES (1, 1, 'pierre', 'paul', 'pierre_paul@mail.com', 'passpierre'),
(2, 1, 'marie', 'durand', 'marie_durand@mail.com', 'passmarie'),
(3, 1, 'valerie', 'jach', 'valerie_jach@mail.com', 'passvalerie'),
(4, 2, 'maxime', 'vallee', 'maxime_vallee@mail.com', 'passmaxime'),
(5, 2, 'antoine', 'salat', 'antoine_salat@mail.com', 'passsalat'),
(6, 2, 'nicolas', 'cure', 'nicolas_cure@mail.com', 'passnicolas');

INSERT INTO public.mean_of_payment (id, title)
VALUES (1, 'espèce'),
(2, 'carte bancaire'),
(3, 'chèque déjeuner');

INSERT INTO public.order_form (number, creation_date, mean_of_payment_id, client_id, employee_id)
VALUES (15739, '2019-02-06 18:34:05.470000', 1, 2, 1),
(15740, '2019-02-06 18:41:50.597000', 2, 5, 5),
(15741, '2019-02-06 19:12:08.749000', 2, 7, 5),
(15742, '2019-02-06 19:18:20.497000', 2, 3, 1),
(15743, '2019-02-06 19:28:33.496000', 3, 6, 5),
(15744, '2019-02-06 19:43:23.931000', 2, 4, 1);

INSERT INTO public.order_line (order_form_number, pizza_id, quantity) VALUES (15739, 3, 1),
(15740, 6, 1),
(15741, 2, 1),
(15742, 4, 1),
(15743, 5, 1),
(15744, 1, 1);

INSERT INTO public.status (id, title)
VALUES (1, 'en préparation'),
(2, 'livraison'),
(3, 'livrée');

INSERT INTO public.status_order (id, status_id, order_form_number, set_date)
VALUES (1, 3, 15739, '2019-02-06 19:06:48.538000'),
(2, 2, 15740, '2019-02-06 19:10:54.991000'),
(3, 1, 15741, '2019-02-06 19:12:54.455000');

INSERT INTO public.stock (ingredient_id, restaurant_id, quantity)
VALUES (1, 3, 300),
(2, 3, 600),
(3, 3, 300),
(4, 3, 300),
(5, 3, 600),
(6, 3, 300),
(7, 3, 300),
(8, 3, 300),
(9, 3, 300),
(10, 3, 100),
(11, 3, 300),
(12, 3, 100),
(1, 4, 300),
(2, 4, 600),
(3, 4, 300),
(4, 4, 300),
(5, 4, 600),
(6, 4, 300),
(7, 4, 300),
(8, 4, 300),
(9, 4, 300),
(10, 4, 100),
(11, 4, 300),
(12, 4, 100);

INSERT INTO public.payment ("id", "mean_of_payment_id", "order_form_number", "payment_date", "total_price")
VALUES (DEFAULT, 1, 15739, '2019-02-06', 13.50),
(DEFAULT, 2, 15740, '2019-02-06', 14.00),
(DEFAULT, 2, 15741, '2019-02-06', 14.00),
(DEFAULT, 2, 15742, '2019-02-06', 14.50),
(DEFAULT, 3, 15743, '2019-02-06', 12.50),
(DEFAULT, 2, 15744, '2019-02-06', 15.00);