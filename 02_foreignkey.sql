
drop table if exists customer;

Create Table if not exists customer (   
    customerID      INT PRIMARY KEY
    ,customerName   VARCHAR(20) NOT NULL 
    ,address1       VARCHAR(20) NOT NULL
    ,address2       VARCHAR(20) NULL
    ,zipCode        CHAR(5)     NULL
);

drop table if exists customerOrder;

create table if not exists customerOrder (
    customerID      INT
    ,orderID        INT
    ,orderDate      DATE        NOT NULL
    ,orderQuantity  INT         NOT NULL
    ,orderStatus    CHAR(10)    NOT NULL
    ,PRIMARY KEY (customerID, orderID)
    
);

describe customerOrder;

drop table if exists customerOrder;

create table if not exists customerOrder (
    customerID      INT
    ,orderID        INT
    ,orderDate      DATE        NOT NULL
    ,orderQuantity  INT         NOT NULL
    ,orderStatus    CHAR(10)    NOT NULL
    ,Foreign Key(customerID) References customer(customerID)
);


##One to Many
drop table if exists customerOrderO2M;

create table if not exists customerOrderO2M (
    customerID      INT
    ,orderID        INT
    ,orderDate      DATE        NOT NULL
    ,orderQuantity  INT         NOT NULL
    ,orderStatus    CHAR(10)    NOT NULL
    ,PRIMARY KEY (customerID, orderID)
    ,Foreign Key(customerID) References customer(customerID)
);

describe customerOrder;

#One to one
create table if not exists customerOrder (
    customerID      INT
    ,orderID        INT
    ,orderDate      DATE        NOT NULL
    ,orderQuantity  INT         NOT NULL
    ,orderStatus    CHAR(10)    NOT NULL
    ,PRIMARY KEY (customerID)
    ,Foreign Key(customerID) References customer(customerID)
);


drop table if exists customerOrderNiceName;

create table if not exists customerOrderNiceName (
    customerID      INT
    ,orderID        INT
    ,orderDate      DATE        NOT NULL
    ,orderQuantity  INT         NOT NULL
    ,orderStatus    CHAR(10)    NOT NULL
    ,PRIMARY KEY (customerID, orderID)
    ,Constraint fk_customer_customerOrder Foreign Key(customerID) References customer(customerID)
);


SELECT 
    TABLE_NAME
    ,COLUMN_NAME
    ,CONSTRAINT_NAME
    ,REFERENCED_TABLE_NAME
    ,REFERENCED_COLUMN_NAME
FROM
    INFORMATION_SCHEMA.KEY_COLUMN_USAGE
WHERE
    TABLE_NAME = 'customerOrder';

   
SELECT 
    TABLE_NAME
    ,COLUMN_NAME
    ,CONSTRAINT_NAME
    ,REFERENCED_TABLE_NAME
    ,REFERENCED_COLUMN_NAME
FROM
    INFORMATION_SCHEMA.KEY_COLUMN_USAGE
 WHERE
 	CONSTRAINT_NAME like 'fk_customer%';


 


