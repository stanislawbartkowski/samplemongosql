# samplemongosql

https://www.w3resource.com/sql/sql-table.php

https://www.w3resource.com/sql/sample-database-of-sql-in-mysql-format.txt

# SQL to MongoDB

## Simple queries
### Select only customer cust_name and cust_city
```SQL
SELECT cust_name,cust_city FROM customer;
```

```JSON
db.customer.find(
  undefined,
  {"cust_name": 1,"cust_code": 1}
)
```
###  Write a query to display all customers with a grade above or equal 2
```SQL
SELECT * FROM CUSTOMER WHERE GRADE >= 2;
```

```JSON
db.customer.find(
  {"grade": {"$gte": 2}}
)

```
###  Write a SQL statement to display all customers, who are either belongs to the city New York or had a grade above 2
```SQL
SELECT * FROM customer WHERE cust_city = 'New York' OR grade>2;
```

```JSON
db.customer.find(
  {"$or": [{ "grade": { "$gt": 2 }},{ "cust_city": { "$eq": "New York" }}]}
)
```

