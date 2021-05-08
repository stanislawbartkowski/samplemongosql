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
