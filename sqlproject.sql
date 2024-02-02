-- SQL Project DataRockies

Database chinook.db
  
country,
COUNT(*)
FROM  customers
where country <> 'Brazil'
GROUP by  country
HAVING count(*) >= 5
order by count(*) DESC
limit 2 ;

claen

SELECT
firstname,
company,
coalesce (company, "No Information")
from customers;

- [x]  **Sprint 02 - SQL for Data Analyst 102**

clean data

SELECT
firstname,
company,
coalesce (company, "No Information") as clean_company,
case
when company is NULL then 'B2C'
else 'B2B'
end as segment
from customers;

join

JOIN TABLES

SELECT
ar.artistid,
[ar.name](http://ar.name/) AS artist_name,
al.title,
[ge.name](http://ge.name/) AS genre_name,
tr.*
FROM artists AS ar
JOIN albums  AS al
ON ar.artistid = al.artistid
JOIN tracks  AS tr
ON al.albumid = tr.albumid
JOIN genres  AS ge
ON tr.genreid = ge.genreid

ต้องสร้าง VIEW ให้เป็น จำลอง database

- - subquery inner + outer
SELECT
sub1.firstname,
sub2.total
FROM (SELECT * FROM customers
WHERE country = 'USA') AS sub1
JOIN (SELECT * FROM invoices
WHERE STRFTIME("%Y", invoicedate) = "2009") AS sub2
ON sub1.customerid = sub2.customerid;

- - common table expression => WITH
WITH sub1 AS (
SELECT * FROM customers
WHERE country = 'USA'
), sub2 AS (
SELECT * FROM invoices
WHERE STRFTIME("%Y", invoicedate) = "2009"
)

SELECT
sub1.firstname,
sub2.total
FROM sub1
JOIN sub2
ON sub1.customerid = sub2.customerid;

- - temp sub table
WITH sub1 AS (), sub2 AS ()
SELECT sub1 JOIN sub2 ON [sub1.pk](http://sub1.pk/) = [sub2.fk](http://sub2.fk/);
- - create views
CREATE VIEW usa_customers AS
SELECT * FROM customers
WHERE country = 'USA';

CREATE VIEW invoice_2009 AS
SELECT * FROM invoices
WHERE STRFTIME("%Y", invoicedate) = "2009";

SELECT * FROM usa_customers a
JOIN invoice_2009 b
ON a.customerid = b.customerid;

SELECT
invoicedate,
-- string format (date) time
STRFTIME("%Y", invoicedate) AS year,
STRFTIME("%m", invoicedate) AS month,
STRFTIME("%d", invoicedate) AS day,
billingaddress
FROM invoices

SELECT
invoicedate,
-- CAST string format (date) time
CAST(STRFTIME("%Y", invoicedate) AS int) year,
cast(STRFTIME("%m", invoicedate) AS int) month,
cast(STRFTIME("%d", invoicedate) AS int) day,
billingaddress
FROM invoices
where year = 2010 and month  IN (1,5,9);

SELECT
invoicedate,
STRFTIME("%Y - %m", invoicedate) AS monthid,
billingaddress
FROM invoices
WHERE monthid = "2010 - 08"

- - aggregate function
SELECT
COUNT(*) AS n_tracks,
ROUND (AVG(bytes), 2) AS avg_bytes,
SUM(bytes) AS sum_bytes,
MIN(bytes) AS min_bytes,
MAX(bytes) AS max_bytes
From tracks;
- - aggregate function
SELECT
count(*) As total_n,
count(company) as B2B,
Count(*) - count(company) as B2C
from customers;
- 
- - aggregate function
SELECT
country,
count(*) AS customers
from customers
GROUP by country
-- having filter group
HAVING (country like "B%" or country LIKE "C%") and customers >= 5;
- 
- - aggregate function
SELECT
country,
count(*) AS customers
from customers
GROUP by country
-- having filter group
HAVING customers >= 5
ORDER by customers desc;

SELECT *
FROM customers
where company is  not null;

- - case when then else end
SELECT
firstname,
company,
COALESCE(company, "No information") AS Claen_company,
CASE
when company is NULL then 'B2C'
ELSE 'B2B'
end as segment
FROM customers;
- 
- - join table
SELECT
[ar.name](http://ar.name/), al.title
FROM artists as ar
JOIN albums as al
on ar.artistid = al.artistid
- 
- - join table
SELECT
ar.artistid,
[ar.name](http://ar.name/),
al.title,
[tr.name](http://tr.name/),
tr.composer
FROM artists as ar
JOIN albums as al
on ar.artistid = al.artistid
join tracks as tr
on al.artistid = tr.albumid
- 
- - subquery
SELECT * FROM (
SELECT firstname, country from (
SELECT * from customers
)
)
where country = 'Belgium' ;
- -subquery inner + outer
SELECT
sub1.firstname,
sub2.total
from (select * from customers
WHERE country = 'USA') as sub1
join (select * FROM invoices
WHERE STRFTIME("%Y" , invoicedate) = "2009") AS sub2
on sub1.customerid = sub2.customerid;
- 
- -with (common table expression)
with sub1 as (
select * from customers
WHERE country = 'USA'
),	sub2 as ( select * FROM invoices
WHERE STRFTIME("%Y" , invoicedate) = "2009"
)

SELECT
sub1.lastname,
sub2.total
from sub1
JOIN sub2
on  sub1.customerid = sub2.customerid;
