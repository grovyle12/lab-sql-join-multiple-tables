-- 1
select store_id, city, country
from sakila.store s
join sakila.address a
on s.address_id = a.address_id
join sakila.city c
on c.city_id = a.city_id
join sakila.country co
on co.country_id = c.country_id;

-- 2
select s.store_id, round(sum(amount), 2)
from sakila.store s
join sakila.customer c
on s.store_id = c.store_id
join sakila.payment_test p
on c.customer_id = p.customer_id
group by s.store_id;

-- 3
select category.name, avg(length)
from sakila.film join sakila.film_category using (film_id)
join sakila.category using (category_id)
group by category.name
order by avg(length) desc;

-- 4
select category.name, avg(length)
from sakila.film join sakila.film_category using (film_id)
join sakila.category using (category_id)
group by category.name
order by avg(length) desc;

-- 5
select title, count(*) as rental frequency
from sakila.film
join sakila.inventory
on film.film_id = inventory.film_id
join sakila.rental using (inventory_id)
group by title
order by rental frequency desc;

-- 6
select name, fc.category_id, sum(amount) as gross revenue
from sakila.payment_test p
join sakila.rental r
on p.rental_id = r.rental_id
join sakila.inventory i
on i.inventory_id = r.inventory_id
join sakila.film f
on f.film_id = i.film_id
join sakila.film_category fc
on fc.film_id = f.film_id
join sakila.category c
on c.category_id = fc.category_id
group by fc.category_id
order by gross revenue desc
limit 5;

-- 7
select film.film_id, film.title, store.store_id, inventory.inventory_id
from sakila.inventory
join sakila.store using (store_id)
join sakila.film using (film_id)
where film.title = 'Academy Dinosaur' and store.store_id = 1;