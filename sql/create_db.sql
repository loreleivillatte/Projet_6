
CREATE SEQUENCE public.status_id_seq;

CREATE TABLE public.status (
                id INTEGER NOT NULL DEFAULT nextval('public.status_id_seq'),
                title VARCHAR(20) NOT NULL,
                CONSTRAINT status_pk PRIMARY KEY (id)
);


ALTER SEQUENCE public.status_id_seq OWNED BY public.status.id;

CREATE SEQUENCE public.mean_of_payment_id_seq;

CREATE TABLE public.mean_of_payment (
                id INTEGER NOT NULL DEFAULT nextval('public.mean_of_payment_id_seq'),
                title VARCHAR(20) NOT NULL,
                CONSTRAINT mean_of_payment_pk PRIMARY KEY (id)
);


ALTER SEQUENCE public.mean_of_payment_id_seq OWNED BY public.mean_of_payment.id;

CREATE SEQUENCE public.pizza_id_seq;

CREATE TABLE public.pizza (
                id INTEGER NOT NULL DEFAULT nextval('public.pizza_id_seq'),
                name VARCHAR(40) NOT NULL,
                description VARCHAR NOT NULL,
                price NUMERIC(4,2) NOT NULL,
                CONSTRAINT pizza_pk PRIMARY KEY (id)
);


ALTER SEQUENCE public.pizza_id_seq OWNED BY public.pizza.id;

CREATE UNIQUE INDEX pizza_idx
 ON public.pizza
 ( name );

CREATE SEQUENCE public.ingredient_id_seq;

CREATE TABLE public.ingredient (
                id INTEGER NOT NULL DEFAULT nextval('public.ingredient_id_seq'),
                name VARCHAR(20) NOT NULL,
                CONSTRAINT ingredient_pk PRIMARY KEY (id)
);


ALTER SEQUENCE public.ingredient_id_seq OWNED BY public.ingredient.id;

CREATE UNIQUE INDEX ingredient_idx
 ON public.ingredient
 ( name );

CREATE TABLE public.pizza_ingredient (
                pizza_id INTEGER NOT NULL,
                ingredient_id INTEGER NOT NULL,
                quantity INTEGER NOT NULL
);


CREATE TABLE public.restaurant (
                id INTEGER NOT NULL,
                name VARCHAR(20) NOT NULL,
                CONSTRAINT restaurant_pk PRIMARY KEY (id)
);


CREATE TABLE public.stock (
                ingredient_id INTEGER NOT NULL,
                restaurant_id INTEGER NOT NULL,
                quantity INTEGER NOT NULL
);


CREATE TABLE public.place (
                id INTEGER NOT NULL,
                title VARCHAR(50) NOT NULL,
                address VARCHAR(100) NOT NULL,
                zipcode VARCHAR(5) NOT NULL,
                city VARCHAR(20) NOT NULL,
                phone_number VARCHAR(10) NOT NULL,
                restaurant_id INTEGER NOT NULL,
                CONSTRAINT place_pk PRIMARY KEY (id)
);


CREATE SEQUENCE public.employee_id_seq;

CREATE TABLE public.employee (
                id INTEGER NOT NULL DEFAULT nextval('public.employee_id_seq'),
                place_id INTEGER NOT NULL,
                firstname VARCHAR(50) NOT NULL,
                lastname VARCHAR(50) NOT NULL,
                mail VARCHAR(100) NOT NULL,
                password VARCHAR(100) NOT NULL,
                CONSTRAINT employee_pk PRIMARY KEY (id)
);


ALTER SEQUENCE public.employee_id_seq OWNED BY public.employee.id;

CREATE TABLE public.client (
                id INTEGER NOT NULL,
                firstname VARCHAR(50) NOT NULL,
                lastname VARCHAR(50) NOT NULL,
                mail VARCHAR(100) NOT NULL,
                password VARCHAR(100) NOT NULL,
                place_id INTEGER NOT NULL,
                CONSTRAINT client_pk PRIMARY KEY (id)
);


CREATE SEQUENCE public.order_form_number_seq;

