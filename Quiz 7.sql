-- 1)
select count(*)
from payment;

select *
from payment
where amount >= 9.99;
--finds payments that equal $9.99

-- 2)
select MAX(amount)
from payment;
-- 11.99 Maximum 

select title
from rental r 
left join payment p
on r.rental_id = p.rental_id
left join inventory i
on r.inventory_id = i.inventory_id
left join film f 
on i.film_id = f.film_id
where amount = 11.99;
-- Finds film based on price and finds the title. 

-- 3)
select first_name, last_name, email, address, city, country
from staff s 
left join address a
on s.address_id = a.address_id
left join city c
on a.city_id = c.city_id
left join country c2
on c.country_id = c2.country_id
-- joins all the categories listed without the id's

-- 4)
-- My main goal is to become a project manager over different things in a IT company. But now I want to work in coding and databases to learn and know things that I'll be managing.

-- 5)
-- Customer has a many relation symbol to customer to represent different payments, but Customer has optional relation to Payments because a customer can sign up but not make a payment yet. 