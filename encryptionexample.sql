drop table users_salt;

CREATE TABLE users_salt ( id INT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'UNSIGNED means cannot take negative values'
    ,first_name VARCHAR(50) NOT NULL 
    ,last_name VARCHAR(50) NOT NULL 
    ,email VARCHAR(255) DEFAULT 'noname@noname.com' NOT NULL 
    ,full_name VARCHAR(150) AS (concat(first_name, last_name))  COMMENT 'This is a Generated Column and its VIRTUAL column and doesnt take up space'
    ,pwd BLOB COMMENT 'Datatype BLOB is important'
    ,PRIMARY KEY (id)  COMMENT 'Creating PRIMARY KEY as separate line item'
    ,UNIQUE KEY email (email) COMMENT 'Creating UNIQUE KEY as separate line item'
);

INSERT INTO users_salt (first_name, last_name, email, pwd) VALUES ('Rachael','Green','user1@example.com', AES_ENCRYPT('S3cretP@ssw0rd', 'somesecretsalt'));

select * from users_salt;

SELECT *,AES_DECRYPT(pwd,'somesecretsalt') FROM users_salt;
SELECT *,CAST(AES_DECRYPT(pwd, 'somesecretsalt') as CHAR) from users_salt;

INSERT INTO users_salt (first_name, last_name, email, pwd) VALUES ('Rachael','Green','user5@example.com', AES_ENCRYPT('S3cretP@ssw0rd', first_name));

INSERT INTO users_salt (first_name, last_name, email, pwd) VALUES ('Monica','Geller','user6@example.com', AES_ENCRYPT('S3cretP@ssw0rd', first_name));

INSERT INTO users_salt (first_name, last_name, email, pwd) VALUES ('Ross','Geller','user7@example.com', AES_ENCRYPT('S3cretP@ssw0rd', first_name));


