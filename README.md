# samplemongosql

https://www.w3resource.com/sql/sample-database-of-sql-in-mysql-format.txt

# SQL to MongoDB

## Simple queries
### Query 1
```SQL
SELECT cust_name,cust_city FROM customer;
```

```JSON
db.customer.find(
  undefined,
  {"cust_name": 1,"cust_code": 1}
)
```
### Query 2
```SQL
SELECT * FROM CUSTOMER WHERE GRADE >= 2;
```

```JSON
db.customer.find(
  {"grade": {"$gte": 2}}
)

```
