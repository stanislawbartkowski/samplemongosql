CREATE TABLE IF NOT EXISTS agents (
  AGENT_CODE varchar(6) NOT NULL DEFAULT '',
  AGENT_NAME varchar(40) DEFAULT NULL,
  WORKING_AREA varchar(35) DEFAULT NULL,
  COMMISSION decimal(10,2) DEFAULT NULL,
  PHONE_NO varchar(15) DEFAULT NULL,
  COUNTRY varchar(25) DEFAULT NULL,
  PRIMARY KEY (AGENT_CODE)
);


--
-- Table structure for table company
--

CREATE TABLE IF NOT EXISTS company (
  COMPANY_ID varchar(6) NOT NULL DEFAULT '',
  COMPANY_NAME varchar(25) DEFAULT NULL,
  COMPANY_CITY varchar(25) DEFAULT NULL,
  PRIMARY KEY (COMPANY_ID)
);


-- --------------------------------------------------------

--
-- Table structure for table customer
--

CREATE TABLE IF NOT EXISTS customer (
  CUST_CODE varchar(6) NOT NULL,
  CUST_NAME varchar(40) NOT NULL,
  CUST_CITY varchar(35) DEFAULT NULL,
  WORKING_AREA varchar(35) NOT NULL,
  CUST_COUNTRY varchar(20) NOT NULL,
  GRADE decimal(10,0) DEFAULT NULL,
  OPENING_AMT decimal(12,2) NOT NULL,
  RECEIVE_AMT decimal(12,2) NOT NULL,
  PAYMENT_AMT decimal(12,2) NOT NULL,
  OUTSTANDING_AMT decimal(12,2) NOT NULL,
  PHONE_NO varchar(17) NOT NULL,
  AGENT_CODE varchar(6) DEFAULT NULL
); 


-- --------------------------------------------------------

--
-- Table structure for table daysorder
--

CREATE TABLE IF NOT EXISTS daysorder (
  ORD_NUM decimal(6,0) NOT NULL,
  ORD_AMOUNT decimal(12,2) NOT NULL,
  ADVANCE_AMOUNT decimal(12,2) NOT NULL,
  ORD_DATE date NOT NULL,
  CUST_CODE varchar(6) NOT NULL,
  AGENT_CODE varchar(6) NOT NULL,
  ORD_DESCRIPTION varchar(60) NOT NULL
); 

-- --------------------------------------------------------

--
-- Table structure for table despatch
--

CREATE TABLE IF NOT EXISTS despatch (
  DES_NUM varchar(6) NOT NULL DEFAULT '',
  DES_DATE date DEFAULT NULL,
  DES_AMOUNT decimal(12,2) DEFAULT NULL,
  ORD_NUM decimal(6,0) DEFAULT NULL,
  ORD_DATE date DEFAULT NULL,
  ORD_AMOUNT decimal(12,2) DEFAULT NULL,
  AGENT_CODE varchar(6) DEFAULT NULL,
  PRIMARY KEY (DES_NUM)
); 

--
-- Dumping data for table despatch
--


-- --------------------------------------------------------

--
-- Table structure for table foods
--

CREATE TABLE IF NOT EXISTS foods (
  ITEM_ID varchar(6) NOT NULL DEFAULT '',
  ITEM_NAME varchar(25) DEFAULT NULL,
  ITEM_UNIT varchar(5) DEFAULT NULL,
  COMPANY_ID varchar(6) DEFAULT NULL,
  PRIMARY KEY (ITEM_ID)
); 


-- --------------------------------------------------------

--
-- Table structure for table listofitem
--

CREATE TABLE IF NOT EXISTS listofitem (
  ITEMCODE varchar(6) NOT NULL,
  ITEMNAME varchar(25) NOT NULL,
  BATCHCODE varchar(35) NOT NULL,
  CONAME varchar(35) DEFAULT NULL
);

-- --------------------------------------------------------

--
-- Table structure for table orders
--

CREATE TABLE IF NOT EXISTS orders (
  ORD_NUM decimal(6,0) NOT NULL,
  ORD_AMOUNT decimal(12,2) NOT NULL,
  ADVANCE_AMOUNT decimal(12,2) NOT NULL,
  ORD_DATE date NOT NULL,
  CUST_CODE varchar(6) NOT NULL,
  AGENT_CODE varchar(6) NOT NULL,
  ORD_DESCRIPTION varchar(60) NOT NULL
); 


-- --------------------------------------------------------

--
-- Table structure for table student
--

CREATE TABLE IF NOT EXISTS student (
  NAME varchar(30) NOT NULL,
  TITLE varchar(25) NOT NULL,
  CLASS varchar(5) NOT NULL,
  SECTION varchar(1) NOT NULL,
  ROLLID decimal(3,0) NOT NULL,
  PRIMARY KEY (CLASS,SECTION,ROLLID)
) ;


--
-- Table structure for table studentreport
--

CREATE TABLE IF NOT EXISTS studentreport (
  CLASS varchar(5) NOT NULL,
  SECTION varchar(1) NOT NULL,
  ROLLID decimal(3,0) NOT NULL,
  GRADE varchar(5) NOT NULL,
  SEMISTER varchar(5) DEFAULT NULL,
  CLASS_ATTENDED decimal(25,0) DEFAULT NULL)
  ;

