drop table users;

CREATE TABLE users  (
    id INT UNSIGNED     NOT NULL  AUTO_INCREMENT  COMMENT 'UNSIGNED means cannot take negative values'
    ,first_name VARCHAR(50) NOT NULL
    ,last_name VARCHAR(50)  NOT NULL
    ,email VARCHAR(255) DEFAULT 'noname@noname.com' NOT NULL
    ,full_name VARCHAR(150) AS (concat(first_name, ' ', last_name)) COMMENT 'This is a Generated Column and its VIRTUAL column and doesnt take up space'
    ,pwd VARCHAR(255) DEFAULT NULL COMMENT 'This is default NULL'
    ,PRIMARY KEY (id)  COMMENT 'Creating PRIMARY KEY as separate line item'    
    ,UNIQUE KEY email (email) COMMENT 'Creating UNIQUE KEY as separate line item'
);

INSERT INTO users (first_name, last_name, email, pwd) VALUES ('Rachael','Green','user1@example.com', MD5('pass123'));

INSERT INTO users (first_name, last_name, pwd) VALUES ('Cosmo','Kramer', SHA1('pass123'));

INSERT INTO users (first_name, last_name, email, pwd) VALUES ('Sheldon','Cooper', 'bazinga@cooper.com', SHA2('pass123',512));

select * from users;

describe users;

