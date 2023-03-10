use sakila;
#1 Write a query to display for each store its store ID, city, and country.
select store.store_id, city.city, country.country
from store
join address using (address_id)
join city using (city_id)
join country using (country_id);
select * from film;
#2 Write a query to display how much business, in dollars, each store brought in.

select store.store_id, sum(payment.amount)
from store
join staff using (store_id) 
join payment using (staff_id)
group by payment.staff_id;

#3 What is the average running time(length) of films by category?
select * from film;
select category.name, avg(film.length) as runningtime
from category
join film_category using (category_id)
join film using (film_id)
group by category.name;

#4 Which film categories are longest(length) (find Top 5)? (Hint: You can rely on question 3 output.)


select * from film;
select category.name, avg(film.length) as runningtime
from category
join film_category using (category_id)
join film using (film_id)
group by category.name
order by runningtime desc
limit 5;

#5 Display the top 5 most frequently(number of times) rented movies in descending order.

select film.title, count(rental.inventory_id) as rentals
from film
join inventory using (film_id)
join rental using (inventory_id)
group by rental.inventory_id
order by rentals desc
limit 5;

#6 List the top five genres in gross revenue in descending order.

select * from film;
select category.name, sum(payment.amount) as total
from category
join film_category using (category_id)
join film using (film_id)
join inventory using (film_id)
join rental using (inventory_id)
join payment using (rental_id)
group by category.name
order by total desc
limit 5;

#7 Is "Academy Dinosaur" available for rent from Store 1?

select film.title, inventory.store_id
from film
join inventory using (film_id)
where film.title = 'Academy Dinosaur' and store_id = 1;

SELECT title, count(film_id) FROM film
	INNER JOIN inventory
		USING (film_id)
WHERE title = "Academy Dinosaur" AND store_id = 1;