# samplemongosql

https://www.w3resource.com/sql/sql-table.php

https://www.w3resource.com/sql/sample-database-of-sql-in-mysql-format.txt

# Load MongoDB data

## Create MongoDB database and credentials
Logon as *userAdmin* and create *querydb* database and user *admin*.<br>

>mongo mongodb://userAdmin:dfuer56pass34sm@adown-inf --authenticationDatabase 'admin'<br>
>use querydb<br>
>db.createUser( { user: 'admin', pwd: 'secret', roles: [ { role: 'root', db: 'admin' } ] } );<br>

## Configure import

> cp template/env.rc<br>
> vi env.rc

| Variable | Description | Sample value
| ---- | ---- | ---- |
| DELIM | Delimiter used in input text files | ;
| MONGODIR | Subdirectory for MongoDB input text files | mongotxt
| URI | URI string to connect to MongoDB instance | "mongodb://admin:secret@boreal-inf/querydb"
| DATABASE | MongoDB database | querydb
| LOGFILE | File to keep debug log lines | /tmp/log/e.log

## Run import

>  ./importmongo.sh

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
### Write a SQL statement to display either those orders which are not issued on date 2012-09-10 and issued by the salesman whose ID is 5005 and below or those orders which purchase amount is 1000.00 and below.
```SQL
SELECT * FROM  orders WHERE NOT ((ord_date ='2012-09-10' AND agent_code>5005) OR ord_amount>1000.00);
```
(MongoDB Query language does not have top level *not* operator. So expression NOT ((expr1) OR (expr2)) is replaced with { $nor: \[expr1, expr2\] }

```JSON
db.orders.find(
  {"$nor": [{ "$and": [ { "ord_date": { "$eq": "2012-09-10" } }, { "agent_code": { "$gt": 5005 } } ]},
            { "ord_amount": { "$gt": 1000 }}]}
)
```
### List the agents currently listing for all of their customers
```SQL
SELECT DISTINCT AGENT_CODE FROM orders;
```

```
db.orders.distinct('agent_code')

```
### Find the number of agents currently listing for all of their customers
```SQL
SELECT COUNT(DISTINCT AGENT_CODE) FROM orders;
```

```
 db.orders.distinct('agent_code').length

```
## Aggregate
### Find the total purchase amount for all orders
```SQL
SELECT SUM (ORD_AMOUNT) FROM orders;
```

```
db.orders.aggregate([{$group: {_id: ObjectId(),total: {$sum: "$ord_amount"}}}])
```
### Write a SQL statement to find the average purchase amount of all orders.
```SQL
SELECT AVG (ORD_AMOUNT) FROM orders;
```

```
db.orders.aggregate([{$group: {_id: ObjectId(),avg: {$avg: "$ord_amount"}}}])
```
