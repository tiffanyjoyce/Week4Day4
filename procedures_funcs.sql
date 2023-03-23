-- lets make a procedure

-- looks like python

CREATE procedure late_fee_c112_tiffany(
    pay_id INTEGER,
    late_fee_amount NUMERIC(7, 2) -- remember, 7 digits 2 decimal places
)
LANGUAGE plpgsql -- Programming language PostGresSQL
AS
$$
BEGIN
    -- THIS IS WHERE OUR CODE BLOCK GOES
    -- ADD LATE FEES TO THE PAYMENT (AMOUNT TABLE)
    UPDATE payment 
    SET amount = amount + late_fee_amount
    WHERE payment_id = pay_id;
    -- commit the code block inside of a transaction
    COMMIT;
END
$$
;

-- CREATE OR REPLACE PROCEDURE

CALL late_fee_c112_tiffany()

SELECT * 
FROM payment
WHERE amount < 0;

SELECT *
FROM payment
WHERE payment_id = 22686;

CALL late_fee_c112_tiffany(22686, 447.56);

-- lets store a function

CREATE OR REPLACE FUNCTION add_actor_c112_tiffany()

SELECT *
FROM actor;

-- lets look at ids because i dont want to overwrite data

SELECT *
FROM actor
ORDER BY actor_id DESC;

CREATE or replace function add_actor_c112_tiffany(
    a_id INTEGER
    f_name VARCHAR(50)
    l_name VARCHAR(50)
)
RETURNS VOID

LANGUAGE plpgsql
AS
$MAIN$
BEGIN
    -- INSERT INTO ACTOR TABLE
    INSERT INTO actor(actor_id, first_name, last_name, last_update)
    -- arguments
    VALUES(a_id, f_name, l_name, NOW()::TIMESTAMP);
    -- 
END
$MAIN$
;

SELECT *
FROM actor
WHERE actor_id = 5001
ORDER BY actor_id;

