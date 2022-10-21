DROP TABLE IF EXISTS offices;
CREATE TABLE offices (
  OFFICECODE varchar(50) NOT NULL default '',
  CITY varchar(50) NOT NULL default '',
  PHONE varchar(50) NOT NULL default '',
  ADDRESSLINE1 varchar(50) NOT NULL default '',
  ADDRESSLINE2 varchar(50) default NULL,
  STATE varchar(50) default NULL,
  COUNTRY varchar(50) NOT NULL default '',
  POSTALCODE varchar(10) NOT NULL default '',
  TERRITORY varchar(10) NOT NULL default '',
  PRIMARY KEY(OFFICECODE)
);


DROP TABLE IF EXISTS employees;
CREATE TABLE employees (
  EMPLOYEENUMBER bigint NOT NULL default '0',
  LASTNAME varchar(50) NOT NULL default '',
  FIRSTNAME varchar(50) NOT NULL default '',
  EXTENSION varchar(10) NOT NULL default '',
  EMAIL varchar(100) NOT NULL default '',
  OFFICECODE varchar(20) NOT NULL default '',
  REPORTSTO bigint default NULL,
  JOBTITLE varchar(50) NOT NULL default '',
  PRIMARY KEY(EMPLOYEENUMBER)
) ;

DROP TABLE IF EXISTS customers;
CREATE TABLE customers (
  CUSTOMERNUMBER bigint NOT NULL default '0',
  CUSTOMERNAME varchar(50) NOT NULL default '',
  CONTACTLASTNAME varchar(50) NOT NULL default '',
  CONTACTFIRSTNAME varchar(50) NOT NULL default '',
  PHONE varchar(50) NOT NULL default '',
  ADDRESSLINE1 varchar(50) NOT NULL default '',
  ADDRESSLINE2 varchar(50) default NULL,
  CITY varchar(50) NOT NULL default '',
  STATE varchar(50) default NULL,
  POSTALCODE varchar(15) default NULL,
  COUNTRY varchar(50) NOT NULL default '',
  SALESREPEMPLOYEENUMBER bigint default NULL,
  CREDITLIMIT decimal(17,0) default NULL,
  PRIMARY KEY(CUSTOMERNUMBER)
);

DROP TABLE IF EXISTS orders;
CREATE TABLE orders (
  ORDERNUMBER bigint NOT NULL default '0',
  ORDERDATE timestamp NOT NULL default CURRENT_TIMESTAMP,
  REQUIREDDATE timestamp NOT NULL default '0001-01-01 00:00:00',
  SHIPPEDDATE timestamp NOT NULL default '0001-01-01 00:00:00',
  STATUS varchar(15) NOT NULL default '',
  COMMENTS text,
  CUSTOMERNUMBER bigint NOT NULL default '0',
  PRIMARY KEY(ORDERNUMBER)
);

DROP TABLE IF EXISTS orderdetails;
CREATE TABLE orderdetails (
  ORDERNUMBER bigint NOT NULL default '0',
  PRODUCTCODE varchar(50) NOT NULL default '',
  QUANTITYORDERED bigint NOT NULL default '0',
  PRICEEACH decimal(17,0) NOT NULL default '0',
  ORDERLINENUMBER smallint NOT NULL default '0',
  PRIMARY KEY(ORDERNUMBER,PRODUCTCODE)
);


DROP TABLE IF EXISTS products;
CREATE TABLE products (
  PRODUCTCODE varchar(50) NOT NULL default '',
  PRODUCTNAME varchar(70) NOT NULL default '',
  PRODUCTLINE varchar(50) NOT NULL default '',
  PRODUCTSCALE varchar(10) NOT NULL default '',
  PRODUCTVENDOR varchar(50) NOT NULL default '',
  PRODUCTDESCRIPTION text NOT NULL,
  QUANTITYINSTOCK smallint NOT NULL default '0',
  BUYPRICE decimal(17,0) NOT NULL default '0',
  MSRP decimal(17,0) NOT NULL default '0',
  PRIMARY KEY(PRODUCTCODE)
);

