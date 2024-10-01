-- ADAM NEELEY
-- CS325 - Homework 4 - Problem 2
-- Sep 28 2024

spool 325hw4-out.txt

prompt Homework 4 Problem 2
prompt ADAM NEELEY


prompt Problem 2-1

select *
       from client
       where CLIENT_CREDIT_RTG > 3.4;

prompt Problem 2-2

select MOVIE_RATING, MOVIE_YR_RELEASED
       from movie;

prompt Problem 2-3

select *
       from client, movie_category
       where client.CLIENT_FAVE_CAT = movie_category.CATEGORY_CODE;


prompt Problem 2-4

select VID_ID, DATE_OUT, DATE_DUE
       from rental
       where DATE_RETURNED is null;


prompt Problem 2-5

select VID_ID, VID_FORMAT, VID_RENTAL_PRICE
       from video
       where VID_FORMAT <> 'Blu-Ray';

prompt Problem 2-6

select CATEGORY_NAME, CLIENT_LNAME, CLIENT_CREDIT_RTG
       from client, movie_category
       where client.CLIENT_FAVE_CAT = movie_category.CATEGORY_CODE;

prompt Problem 2-7

select *
       from video
       where VID_PURCHASE_DATE
             between TO_DATE( '2008-07-15', 'YYYY-MM-DD')
             and TO_DATE( '2012-12-01', 'YYYY-MM-DD');

prompt Problem 2-8

select *
       from video
       where VID_RENTAL_PRICE >= 3.99
             and VID_PURCHASE_DATE >= TO_DATE( '2011-01-01', 'YYYY-MM-DD');

prompt Problem 2-9

select MOVIE_TITLE, MOVIE_RATING
       from movie
       where MOVIE_TITLE like '%the%';

prompt Problem 2-10

select MOVIE_RATING, MOVIE_TITLE
       from movie
       where MOVIE_RATING in ('PG-13', 'R', 'A');

spool off
