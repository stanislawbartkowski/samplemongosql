
CREATE INDEX CUSTCITY ON customer(CUST_CITY);
CREATE INDEX CUSTCITY_COUNTRY ON customer(CUST_CITY,CUST_COUNTRY);

CREATE UNIQUE INDEX ITEMCODE ON listofitem(ITEMCODE);

CREATE INDEX FK_CSR ON studentreport(CLASS,SECTION,ROLLID);

