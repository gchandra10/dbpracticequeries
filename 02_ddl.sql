#########

#simple table

create table account(
    accountID   int
    ,ownerName  varchar(255)
    ,joinDate   date
    ,balance    decimal(10,2)
    ,active     boolean
);

#########

# adding Primary Key

create table accountA(
    accountID   int primary key
    ,ownerName  varchar(255)
    ,joinDate   date
    ,balance    decimal(10,2)
    ,active     boolean
);

#########

#adding Unique Key

create table accountB(
    accountID   int unique key
    ,ownerName  varchar(255)
    ,joinDate   date
    ,balance    decimal(10,2)
    ,active     boolean
);

#########

# auto increment

create table accountC(
    accountID   int auto_increment primary key
    ,ownerName  varchar(255)
    ,joinDate   date
    ,balance    decimal(10,2)
    ,active     boolean
);

############

# adding TEXT and NULL / NOT NULL

create table accountD(
    id          int auto_increment primary key
    ,accountID  int             NOT NULL
    ,ownerName  varchar(255)    NOT NULL
    ,joinDate   date            NOT NULL
    ,balance    decimal(10,2)   NULL
    ,active     boolean         NOT NULL
    ,comments   text            
);


##########

#if not exists

create table if not exists accountF(
    id          int auto_increment primary key
    ,accountID  int             NOT NULL
    ,ownerName  varchar(255)    NOT NULL
    ,joinDate   date            NOT NULL
    ,balance    decimal(10,2)   NULL
    ,active     boolean         NOT NULL
    ,comments   text            
);


#########

# TEMPORARY table

create temporary table accountG(
    id          int auto_increment primary key
    ,accountID  int             NOT NULL
    ,ownerName  varchar(255)    NOT NULL
    ,joinDate   date            NOT NULL
    ,balance    decimal(10,2)   NULL
    ,active     boolean         NOT NULL
    ,comments   text            
);

# create table like

create table accountF1 like accountF;

describe accountF;
describe accountF1;

# create table with data

create table accountF2 as select * from Chinook.Customer;

describe accountF2;

select * from accountF2;

#Alter Table

#Add a new column Email in the End

Alter Table accountF  Add Email VARCHAR(100);

#Add column Status after Balance column

Alter Table accountF Add Status CHAR(1) AFTER Balance;

#Add column asOfDate as First column

Alter Table accountF Add asOfDate date FIRST;


#Change the data type of column Status

Alter Table accountF Modify Status Boolean;


#Change the column name Status to AccountStatus

Alter Table accountF Change Column Status AccountStatus Boolean;


#Remove / delete column AccountStatus

Alter Table accountF Drop Column  AccountStatus;

#Rename table name

Alter Table accountF Rename To accountZ


#Drop the table

drop table accountZ;


