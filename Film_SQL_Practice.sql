-- -----> -- -----> -- -----> -- -----> --<>-- <----- -- <----- -- <----- -- <----- --

create database film;
use film;

-- 1.Display all film records
select * from film;

-- 2.Display only the title and release_year of all films
select title,release_year from film;

-- 3.Find the total number of films
select count(film_id) as Total_films from film;

-- 4.Display all unique ratings
select distinct(rating) from film;

-- 5.Find films released in the year 2006
select title,release_year from film where release_year = 2006;

-- 6.Find films with a rental rate greater than 3
select title,rental_rate from film where rental_rate > 3;

-- 7.Find films with a rental duration of more than 5 days
select title,rental_duration from film where rental_duration > 5;

-- 8.Find films whose length is greater than 120 minutes
select title,length from film where length > 120;

-- 9.Find films with a replacement cost greater than 20
select title,replacement_cost from film where replacement_cost > 20;

-- 10.Display films having a rating of 'PG'
select title,rating from film where rating = 'PG';

-- 11.Find films with rental rates between 2 and 4
select title,rental_rate from film where rental_rate between 2 and 4;

-- 12.Find films whose length is between 90 and 120 minutes
select title,length from film where length between 90 and 120;

-- 13.Find films with replacement costs between 15 and 25
select title,replacement_cost from film where replacement_cost between 15 and 25;

-- 14.Find films whose title starts with 'A'
select title from film where title like 'A%';

-- 15.Find films whose title ends with 'N'
select title from film where title like '%N';

-- 16.Find films whose title contains the word 'LOVE'
select title from film where title like '%LOVE%';

-- 17.Find films having a rating of 'PG' or 'G'
select title,rating from film where rating ='PG' or rating='G';

-- 19.Find films where rental duration is 3, 5, or 7 days
select title,rental_duration  from film where rental_duration=3 or rental_duration=5 or rental_duration=7;

-- 20.Find films whose rental rate is not equal to 2.99
select title,rental_rate from film where rental_rate != 2.99; 

-- 21.Display films from lowest to highest rental rate
select title,rental_rate from film order by rental_rate asc;

-- 22.Display films from highest to lowest rental rate
select title,rental_rate from film order by rental_rate desc;

-- 23.Display films according to their length from longest to shortest
select title,length from film order by length desc;

-- 24.Display films according to replacement cost from highest to lowest
select title,replacement_cost from film order by replacement_cost desc;

-- 25.Display films alphabetically by title
select title from film order by title asc;

-- 26.Display the 10 most expensive films based on replacement cost
select title,replacement_cost from film order by replacement_cost desc limit 10;

-- 27.Display the 5 longest films
select title,length from film order by length desc limit 5;

-- 28.Find the average rental rate
select avg(rental_rate) from film;

-- 29.Find the maximum rental rate
select max(rental_rate) from film;

-- 30.Find the minimum rental rate
select min(rental_rate) from film;

-- 31.Find the average film length
select round(avg(length)) from film;

-- 32.Find the longest film
select max(length) from film;

-- 33.Find the shortest film
select min(length) from film;

-- 34.Find the total replacement cost of all films
select round(sum(replacement_cost)) from film;

-- 35.Find the average replacement cost
select avg(replacement_cost) from film;

-- 36.Find the total number of films for each rating
select count(film_id),rating from film group by rating;

-- 37.Find the number of films for each rating
select count(film_id),rating from film group by rating;

-- 38.Find the average rental rate for each rating
select avg(rental_rate),rating from film group by rating;

-- 39.Find the average film length for each rating
select avg(length),rating from film group by rating;

-- 40.Find the maximum replacement cost for each rating
select min(replacement_cost),rating from film group by rating;

-- 41.Find the minimum rental rate for each rating
select min(rental_rate),rating from film group by rating;

-- 42.Find ratings having more than 10 films
select rating,count(film_id) as film_count from film 
group by rating having count(film_id) > 10;

-- 43.Find ratings where the average rental rate is greater than 2.50
select rating,round(avg(rental_rate)) from film 
group by rating having avg(rental_rate) > 2.50;

-- 44.Find ratings where the average film length is greater than 100 minutes
select rating,avg(length) from film group by rating having avg(length) > 100;

