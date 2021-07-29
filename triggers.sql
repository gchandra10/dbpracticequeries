# Example 1

drop table if exists people;

CREATE TABLE people (age INT, name varchar(150), status varchar(100));

truncate table people;

drop trigger trg_agecheck_bi;
CREATE TRIGGER trg_agecheck_bi BEFORE INSERT ON people FOR EACH ROW 
IF NEW.age < 0 THEN 
	SET NEW.age = 0;
    SET NEW.status = 'Unknown';
ELSEIF NEW.age > 18 THEN
    SET New.status = 'Can Vote';
ELSE
    SET New.status = 'Cannot Vote';
END IF;

INSERT INTO people VALUES (-27, 'Rachael',NULL), (30, 'Ross',NULL), (12, 'Monica',NULL);

select * from people;


DROP TRIGGER trg_agecheck_bu;

CREATE TRIGGER trg_agecheck_bu BEFORE UPDATE ON people FOR EACH ROW 

IF NEW.age > OLD.age THEN 
    SET NEW.age = NEW.age;
ELSE
    SET NEW.age = OLD.age;
    SET New.Status = Old.Status;
END IF;

UPDATE people set age = 35 where name = 'Ross';

UPDATE people set age = 18,status='Can Vote' where name = 'Rachael';

UPDATE people set age = 11,status='Can Vote' where name = 'Monica';


## Example 2

DROP TABLE IF EXISTS online_user;

CREATE TABLE online_user (
  online_user_id int(11) NOT NULL auto_increment,
  login VARCHAR(64), 
  ipv4 INT UNSIGNED NOT NULL,
  ts TIMESTAMP,
  PRIMARY KEY  (online_user_id)
);

DROP TABLE IF EXISTS logs;

CREATE TABLE logs (
  logs_id int(11) NOT NULL auto_increment,
  ts TIMESTAMP,
  message VARCHAR(255) ,
  PRIMARY KEY  (logs_id)
);

DROP TRIGGER IF EXISTS online_user_ai;

CREATE TRIGGER online_user_ai AFTER INSERT ON online_user
FOR EACH ROW
BEGIN
  INSERT INTO logs (message) VALUES (CONCAT('User ',NEW.login, ' has logged in from ', INET_NTOA(NEW.ipv4)));
END


DROP TRIGGER IF EXISTS online_user_ad;

CREATE TRIGGER online_user_ad AFTER DELETE ON online_user
FOR EACH ROW
BEGIN
  INSERT INTO logs (message) VALUES (CONCAT('User ',OLD.login, ' has logged out'));
END

INSERT INTO online_user (login, ipv4) VALUES ('Ross', 121);
INSERT INTO online_user (login, ipv4) VALUES ('Monica', 121321312);
INSERT INTO online_user (login, ipv4) VALUES ('Rachel', 123444);

select * from online_user i

select * from logs;

DELETE FROM online_user WHERE login = 'Ross';

