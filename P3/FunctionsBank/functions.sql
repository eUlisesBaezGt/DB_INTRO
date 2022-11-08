USE BANK;
# Usando funciones implementar:
# 1. Crear una función de registro de cuentas para un cliente
CREATE FUNCTION bank.register(id INT, nam VARCHAR(250), l_name VARCHAR(250), birth DATE, gen VARCHAR(1), act BOOLEAN)
    RETURNS VARCHAR(250)
BEGIN
    INSERT INTO bank.customers
    VALUES (id, nam, l_name, birth, gen, act);
    RETURN 'Customer registered';
END;

# DROP FUNCTION bank.register;
# TRUNCATE bank.customers;
# SELECT * FROM bank.customers;

SELECT bank.register(1, 'Juan', 'Perez', '1990-01-01', 'M', TRUE);
SELECT bank.register(2, 'Maria', 'Gomez', '1990-01-01', 'F', TRUE);
SELECT bank.register(3, 'Pedro', 'Gonzalez', '1990-01-01', 'M', TRUE);
SELECT *
FROM bank.customers;

# 2. Crear una función que permita cerrar una cuenta.
CREATE FUNCTION close_account(id INT)
    RETURNS VARCHAR(250)
BEGIN
    UPDATE bank.customers
    SET CUSTOMER_ACTIVE = FALSE
    WHERE CUSTOMER_NUMBER = id;
    RETURN 'Customer account closed';
END;

# DROP FUNCTION close_account;
# TRUNCATE bank.customers;
# SELECT * FROM bank.customers;

SELECT close_account(1);
SELECT *
FROM bank.customers;

# 3. Crear una función que permita guardar la información relacionada a una transacción
# bancaria (crédito o débito de saldo)
CREATE FUNCTION new_transaction(acc_num VARCHAR(12), trs_date TIMESTAMP, trs_det TEXT, trs_withdrw FLOAT,
                                trs_deposit FLOAT)
    RETURNS VARCHAR(250)
BEGIN
    INSERT INTO bank.customers_transactions
    VALUES (acc_num, trs_date, trs_det, trs_withdrw, trs_deposit);
    RETURN 'Transaction registered';
END;

# DROP FUNCTION new_transaction;
# TRUNCATE bank.customers_transactions;
# SELECT * FROM bank.customers_transactions;

SELECT new_transaction('123456789012', '2020-01-01 00:00:00', 'First transaction', 0, 1000);
SELECT new_transaction('123456789012', '2020-01-02 00:00:00', 'Second transaction', 100, 0);
SELECT *
FROM bank.customers_transactions;

# 4. Crear una función que permita consultar el saldo de un cliente dado un tipo de cuenta y su
# NIP. Debe considerar que cada transacción  del saldo del cliente genera una comisión y no se
# puede permitir esta consulta si el saldo llegase a ser negativo.
CREATE FUNCTION check_balance(acc_num VARCHAR(12), nip VARCHAR(4))
    RETURNS VARCHAR(250)
BEGIN
    DECLARE balance FLOAT;
    DECLARE comission FLOAT;
    DECLARE total FLOAT;

    IF (SELECT ACCOUNT_NIP FROM bank.accounts WHERE ACCOUNT_NUMBER = acc_num) = nip THEN

        SELECT SUM(TRANSACTION_DEPOSIT) - SUM(TRANSACTION_WITHDRAWAL)
        INTO balance
        FROM bank.customers_transactions
        WHERE ACCOUNT_NUMBER = acc_num;

        SELECT COUNT(*) * 0.06
        INTO comission
        FROM bank.customers_transactions
        WHERE ACCOUNT_NUMBER = acc_num;

        SELECT balance - comission INTO total;

        IF total < 0 THEN
            RETURN 'Insufficient funds';
        ELSE
            RETURN CONCAT('Balance: ', total);
        END IF;
    ELSE
        RETURN 'Incorrect NIP';
    END IF;
END;

# DROP FUNCTION check_balance;
# SELECT * FROM bank.accounts;

SELECT check_balance('123456789012', '4321');
SELECT check_balance('123456789012', '1234');

INSERT INTO bank.accounts
VALUES (1, '123456789012', 'Deposit', '1234', TRUE);

# 5. Crear una función que permita a un usuario consultar los movimientos que ha realizado en
# un periodo de tiempo.
CREATE PROCEDURE check_movements(acc_num VARCHAR(12), start_date DATE, end_date DATE)
BEGIN
    SELECT *
    FROM bank.customers_transactions
    WHERE ACCOUNT_NUMBER = acc_num
      AND TRANSACTION_DATE BETWEEN start_date AND end_date;
END;

# DROP PROCEDURE check_movements;
# SELECT * FROM bank.customers_transactions;

CALL check_movements('123456789012', '2020-01-01', '2020-01-01');
CALL check_movements('123456789012', '2020-01-01', '2020-01-02');

# # 6. Crear una función que permita visualizar un ranking de clientes de acuerdo a la cantidad de
# # movimientos y el monto de las operaciones realizadas.
CREATE PROCEDURE check_ranking()
BEGIN
    SELECT CUSTOMER_NUMBER,
           accounts.ACCOUNT_NUMBER,
           COUNT(*)                                               AS MOVEMENTS,
           SUM(TRANSACTION_DEPOSIT) + SUM(TRANSACTION_WITHDRAWAL) AS TOTAL_MONEY_OF_MOVEMENTS,
           SUM(TRANSACTION_DEPOSIT) - SUM(TRANSACTION_WITHDRAWAL) AS BALANCE
    FROM bank.customers_transactions
             INNER JOIN bank.accounts ON bank.customers_transactions.ACCOUNT_NUMBER = bank.accounts.ACCOUNT_NUMBER
    GROUP BY CUSTOMER_NUMBER, accounts.ACCOUNT_NUMBER
    ORDER BY MOVEMENTS DESC, TOTAL_MONEY_OF_MOVEMENTS DESC;
END;

# DROP PROCEDURE check_ranking;
# SELECT * FROM bank.customers_transactions;
# SELECT * FROM bank.accounts;

CALL check_ranking();
