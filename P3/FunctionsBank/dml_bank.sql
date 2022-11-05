USE BANK;

INSERT INTO BANK.customers
VALUES (1, 'John', 'Smith', '01-01-2003', 'M', true),
       (2, 'Jane', 'Doe', '01-01-2003', 'F', true),
       (3, 'John', 'Doe', '01-01-2003', 'M', true),
       (4, 'Jane', 'Smith', '01-01-2003', 'F', true),
       (5, 'John', 'Smith', '01-01-2003', 'M', true);


INSERT INTO BANK.customers_transactions
VALUES ('1', '1970-01-01 00:00:01', 'Deposit', 0, 1000),
       ('3', '1970-01-01 00:00:03', 'Deposit', 0, 1000),
       ('5', '1970-01-01 00:00:05', 'Deposit', 0, 1000),
       ('2', '1970-01-01 00:00:07', 'Withdrawal', 1000, 0),
       ('4', '1970-01-01 00:00:09', 'Withdrawal', 1000, 0);


INSERT INTO BANK.address_customers
VALUES (1, 'Street', 1, 2, 24, 'City', 'Country', true),
         (2, 'Street', 1, 2, 24, 'City', 'Country', true),
         (3, 'Street', 1, 2, 24, 'City', 'Country', true),
         (4, 'Street', 1, 2, 24, 'City', 'Country', true),
         (5, 'Street', 1, 2, 24, 'City', 'Country', true);

INSERT INTO BANK.accounts
VALUES(1, '023', 'Deps', '0000', true),
         (2, '024', 'Deps', '1234', true),
         (3, '025', 'Che', '0987', true),
         (4, '026', 'Deps', '5432', true),
         (5, '027', 'Che', '6789', true);