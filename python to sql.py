
---

#### ✅ `netflix_sql_queries.sql`
Put **all your SQL code** (like you've written above) in this file with proper formatting and comments.

---

#### ✅ (Optional) `python_connection.py`
Add a sample Python file showing how you connected using SQLAlchemy:

```python
from sqlalchemy import create_engine
import pandas as pd

# Create engine
engine = create_engine("mssql+pyodbc://username:password@server/database?driver=ODBC+Driver+17+for+SQL+Server")

df.to_sql('netflix_titles',con=conn,index=False,if_exists='append')
conn.close()
