--1) Finds last names that start with T and orders the first names.
select *
from actor
where last_name LIKE 'T%'
order by first_name;

--2) Gets rental and finds between the set dates. 
select*
from rental
where cast (return_date as date) BETWEEN '5/28/2005' and '6/1/2005';

--3) Creates a column named films rented and gets the title from joins, then orders and limits them by 10.
select title, count(*) as films_rented
from rental r
left join inventory i
on r.inventory_id = i.inventory_id
left join film f
on i.film_id = f.film_id
group by title
order by films_rented desc
limit 10;

--4) Joins the customer and payment, then finds the amount each person paid. 
select first_name, sum(amount) as amount_spent
from payment p
left join customer c
on p.customer_id = c.customer_id
group by first_name
order by amount_spent asc;

--5) Joins actor, film, then finds which actor has done the most, which was Gina. 
select first_name,last_name, count(*)/1000 as total_acted
from actor a 
left join film_actor fa
on a.actor_id = fa.actor_id
left join film f
on fa.film_id = fa.film_id
where release_year = 2006
group by a.actor_id
order by total_acted desc
limit 5;

--6) Sorts first name and p.amount, then outputs a joined version where the data is summed in order. 
explain
select first_name, sum(amount) as amount_spent
from payment p
left join customer c
on p.customer_id = c.customer_id
group by first_name
order by amount_spent asc;

--Joins actor and film with each condition, then filters andshows the output based on the year of 2006.
explain
select first_name,last_name, count(*)/1000 as total_acted
from actor a 
left join film_actor fa
on a.actor_id = fa.actor_id
left join film f
on fa.film_id = fa.film_id
where release_year = 2006
group by a.actor_id
order by total_acted desc
limit 5;

--7)
select c.name, avg(rental_rate) as avg_rate
from category c
left join film_category fc
on c.category_id = fc.category_id
left join film f
on fc.film_id = f.film_id
group by c.category_id
order by avg_rate desc;

--8) Joins by the category, inventory, and rental, then groups by category and orders by number rented. 
select c.name, count(rental_id) as times_rented
from category c
left join film_category f
on c.category_id = f.category_id
left join inventory i
on f.film_id = i.film_id
left join rental r 
on i.inventory_id = r.inventory_id
group by c.category_id
order by times_rented desc
limit 5;



