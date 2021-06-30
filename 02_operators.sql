# Comment 
-- Comment
/* comment */


SELECT 1=0;

SELECT '0'=0;

SELECT '0.0'=0;

SELECT '0.01'=0;

SELECT '.01'=0.01;

SELECT 'A','B','C';

SELECT 1=1, NULL=NULL , 1=NULL;

#Null Safe equal to operator
SELECT 1<=>1, NULL<=>NULL, 1<=>NULL;

SELECT 0.1 <= 2;

SELECT 2 > 2;

SELECT 1 IS TRUE, 0 IS FALSE, NULL IS UNKNOWN;

SELECT 1 IS NOT UNKNOWN, 0 IS NOT UNKNOWN, NULL IS NOT UNKNOWN;

SELECT 1 IS NULL, 0 IS NULL, NULL IS NULL;

SELECT 'b' BETWEEN 'a' AND 'c';

SELECT 'b' BETWEEN 'c' AND 'a';

SELECT 2 BETWEEN 1 AND 3, 2 BETWEEN 3 and 1;

SELECT GREATEST(2,0,454,233,1);

SELECT GREATEST('B','Z','C');

SELECT LEAST(2,0);

SELECT 2 IN (0,3,5,7);

SELECT 'jill' IN ('jill','jim','harry');

SELECT ISNULL(1+1);

SELECT ISNULL(1/0);

#Picks for not null value
SELECT COALESCE(NULL,1000);

SELECT COALESCE(NULL,NULL,NULL);

SELECT COALESCE(NULL,NULL,3.14,33,NULL,1000);

/*
	T and T = T
	T and F = F
    F and T = F
    F and F = F
*/

SELECT 1 AND 1;

SELECT 1 AND 0;

SELECT 1 OR 0;

SELECT 1 OR 1;

SELECT 0 OR 0;

SELECT NOT 0;

SELECT 0 OR 0;

SELECT 1 XOR 0;

SELECT 0 XOR 1;

SELECT 1 XOR 1;


SELECT LENGTH('dearworld');

SELECT LEFT('dearworld',4);

SELECT RIGHT('dearworld',5);

SELECT SUBSTR('dearworld',3,4);

SELECT SUBSTRING_INDEX("www.google.com", ".", 1);

SELECT SUBSTRING_INDEX("www.google.com", ".", 2);

SELECT LCASE('DEARWORLD');
SELECT UCASE('dearworld');

SELECT POSITION('wor' IN 'dearworld');

SELECT  UCASE(LEFT('dearworld',POSITION('wor' IN 'dearworld')));

#position('wor' in 'dearworld') = 5
# left('dearworld',5) = dearw
# ucase('dearw') = DEARW


SELECT LTRIM('       dearworld       ');
SELECT RTRIM('       dearworld       ');
SELECT TRIM('       dearworld       ');

SELECT  SPACE(20);

## Compare and returns 0,1,-1
## string1 = string2, this function returns 0
## string1 < string2, this function returns -1
## string1 > string2, this function returns 1

SELECT STRCMP('ezee','ezlephant');
SELECT STRCMP('dearworld','DEARWORLD');

SELECT REVERSE('dearworld');

SELECT CONCAT('dear','-','world','hello');

SELECT CONCAT_WS(' - ','dear','world','hello','good','smart');

SELECT REPLACE('dearworld','dear','hello');

#########

SELECT ABS(-1);

#Largest value before given value
SELECT FLOOR(30.25);

#Smallest value after given value
SELECT CEIL(30.25);

SELECT FLOOR(0.25);

SELECT MOD(5,2);

SELECT SIGN(4);
SELECT SIGN(-4);

SELECT ROUND(30.25);
SELECT ROUND(30.75);
SELECT ROUND(30.50);
SELECT ROUND(30.499);

SELECT TRUNCATE(345.156, 0),TRUNCATE(345.156, 1),TRUNCATE(345.156, 2);

### DATE Functions 

SELECT CURDATE();
SELECT CURRENT_DATE();
SELECT CURRENT_TIME();
SELECT CURRENT_TIMESTAMP();
SELECT DATE_FORMAT(CURRENT_TIMESTAMP(),"%Y-%m-%d %H:%i:%j");

#%d %D %m %M %Y,%y
#%H,%h,%i, %p

SELECT UTC_DATE();
SELECT UTC_TIME();
SELECT UTC_TIMESTAMP();

