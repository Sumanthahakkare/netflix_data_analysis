/* Data Cleaning & Normalization (SQL)
Removed duplicate records using ROW_NUMBER() with a CTE based on title and type.

Created a cleaned main table netflix with one unique row per show.

Normalized multi-valued fields (country, director, cast, listed_in) into separate tables.

Used STRING_SPLIT() to handle comma-separated values in those columns.

Created separate tables: netflix_country, netflix_director, netflix_cast, netflix_genre.

This follows normalization principles (1NF and 3NF) to avoid redundancy.

Allows efficient many-to-many relationship queries.

Ensures data is atomic and each table contains one type of entity.

Enables advanced filtering, e.g., by genre or director.

Prepared data for further analysis in SQL or integration with Python/Power BI.*/




with cte as(
select * ,
row_number() over(partition by title,type order by show_id)as rn
from netflix_titles)
select show_id,type,title,cast(date_added as date)as date_added,release_year,rating,
case when duration is null then rating else duration end as duration
into netflix
from cte
where rn=1

---crete seperate table for country
select show_id,value as country
into netflix_country
from netflix_titles
cross apply string_split(country,',')

---crete seperate table for director
select show_id,value as director
into netflix_director
from netflix_titles
cross apply string_split(director,',')

---crete seperate table for cast
select show_id,value as cast
into netflix_cast
from netflix_titles
cross apply string_split(cast,',')

---crete seperate table for genre
select show_id,value as genre
into netflix_genre
from netflix_titles
cross apply string_split(listed_in,',')


