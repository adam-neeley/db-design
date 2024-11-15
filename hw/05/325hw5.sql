
-- Adam Neeley
-- CS 325 - Homework 5 - Problem 1
-- Oct 10 2024

spool 325hw5-out.txt

prompt Homework 5
prompt Adam Neeley

prompt Problem 1

select client_lname, client_credit_rtg + 0.5 "IF_BUMPED_UP"
       from client
       where client_credit_rtg <= 4.5;

prompt Problem 2

select rental_num, date_due, date_due + 5 "IF_GRACE"
       from rental
       where date_returned is null;

prompt Problem 3

select vid_id, vid_format, vid_rental_price * 0.2 "IF_DISCT"
       from video
       where vid_format != 'Blu-Ray';

prompt Problem 4

select m.movie_title, c.category_code, c.category_name
       from movie m, movie_category c
       where m.category_code = c.category_code;

prompt Problem 5

select min(vid_purchase_date) "OLDEST", max(vid_purchase_date) "NEWEST"
       from video;

prompt Problem 6

select COUNT(vid_id) "Total videos", AVG(vid_rental_price) "Avg Rental"
       from video;

prompt Problem 7


select count(r.rental_num) "# Rentals", sum(v.vid_rental_price) "Total Rental $"
       from video v, rental r
       where v.vid_id = r.vid_id;

prompt Problem 8

select vid_id, vid_format
       from video
       where vid_rental_price < (select avg(vid_rental_price) from video);

prompt Problem 9

select c.client_fname, c.client_lname
       from client c
       where c.client_num in (select client_num from rental where vid_id = '130012');

spool off