-- 45.Categorize films based on length as Short, Medium, or Long using CASE
select title,length,
case 
	when length <60 then 'Short'
    when length <=120 then 'medium'
else 'long'
end as film_category from film;    

-- 46.Categorize films based on rental rate as Cheap, Moderate, or Expensive using CASE
select title,rental_rate,
case 
	when rental_rate < 1 then 'Cheap'
    when rental_rate <=2.99 then 'Moderate'
else 'Expensive'
end as rental_rate_category from film;

-- 47.Display title, length, and film_category using CASE
select title,length,
case 
	when length <60 then 'Avg'
	when length <=120 then 'Goood'
else 'Top level'
end as film_category from film;

-- 48.Find the second-highest rental rate
select max(rental_rate) from film
where rental_rate < (select max(rental_rate) from film);

-- 49.Find the third-highest replacement cost
select distinct replacement_cost from film
order by replacement_cost desc limit 1 offset 2;

-- 50.Find the film(s) having the maximum length
select title,length from film where length=(select max(length) from film);

-- 52.Find films whose replacement cost is higher than the average replacement cost
select title,round(avg (replacement_cost)) from film
group by title having avg(replacement_cost) > (select avg(replacement_cost)from film);

-- 53.Find the rating with the highest average rental rate
select rating,avg(rental_rate) as highest_avg_rent_rate from film
group by rating order by avg(rental_rate) desc limit 1;

-- 54.Find the rating with the longest average film length
select rating,avg(length) as longest_avg_film_len from film 
group by rating order by avg(length) desc limit 1;

-- 55.Display the top 5 films based on replacement cost
select title,replacement_cost from film 
order by replacement_cost desc limit 5;

-- 56.Find the number of films for each release year
select release_year,count(film_id) as films_each_year from film
group by release_year;

-- 57.Find the average rental rate for each release year
select avg(rental_rate),release_year from film 
group by release_year;

-- 58.Find the year having the highest number of films
select count(film_id)title,release_year  as film_count from film 
group by release_year order by film_count desc limit 1;

-- 59.Find films where rental_rate is greater than replacement_cost / 10
select title,rental_rate from film where rental_rate > replacement_cost / 10;

-- 60.Display each film's title, rental rate, replacement cost, and the difference between replacement cost and rental rate
select title,rental_rate,replacement_cost,
replacement_cost - rental_rate as differrence from film;

-- -----> -- -----> 
select * from film;

-- 61.Find the film with the highest rental_rate
select * from film where rental_rate = (select max(rental_rate) from film);

-- 62.Find the film with the lowest rental_rate
select * from film where rental_rate= (select min(rental_rate) from film);

-- 64.Find the film with the lowest replacement_cost
select * from film  where replacement_cost = (select min(replacement_cost) from film);

-- 66.Find the shortest film for each rating
select min(length),rating from film group by rating;

-- 68.Find the average replacement_cost for each rating
select avg(replacement_cost),rating from film group by rating;

-- 69.Find the average rental_duration for each rating
select avg(rental_duration),rating from film group by rating;

-- 70.Find the total rental_rate for all films
select sum(rental_rate) as total_rental_rate from film;

-- 71.Find the total replacement_cost of all films
select sum(replacement_cost) as total_replacement_cost from film;

-- 72.Find the total length of all films
select sum(length) as total_length from film;

-- 73.Find the number of films for each rental_duration
select sum(film_id),rental_duration from film group by rental_duration;

-- 74.Find rental_durations having more than 10 films
select rental_duration,count(film_id) as film_count from film group by rental_duration having count(film_id) > 10;

-- 75.Find films having both rental_rate greater than 3 and replacement_cost greater than 20
select title,rental_rate,replacement_cost from film where rental_rate > 3 and replacement_cost > 20;

-- 76.Find films having rental_duration between 4 and 6
select title,rental_duration from film where rental_duration between 4 and 6;

-- 77.Find films whose length is between 90 and 120
select title,length from film where length between 90 and 120;

-- 78.Find films whose replacement_cost is between 15 and 25
select title,replacement_cost from film where replacement_cost between 15 and 25;

