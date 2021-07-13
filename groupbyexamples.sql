##select * from murach.invoices where vendor_id = 122;
##select * from murach.invoices having vendor_id = 122;


select 
	invoice_date as 'invoice date'
	,sum(invoice_total) as 'total invoice'
from
	murach.invoices
group by
	invoice_date
order by 2 desc;

select 
	vendor_id 
	,count(invoice_total) as 'total number of invoices'
	,sum(invoice_total) as 'sum of total'
FROM 
	murach.invoices i 
group by
	vendor_id 
order by 2 desc;


##Having


select 
	vendor_id 
	,count(invoice_total) as 'total number of invoices'
	,sum(invoice_total) as 'sum of total'
FROM 
	murach.invoices i 
group by
	vendor_id 
HAVING 
	sum(invoice_total) >= 20000
order by 
	3 desc;


select 
	vendor_id 
	,count(invoice_total) as 'total number of invoices'
	,sum(invoice_total) as 'sum of total'
FROM 
	murach.invoices i 
group by
	vendor_id 
having
	sum(invoice_total) > 20000
order by 
	3 desc;

## select * from murach.invoices having vendor_id = 122;


SELECT 
    count(*)
    ,ArtistId
FROM 
    Chinook.Album
WHERE 
    Title Like 'A%' 
GROUP By 
    ArtistId
HAVING 
    ArtistId > 3 
ORDER BY 
    ArtistId;

   


