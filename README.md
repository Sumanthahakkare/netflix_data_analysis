# Netflix Data Analysis with SQL and Python

This project demonstrates how to clean, normalize, and analyze a Netflix titles dataset using SQL Server and Python (via SQLAlchemy).

## Tools Used
- SQL Server
- Python
- Pandas, SQLAlchemy
- Jupyter Notebook

## Project Steps

### 1. Data Preparation and Table Creation
- Created `netflix_titles` base table
- Cleaned duplicates using `ROW_NUMBER()` in a CTE
- Split multi-valued columns (e.g., director, country) using `STRING_SPLIT()`

### 2. Normalization
Created separate normalized tables:
- `netflix_country`
- `netflix_director`
- `netflix_cast`
- `netflix_genre`

### 3. Analysis Queries
- Counted Movies and TV Shows per director
- Filled missing country data using cross joins
- Found the country with the most comedy movies

### 4. Python Integration
Used SQLAlchemy to connect Python to SQL Server and run SQL queries programmatically.

## Example SQL
```sql
-- Find country with most comedy movies
SELECT nc.country, COUNT(DISTINCT ng.show_id) AS no_of_movies
FROM netflix_country nc
JOIN netflix_genre ng ON ng.show_id = nc.show_id
JOIN netflix n ON ng.show_id = n.show_id
WHERE ng.genre = 'comedies' AND type = 'movie'
GROUP BY nc.country
ORDER BY no_of_movies DESC;
