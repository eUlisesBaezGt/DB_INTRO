# Usando funciones implementar:
# 1. Crear una función de registro de cuentas para un cliente
CREATE FUNCTION bank.register()
    RETURNS bool
BEGIN
    DECLARE id INT;
    DECLARE nam VARCHAR(250);
    DECLARE l_name VARCHAR(250);
    DECLARE birth DATE;
    DECLARE gen VARCHAR(1);
    DECLARE act BOOLEAN;

    # INPUT EACH ONE OF THE VARIABLES
    SELECT 'Ingrese el ID del cliente' INTO @id;
    SELECT 'Ingrese el nombre del cliente' INTO @nam;
    SELECT 'Ingrese el apellido del cliente' INTO @l_name;
    SELECT 'Ingrese la fecha de nacimiento del cliente' INTO @birth;
    SELECT 'Ingrese el género del cliente' INTO @gen;
    SELECT 'Ingrese el estado de la cuenta del cliente' INTO @act;

    INSERT INTO bank.customers
    VALUES (id, nam, l_name, birth, gen, act);
    RETURN TRUE;
END;


# 2. Crear una función que permita cerrar una cuenta.
CREATE FUNCTION close_account()
    RETURNS bool
BEGIN
    DECLARE id_ INT;

    # INPUT EACH ONE OF THE VARIABLES
    SELECT 'Ingrese el ID del cliente' INTO @id_;

    UPDATE bank.customers
    SET CUSTOMER_ACTIVE = FALSE
    WHERE CUSTOMER_NUMBER = id_;
    RETURN true;
END;


# 3. Crear una función que permita guardar la información relacionada a una transacción
# bancaria (crédito o débito de saldo)
CREATE FUNCTION new_transaction()
    RETURNS bool
BEGIN
    DECLARE acc_num VARCHAR(12);
    DECLARE transaction_date DATE;
    DECLARE transaction_detail TEXT;
    DECLARE transaction_type VARCHAR(10);
    DECLARE transaction_amount FLOAT;

    # INPUT EACH ONE OF THE VARIABLES
    SELECT 'Ingrese el número de cuenta' INTO @acc_num;
    SELECT 'Ingrese la fecha de la transacción' INTO @transaction_date;
    SELECT 'Ingrese el detalle de la transacción' INTO @transaction_detail;
    SELECT 'Ingrese el tipo de transacción (dep/ret)' INTO @transaction_type;
    SELECT 'Ingrese el monto de la transacción' INTO @transaction_amount;

    IF transaction_type = 'dep' THEN
        SET transaction_amount = transaction_amount;
    ELSEIF transaction_type = 'ret' THEN
        SET transaction_amount = -transaction_amount;
    ELSE
        SET transaction_amount = 0;
    END IF;

    INSERT INTO bank.customers_transactions
    VALUES (acc_num, transaction_date, transaction_detail, transaction_type, transaction_amount);
    RETURN true;
END;

# 4. Crear una función que permita consultar el saldo de un cliente dado un tipo de cuenta y su
# NIP. Debe considerar que cada transacción  del saldo del cliente genera una comisión y no se
# puede permitir esta consulta si el saldo llegase a ser negativo.
CREATE FUNCTION check_balance()
    RETURNS bool
BEGIN
    DECLARE acc_num VARCHAR(12);
    DECLARE nip VARCHAR(4);
    DECLARE balance FLOAT;

    # INPUT EACH ONE OF THE VARIABLES
    SELECT 'Ingrese el número de cuenta' INTO @acc_num;
    SELECT 'Ingrese el NIP de la cuenta' INTO @nip;

    IF nip = (SELECT ACCOUNT_NIP FROM bank.accounts WHERE ACCOUNT_NUMBER = acc_num) THEN
        SET balance =
                (SELECT SUM(TRANSACTION_WITHDRAWAL) FROM bank.customers_transactions WHERE ACCOUNT_NUMBER = acc_num);
        IF balance < 0 THEN
            RETURN false;
        ELSE
            SELECT 'El saldo de la cuenta es: ' INTO @balance;
            RETURN true;
        END IF;
    ELSE
        RETURN false;
    END IF;
END;

# 5. Crear una función que permita a un usuario consultar los movimientos que ha realizado en
# un periodo de tiempo.
CREATE PROCEDURE check_movements()
BEGIN
    DECLARE acc_num VARCHAR(12);
    DECLARE nip VARCHAR(4);
    DECLARE start_date DATE;
    DECLARE end_date DATE;
    DECLARE reg_nip VARCHAR(4);

    # INPUT EACH ONE OF THE VARIABLES
    SELECT 'Ingrese el número de cuenta' INTO @acc_num;
    SELECT 'Ingrese el NIP de la cuenta' INTO @nip;
    SELECT 'Ingrese la fecha de inicio' INTO @start_date;
    SELECT 'Ingrese la fecha de fin' INTO @end_date;

    SELECT ACCOUNT_NIP INTO reg_nip FROM bank.accounts WHERE ACCOUNT_NUMBER = acc_num;

    IF @nip = reg_nip THEN
        SELECT * FROM bank.customers_transactions
        WHERE ACCOUNT_NUMBER = acc_num AND TRANSACTION_DATE BETWEEN start_date AND end_date;
    ELSE
        SELECT 'NIP incorrecto';
    END IF;
END;

# # 6. Crear una función que permita visualizar un ranking de clientes de acuerdo a la cantidad de
# # movimientos y el monto de las operaciones realizadas.
# CREATE FUNCTION check_ranking()
#     RETURNS bool
# BEGIN
#
# END;

# INVOCAR FUNCIONES
SELECT bank.register();