-- 79.Display the top 5 films with the highest replacement_cost
select title,max(replacement_cost) from film group by title,replacement_cost order by replacement_cost desc limit 5;

-- 80.Display the top 10 films with the lowest rental_rate
select title,min(rental_rate) from film group by title,rental_rate order by rental_rate asc limit 10;

-- -----> -- -----> --<>-- <----- -- <----- --
-- Basic SQL Questions --

-- 81.Display all records from the film table.
select * from film;

-- 82.Display only the title, release_year, and rental_rate columns.
select title,release_year,rental_rate from film;

-- 83.Find all films released in 2006.
select * from film where release_year = 2006;

-- 84.Find films having a rental_rate greater than 3.
select title,rental_rate from film where rental_rate > 3;

-- 85.Find films with a length greater than 120 minutes.
select title,length from film where length > 120;

-- 86.Display films where the rating is 'PG'.
select title,rating from film where rating = 'PG';

-- 87.Find films where rental_duration is greater than 5 days.
select title,rental_duration from film where rental_duration > 5;

-- 88.Display films with a replacement_cost greater than 20.
select title,replacement_cost from film where replacement_cost > 20;

-- 89.Find films having a rental_rate equal to 0.99.
select title,rental_rate from film where rental_rate = 0.99;

-- 90.Display the first 10 films based on film_id.
select title,film_id from film where film_id order by film_id asc limit 10;

-- WHERE, AND, OR ,Between -- 

-- 91.Find films released in 2006 with a rental rate greater than 3.
select title,rental_rate,release_year from film where rental_rate> 3 and release_year = 2006;

-- 92.Find films with a length greater than 100 and rental rate less than 3.
select title,length,rental_rate from film where rental_rate < 3 and length > 100;

-- 93.Find films rated PG or G.
select title,rating from film where rating = 'PG' or rating = 'G';

-- 94.Find films where the rental duration is between 4 and 6 days.
select title,rental_duration from film where rental_duration between 4 and 6;

-- 95.Find films where the replacement cost is between 15 and 20.
select title,replacement_cost from film where replacement_cost between 15 and 20;

-- 96.Find films released in 2006 or having a rental rate greater than 4.
select title,release_year,rental_rate from film where release_year = 2006 and rental_rate > 4;

-- 97.Find films whose rating is not R.
select title,rating from film where rating != 'R';

-- 98.Find films with a length between 90 and 120 minutes.
select title,length from film where length between 90 and 120;

-- ORDER BY --

-- 99.Display all films sorted by title in ascending order.
select title from film order by title asc;

-- 100.Display all films sorted by rental_rate from highest to lowest.
select title,rental_rate from film  order by rental_rate desc;

-- 101.Display films sorted by length from longest to shortest.
select title,length from film  order by length desc;

-- 102.Display films sorted by replacement_cost in ascending order.
select title,replacement_cost from film order by replacement_cost asc;

-- 103.Display films sorted first by rating and then by rental_rate descending.
select title,rating,rental_rate from film order by rating,rental_rate desc;

-- Aggregate Functions -- 

-- 104.Find the total number of films.
select count(film_id) as Total_no_of_Films from film ;

-- 105.Find the average rental rate.
select avg(rental_rate) from film;

-- 106.Find the maximum rental rate.
select max(rental_rate) from film;

-- 107.Find the minimum rental rate.
select min(rental_rate) from film;

-- 108.Find the average film length.
select avg(length) from film;

-- 109.Find the maximum replacement cost.
select max(replacement_cost) from film;

-- 110.Find the minimum replacement cost.
select min(replacement_cost) from film;

-- 111.Find the total of all replacement costs.
select sum(replacement_cost) from film;

-- 112.Find the average rental duration.
select avg(rental_duration) from film;

-- Group By --

-- 113.Count the number of films for each rating.
select count(film_id),rating from film group by rating;

-- 114.Find the average rental rate for each rating.
select avg(rental_rate),rating from film group by rating;

-- 115.Find the average length of films for each rating.
select avg(length),rating from film group by rating;

-- 116.Find the maximum replacement cost for each rating.
select max(replacement_cost),rating from film group by rating;

-- 117.Find the minimum rental rate for each rating.
select min(rental_rate),rating from film group by rating;

