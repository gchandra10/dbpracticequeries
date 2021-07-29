drop table if exists studentinfo;

create table studentinfo(
    studentID char(4)
    ,name varchar(20)
    ,semester varchar(20)
    ,gpa decimal(5,2)
);

insert into studentinfo values
('s001','Rachel','2018-1',3.3)
,('s001','Rachel','2018-2',3.6)
,('s001','Rachel','2019-1',3.7)
,('s001','Rachel','2019-2',3.6)
,('s001','Rachel','2020-1',3.4)

,('s002','Monica','2018-1',3.3)
,('s002','Monica','2018-2',3.7)
,('s002','Monica','2019-1',3.6)
,('s002','Monica','2019-2',3.5)
,('s002','Monica','2020-1',3.8)

,('s003','Phoebe','2018-1',3.5)
,('s003','Phoebe','2018-2',3.6)
,('s003','Phoebe','2019-1',3.5)
,('s003','Phoebe','2019-2',3.6)
,('s003','Phoebe','2020-1',3.5)

,('s004','Joey','2018-1',3.3)
,('s004','Joey','2018-2',3.2)
,('s004','Joey','2019-1',3.4)
,('s004','Joey','2019-2',3.2)
,('s004','Joey','2020-1',3.1);


select * from studentinfo s 


select 
    *
    ,rank() over(order by gpa desc) as studentRank
from 
    studentinfo;

select 
    *
    ,dense_rank() over(order by gpa desc) as studentRank
from 
    studentinfo;


select 
    *
    ,row_number() over(order by gpa desc) 
from 
    studentinfo;

   
select 
    *
    ,dense_rank() over(partition by semester order by gpa desc) as studentRank
from 
    studentinfo;
   
select 
    *
    ,dense_rank() over(partition by name order by gpa desc) as studentRank
from 
    studentinfo;
   

select 
    *
    ,rank() over(partition by semester order by gpa desc) as studentRank
from 
    studentinfo;

   
   
select 
    *
    ,percent_rank() over(partition by semester order by gpa) * 100 as studentRank
from 
    studentinfo;
   
   
SELECT 
	name
	,avg(gpa) as avg_gpa
from
   studentinfo 
group by
   name;   
  
  


SELECT 
    name
    ,semester
    ,gpa
    ,avg(gpa) over(partition by name) as overallGPA
    ,sum(gpa) over(partition by name) as totalGPA
    ,count(gpa) over(partition by name) as countGPA
from
    studentinfo

SELECT 
	name
    ,semester
    ,gpa
    ,overallgpa
    ,totalgpa/countgpa
from
(
SELECT 
    name
    ,semester
    ,gpa
    ,avg(gpa) over(partition by name) as overallGPA
    ,sum(gpa) over(partition by name) as totalGPA
    ,count(gpa) over(partition by name) as countGPA
from
    studentinfo
 ) t

	

select * from studentinfo s 
 
select 
    studentID
    ,name
    ,semester
    ,gpa
    ,lead(gpa,1,gpa) over(partition by name order by semester) nextSemGpa
    ,(lead(gpa,1,gpa) over(partition by name order by semester)) - gpa as delta
from 
    studentinfo;
   
select 
    studentID
    ,name
    ,semester
    ,gpa
    ,lag(gpa,1,gpa) over(partition by name order by semester) nextSemGpa
    ##,(lag(gpa,1,gpa) over(partition by name order by semester)) - gpa as delta
from 
    studentinfo


select 
    studentID
    ,name
    ,semester
    ,gpa
    ,lead(gpa,2) over(partition by name order by semester) nextSemGpa
from 
    studentinfo;





   



