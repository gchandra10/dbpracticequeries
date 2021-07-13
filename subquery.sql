use Chinook;

select * from Artist;

select * from Album order by title; 

select * from Album where title = 'Big Ones';
select * from Artist where ArtistId = 3;

select * from Artist where ArtistId = (select ArtistId from Album where title = 'Big Ones');

select * from Track;

select * from Album where title = 'Carnaval 2001';

select * from Track where AlbumId  = (select Albumid from Album where title = 'Carnaval 2001');

select * from Genre g ;

##Track, Genre

select * from Genre where Name = 'Jazz';

select * from Track where GenreId = (select GenreId from Genre where Name = 'Jazz');

use sakila;

select * from actor ;
select * from film;
select * from film_actor;

##Academy Dinosaur

select film_id from film where title = 'Academy Dinosaur';

select actor_id from film_actor where film_id  = 1;

select * from actor where actor_id in (1,10,20,30,40,53);


select first_name , last_name  from actor where actor_id in (
	select actor_id from film_actor where film_id  = (
		select film_id from film where title = 'Academy Dinosaur') );
	

select * from film where film_id  in (
	select film_id from film_actor  where actor_id = (	
		select actor_id from actor where first_name = 'Mary' and last_name = 'Keitel') );


	
## derived table

select left(title,10),rating from ( 

	select film_id,title,rating from film where film_id  in (
		select film_id from film_actor fa  where actor_id = (	
			select actor_id from actor where first_name = 'JOHNNY' and last_name = 'CAGE') )
			
) z;


select c.active ,c.email, c.first_name  from customer c;


select * from (
	select 
		vendor_id 
		,count(invoice_total) as 'total_number_of_invoices'
		,sum(invoice_total) as 'sum_of_total'
	FROM 
		murach.invoices i 
	group by
		vendor_id 
	HAVING 
		sum(invoice_total) >= 20000
) t
order by 
	sum_of_total desc;



create view chandr34.vw_minvoice as
	select 
		vendor_id 
		,count(invoice_total) as 'total_number_of_invoices'
		,sum(invoice_total) as 'sum_of_total'
	FROM 
		murach.invoices i 
	group by
		vendor_id 
	HAVING 
		sum(invoice_total) >= 20000;


alter view chandr34.vw_minvoice as
	select 
		vendor_id 
		,count(invoice_total) as 'total_number_of_invoices'
		,sum(invoice_total) as 'sum_of_total'
	FROM 
		murach.invoices i 
	group by
		vendor_id 
	HAVING 
		sum(invoice_total) >= 1000;
	
	
select * from chandr34.vw_minvoice order by sum_of_total desc;
	
select * from chandr34.vw_minvoice;


