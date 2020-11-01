-- lab 3.02 -- Not Finished
use sakila;

-- Write a query to display for each store its store ID, city, and country.
select s.store_id as "Store ID", c.city, y.country
from store s
join address a on a.address_id = s.address_id
join city c on c.city_id = a.city_id
join country y on y.country_id =  c.country_id;

-- Write a query to display how much business, in dollars, each store brought in.
select f.store_id as "Store ID", sum(p.amount) as "Revenue"
from payment p
left join staff f on f.staff_id = p.staff_id
group by f.store_id;

-- What is the average running time of films by category?
select cat.name, avg(f.length)
from film f
left join film_category fcat on fcat.film_id = f.film_id
left join category cat on cat.category_id = fcat.category_id
group by cat.name;

-- Which film categories are longest?
select cat.Name, avg(f.length) as "Average Length"
from film f
left join film_category fcat on fcat.film_id = f.film_id
left join category cat on cat.category_id = fcat.category_id
group by cat.name
order by avg(f.length) desc
limit 3;

-- Display the most frequently rented movies in descending order.
select f.Title, count(r.rental_id) as Frequency
from rental r 
join inventory i on i.inventory_id = r.inventory_id
join film f on f.film_id = i.inventory_id
group by f.title
order by Frequency desc;

-- List the top five genres in gross revenue in descending order.
select cat.Name, sum(p.amount) as Revenue
from rental r 
join payment p on p.rental_id = r.rental_id
join inventory i on i.inventory_id = r.inventory_id
join film f on f.film_id = i.inventory_id
left join film_category fcat on fcat.film_id = f.film_id
left join category cat on cat.category_id = fcat.category_id
group by cat.name
order by revenue desc;

-- Is "Academy Dinosaur" available for rent from Store 1?
select f.title, count(r.rental_id), count(i.inventory_id)
from rental r
join staff s on s.staff_id = r.staff_id
left join inventory i on i.inventory_id = r.inventory_id

join (
	select count(inventory_id)
    from 

join film f on f.film_id = i.inventory_id
group by f.title;
-- where f.title = "Academy Dinosaur";

select * from rental
