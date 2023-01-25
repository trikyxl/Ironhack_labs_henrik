use sakila;

#1 List all films whose length is longer than the average of all the films.

select title, length
from film
where length > (select avg(length) from film)
order by title;

#2 How many copies of the film Hunchback Impossible exist in the inventory system?

select count(film_id)
from inventory
join film using (film_id)
where title = 'Hunchback IMPOSSIBLE'
group by film_id;

#3 Use subqueries to display all actors who appear in the film Alone Trip.

select actor.first_name, actor.last_name
from actor
where actor_id in
(select actor_id from film_actor where film_id = 
(select film_id from film where title = 'Alone Trip'));

#4 Sales have been lagging among young families, and you wish to target all family movies for a promotion. Identify all movies categorized as family films.

select film.title
from film
where film_id in
(select film_id from film_category where category_id =
(select category_id from category where name = 'Family'));

#5 Get name and email from customers from Canada using subqueries. Do the same with joins. Note that to create a join, you will have to identify the correct tables with their primary keys and foreign keys, that will help you get the relevant information.

select customer.first_name, customer.last_name, customer.email 
from customer
where address_id in
(select address_id from address where city_id in
(select city_id from city where country_id in 
(select country_id from country where country.country = 'Canada')));

select first_name, last_name, email
from customer 
join address using (address_id)
join city using (city_id)
join country using (country_id)
where country = 'Canada';

#6 Which are films starred by the most prolific actor? Most prolific actor is defined as the actor that has acted in the most number of films. First you will have to find the most prolific actor and then use that actor_id to find the different films that he/she starred.

select film.title
from film
join film_actor using (film_id)
join (select actor_id, count(film_id) as film_counts from film_actor
group by actor_id
order by film_counts desc
limit 1) as most_prolific_actor using (actor_id);

#7 Films rented by most profitable customer. You can use the customer table and payment table to find the most profitable customer ie the customer that has made the largest sum of payments

select film.title
from film
join inventory using (film_id)
join rental using (inventory_id)
join (select customer_id, sum(amount) as total_payments from payment
group by customer_id
order by total_payments desc
limit 1) as best_customer using (customer_id);

#8 Customers who spent more than the average payments(this refers to the average of all amount spent per each customer).

select first_name, last_name, sum(amount) as total_spent
from customer 
join payment using (customer_id)
group by customer_id
having total_spent > (select avg(total_spent) 
from (select customer_id, sum(amount) as total_spent 
from payment
group by customer_id)
as average_spent)
order by total_spent desc;