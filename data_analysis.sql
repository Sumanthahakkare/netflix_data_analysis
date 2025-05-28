---for each director count the no of movies and tv shows created 
--by them in separate columns for director who have created tv shows and movies both

select nd.director,
count( distinct case when n.type='movie' then n.show_id end)  as no_movies,
count( distinct case when n.type='tv show' then n.show_id end)  as no_tv_shows
from netflix_director nd
inner join netflix n
on nd.show_id=n.show_id
group by nd.director
having count(distinct n.type)>1

--- which country has highest number of comedy movie 

select nc.country ,count(distinct ng.show_id) as no_of_movies from
netflix_country nc
inner join netflix_genre ng
on ng.show_id=nc.show_id
inner join netflix n
on ng.show_id=n.show_id
where ng.genre='comedies' and type='movie'
group by nc.country
order by no_of_movies desc