CREATE TABLE public.order_form (
                number INTEGER NOT NULL DEFAULT nextval('public.order_form_number_seq'),
                creation_date TIMESTAMP NOT NULL,
                mean_of_payment_id INTEGER NOT NULL,
                client_id INTEGER NOT NULL,
                employee_id INTEGER NOT NULL,
                CONSTRAINT order_form_pk PRIMARY KEY (number)
);


ALTER SEQUENCE public.order_form_number_seq OWNED BY public.order_form.number;

CREATE TABLE public.status_order (
                id INTEGER NOT NULL,
                status_id INTEGER NOT NULL,
                order_form_number INTEGER NOT NULL,
                set_date TIMESTAMP NOT NULL,
                CONSTRAINT status_order_pk PRIMARY KEY (id)
);


CREATE SEQUENCE public.order_line_id_seq;

CREATE TABLE public.order_line (
                id INTEGER NOT NULL DEFAULT nextval('public.order_line_id_seq'),
                order_form_number INTEGER NOT NULL,
                pizza_id INTEGER NOT NULL,
                quantity SMALLINT NOT NULL,
                CONSTRAINT order_line_pk PRIMARY KEY (id)
);


ALTER SEQUENCE public.order_line_id_seq OWNED BY public.order_line.id;

CREATE SEQUENCE public.payment_id_seq;

CREATE TABLE public.payment (
                id INTEGER NOT NULL DEFAULT nextval('public.payment_id_seq'),
                mean_of_payment_id INTEGER NOT NULL,
                order_form_number INTEGER NOT NULL,
                payment_date DATE NOT NULL,
                total_price NUMERIC(5,2) NOT NULL,
                CONSTRAINT payment_pk PRIMARY KEY (id)
);


ALTER SEQUENCE public.payment_id_seq OWNED BY public.payment.id;

ALTER TABLE public.status_order ADD CONSTRAINT status_status_order_fk
FOREIGN KEY (status_id)
REFERENCES public.status (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.payment ADD CONSTRAINT mean_of_payment_payment_fk
FOREIGN KEY (mean_of_payment_id)
REFERENCES public.mean_of_payment (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.order_form ADD CONSTRAINT mean_of_payment_order_fk
FOREIGN KEY (mean_of_payment_id)
REFERENCES public.mean_of_payment (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.order_line ADD CONSTRAINT pizza_order_line_fk
FOREIGN KEY (pizza_id)
REFERENCES public.pizza (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.pizza_ingredient ADD CONSTRAINT pizza_pizza_ingredient_fk
FOREIGN KEY (pizza_id)
REFERENCES public.pizza (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.pizza_ingredient ADD CONSTRAINT ingredient_pizza_ingredient_fk
FOREIGN KEY (ingredient_id)
REFERENCES public.ingredient (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.stock ADD CONSTRAINT ingredient_stock_fk
FOREIGN KEY (ingredient_id)
REFERENCES public.ingredient (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.place ADD CONSTRAINT restaurant_place_fk
FOREIGN KEY (restaurant_id)
REFERENCES public.restaurant (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.stock ADD CONSTRAINT restaurant_stock_fk
FOREIGN KEY (restaurant_id)
REFERENCES public.restaurant (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.employee ADD CONSTRAINT place_employee_fk
FOREIGN KEY (place_id)
REFERENCES public.place (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.client ADD CONSTRAINT place_client_fk
FOREIGN KEY (place_id)
REFERENCES public.place (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.order_form ADD CONSTRAINT employee_order_fk
FOREIGN KEY (employee_id)
REFERENCES public.employee (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.order_form ADD CONSTRAINT client_order_fk
FOREIGN KEY (client_id)
REFERENCES public.client (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.payment ADD CONSTRAINT order_payment_fk
FOREIGN KEY (order_form_number)
REFERENCES public.order_form (number)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.order_line ADD CONSTRAINT order_order_line_fk
FOREIGN KEY (order_form_number)
REFERENCES public.order_form (number)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.status_order ADD CONSTRAINT order_form_status_order_fk
FOREIGN KEY (order_form_number)
REFERENCES public.order_form (number)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
