use sakila;
#1 Which actor has appeared in the most films?


SELECT actor.first_name, actor.last_name, COUNT(film_actor.actor_id) as num_films
FROM actor
JOIN film_actor usinng (actor_id)
GROUP BY film_actor.actor_id
ORDER BY num_films DESC
LIMIT 1;

#2 Most active customer (the customer that has rented the most number of films)


select customer.first_name, customer.last_name, count(rental.customer_id) as n_rentals
from customer 
join rental using (customer_id)
group by rental.customer_id
order by n_rentals desc
limit 1;

#3 List number of films per category.

select category.name, count(film_category.category_id) as num_films
from category
join film_category using (category_id)
group by category.name;

#4 Display the first and last names, as well as the address, of each staff member.
#select staff.first_name, staff.last_name,

select staff.first_name, staff.last_name, address.address
from staff
join address using (address_id);

#5 get films titles where the film language is either English or italian, and whose titles starts with letter "M" , sorted by title descending.

select film.title, language.name
from film
join language using (language_id)
where film.title like 'M%'
and language.name = 'English' or 'Italian' 
order by film.title desc;

#6 Display the total amount rung up by each staff member in August of 2005.
select staff.first_name, staff.last_name, sum(payment.amount) as total
from staff
join payment using (staff_id)
where payment.payment_date between 20050801 and 20050831
group by payment.staff_id
order by staff.last_name;
select inventory_id, count(inventory_id) from rental group by inventory_id;

#7 List each film and the number of actors who are listed for that film.

select film.title, count(film_actor.actor_id) as countact
from film
join film_actor using (film_id)
group by film_actor.film_id
order by countact desc;

#8 Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.

select customer.first_name, customer.last_name, sum(payment.amount) as total
from customer
join payment using (customer_id)
group by payment.customer_id
order by customer.last_name;

#9 Write sql statement to check if you can find any actor who never particiapted in any film.
select actor.first_name, actor.last_name
from actor
join film_actor using (actor_id)
where film_actor.film_id like '';
select* from address;
#10 get the addresses that have NO customers, and ends with the letter "e"

SELECT address.address 
FROM sakila.address
WHERE address.address2 is null 
AND address.address LIKE '%e';

#11 Optional: what is the most rented film?

select film.title, count(rental.inventory_id) as rentals
from film
join inventory using (film_id)
join rental using (inventory_id)
group by rental.inventory_id
order by rentals desc
limit 100;