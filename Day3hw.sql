--1. List all customers who live in Texas (use JOINs)

select *
from customer c
join address a
on c.address_id = a.address_id
where district like 'Texas';

--2. List all payments of more than $7.00 with the customer’s first and last name


select c.first_name, c.last_name, p.amount
from customer c
join payment p 
on c.customer_id = p.customer_id
where p.amount > 7;


--3. Show all customer names who have made over $175 in payments (use subqueries)
select *
from customer
where customer_id in (
	select customer_id 
	from payment p
	group by customer_id 
	having sum(amount) > 175
);

--4. List all customers that live in Argentina (use the city table)
select c.first_name, c.last_name, a.district, ci.city, co.country
from customer c 
join address a 
on c.address_id = a.address_id 
join city ci 
on a.city_id = ci.city_id 
join country co
on ci.country_id = co.country_id 
where country like 'Argentina';


--5. Show all the film categories with their count in descending order

select name, count(*)
from category c 
join film_category fc 
on c.category_id = fc.category_id
group by name
order by count(*) desc;


--6. What film had the most actors in it (show film info)?
select f.title, count(*)
from film f
join film_actor fa 
on f.film_id = fa.film_id 
group by f.film_id 
order by count(*) desc
limit 1;


--7. Which actor has been in the least movies?
select a.first_name, a.last_name, count(*)
from actor a 
join film_actor fa 
on a.actor_id = fa.actor_id
group by a.actor_id
order by count(*)
limit 1;

--8. Which country has the most cities?
select co.country_id, co.country, count(*) 
from city ci
join country co
on ci.country_id = co.country_id
group by co.country_id
order by count(*) desc;


--9. List the actors who have been in between 20 and 25 films.
select a.first_name, a.last_name, count(*)
from actor a
join film_actor fa 
on fa.actor_id = a.actor_id 
group by a.actor_id
having count(*) between 20 and 25;