-- 118.Count films released in each release_year.
select count(film_id),release_year from film group by release_year;

-- 119.Find the average film length for each release_year.
select avg(length),release_year from film group by release_year;

-- HAVING --

-- 120.Find ratings having more than 10 films.
select count(film_id),rating from film group by rating having count(film_id) > 10;

-- 121.Find ratings where the average rental rate is greater than 3.
select avg(rental_rate),rating from film group by rating having avg(rental_rate) > 3;

-- 122.Find ratings where the average film length is greater than 100 minutes.
select avg(length),rating from film group by rating having avg(length) > 100;

-- 123.Find release years having more than 20 films.
select count(film_id),release_year from film group by release_year having count(film_id) > 20;

-- LIKE / Pattern Matching -- 

-- 124.Find films whose title starts with A.
select title from film where title like 'A%';

-- 125.Find films whose title ends with N.
select title from film where title like '%N';

-- 126.Find films whose title contains the word LOVE.
select title from film where title like '%LOVE%';

-- 127.Find films whose title contains the letter R.
select title from film where title like '%R%';

-- 128.Find films with a description containing the word "man".
select description from film where description like '%man%';

-- 129.Find films whose title has exactly 9 characters.
select title from film where char_length(title) = 9;

-- LIMIT / Top Records --

-- 130.Find the 5 most expensive films based on replacement_cost.
select title,max(replacement_cost) as max_replacement_cost from film group by title order by max_replacement_cost desc limit 5;

-- 131.Find the 10 films with the highest rental rate.
select title,max(rental_rate) as hig_rental_rate from film group by title order by hig_rental_rate desc limit 10;

-- 132.Find the 5 longest films.
select title,max(length) as longest_films_length from film group by title order by longest_films_length desc limit 5;

-- 133.Find the 5 films with the lowest rental rate.
select title,min(rental_rate) as lowest_rental_rate from film group by title order by lowest_rental_rate asc limit 5;

-- 134.Find the 10 films with the shortest rental duration.
select title,min(rental_duration) as min_rental_duration from film group by title order by  min_rental_duration asc limit 10;

-- Challenge Questions --

-- 135.Find the film with the highest rental rate.
select title,rental_rate as hig_rental_rate from film where
rental_rate = (select max(rental_rate) from film);

-- 136.Find the film with the longest length.
select title,length from film where length = (select max(length) from  film);

-- 137.Find the film with the highest replacement cost.
select title,replacement_cost from film where replacement_cost = ( select max(replacement_cost) from film);

-- 138.Find the film with the lowest rental rate.
select title,rental_rate from film where rental_rate = (select min(rental_rate) from film);

-- 139.Find the average rental rate of films rated PG.
select rating,avg(rental_rate)from film where rating = 'PG' group by rating;

-- 140.Find the number of films having special_features.
select * from film;
select count(film_id),special_features from film group by special_features;

-- 141.Find the most common rating.
select rating,count(film_id) as rating_count from film group by rating order by rating_count desc limit 1; 

-- 142.Find the rating with the longest average film length.
select rating,avg(length) as avg_length from film group by rating order by avg_length desc;

-- 143.Find films whose rental rate is greater than the average rental rate of all films.
select title,rental_rate from film where rental_rate > (select avg(rental_rate) from film);

-- 144.Find films whose length is greater than the average film length.
select title,length from film where length > (select avg(length) from film);

-- 145.Find the second-highest rental rate.
select max(rental_rate) from film where rental_rate < (select max(rental_rate) from film);

-- 146.Find the second-longest film.
select title,length  from film where length = (select max(length) from film where length < (select max(length) from film));

-- 147.Find the rating with the highest number of films.
select rating,count(film_id) as hig_no_of_films from film group by rating order by hig_no_of_films desc;

-- 148.Find the total replacement cost of all films released in 2006.
select release_year,sum(replacement_cost) from film where release_year = 2006;
 
-- 149.Find the average rental rate for films longer than 120 minutes.
select avg(rental_rate) as avg_rental_len from film where length > 120 group by length order by avg_rental_len desc ;

-- 150.Find films that have a rental duration of 7 days and a rental rate greater than 3.
select rental_duration,rental_rate from film where rental_duration = 7 and rental_rate> 3;