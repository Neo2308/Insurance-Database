CREATE TABLE Customer
(
  Customer_Id INT NOT NULL,
  Name VARCHAR(50) NOT NULL,
  street VARCHAR(50) NOT NULL,
  Pincode VARCHAR(20) NOT NULL,
  Country VARCHAR(20) NOT NULL,
  PRIMARY KEY (Customer_Id)
);

CREATE TABLE Company
(
  Name VARCHAR(50) NOT NULL,
  Company_Id INT NOT NULL,
  Contact_Information VARCHAR(15) NOT NULL,
  Street VARCHAR(20) NOT NULL,
  Pincode VARCHAR(10) NOT NULL,
  Country VARCHAR(20) NOT NULL,
  PRIMARY KEY (Company_Id)
);

CREATE TABLE Documents
(
  Document_Id INT NOT NULL,
  Document_Type VARCHAR(100) NOT NULL,
  Verification_Status INT NOT NULL,
  Link_to_doc VARCHAR(200) NOT NULL,
  Customer_Id INT,
  PRIMARY KEY (Document_Id),
  FOREIGN KEY (Customer_Id) REFERENCES Customer(Customer_Id)
);

CREATE TABLE Assets
(
  Asset_Id INT NOT NULL,
  Details VARCHAR(200) NOT NULL,
  type VARCHAR(200) NOT NULL,
  Customer_Id INT,
  PRIMARY KEY (Asset_Id),
  FOREIGN KEY (Customer_Id) REFERENCES Customer(Customer_Id)
);

CREATE TABLE Employee_type
(
  Type VARCHAR(30) NOT NULL,
  Salary FLOAT NOT NULL,
  Identification INT NOT NULL,
  PRIMARY KEY (Identification)
);

CREATE TABLE Office
(
  Office_Id INT NOT NULL,
  Office_name VARCHAR(50) NOT NULL,
  Street VARCHAR(30) NOT NULL,
  Contact VARCHAR(15) NOT NULL,
  Pincode VARCHAR(10) NOT NULL,
  Country VARCHAR(15) NOT NULL,
  PRIMARY KEY (Office_Id)
);

CREATE TABLE Customer_Contact
(
  Contact VARCHAR(15) NOT NULL,
  Customer_Id INT NOT NULL,
  PRIMARY KEY (Contact, Customer_Id),
  FOREIGN KEY (Customer_Id) REFERENCES Customer(Customer_Id)
);

CREATE TABLE Customer_Email_Id
(
  Email_Id VARCHAR(40) NOT NULL,
  Customer_Id INT NOT NULL,
  PRIMARY KEY (Email_Id, Customer_Id),
  FOREIGN KEY (Customer_Id) REFERENCES Customer(Customer_Id)
);

CREATE TABLE Wallet
(
  Wallet_id INT NOT NULL,
  Balance FLOAT NOT NULL,
  Customer_Id INT,
  PRIMARY KEY (Wallet_id),
  FOREIGN KEY (Customer_Id) REFERENCES Customer(Customer_Id)
);

CREATE TABLE Relations
(
  Relationship_Type VARCHAR(20) NOT NULL,
  Customer_Id INT NOT NULL,
  CustomersRelation_Id INT NOT NULL,
  PRIMARY KEY (Customer_Id, CustomersRelation_Id),
  FOREIGN KEY (Customer_Id) REFERENCES Customer(Customer_Id),
  FOREIGN KEY (CustomersRelation_Id) REFERENCES Customer(Customer_Id)
);

CREATE TABLE Policy
(
  Policy_id INT NOT NULL,
  Name_of_Policy VARCHAR(50) NOT NULL,
  Cost_per_month FLOAT NOT NULL,
  things_to_cover VARCHAR(100) NOT NULL,
  type VARCHAR(20) NOT NULL,
  Company_Id INT,
  PRIMARY KEY (Policy_id),
  FOREIGN KEY (Company_Id) REFERENCES Company(Company_Id)
);

CREATE TABLE Employee
(
  Name VARCHAR(50) NOT NULL,
  User_Id INT NOT NULL,
  Date_of_joining DATE NOT NULL,
  Street VARCHAR(30) NOT NULL,
  Contact_Information VARCHAR(15) NOT NULL,
  Gender VARCHAR(10) NOT NULL,
  Pincode VARCHAR(10) NOT NULL,
  Country VARCHAR(20) NOT NULL,
  Identification INT,
  Office_Id INT,
  PRIMARY KEY (User_Id),
  FOREIGN KEY (Identification) REFERENCES Employee_type(Identification),
  FOREIGN KEY (Office_Id) REFERENCES Office(Office_Id)
);

CREATE TABLE Feedback
(
  Remarks VARCHAR(200) NOT NULL,
  Serial_Number INT NOT NULL,
  User_Id INT,
  PRIMARY KEY (Serial_Number),
  FOREIGN KEY (User_Id) REFERENCES Employee(User_Id)
);

CREATE TABLE Customer_Policies
(
  Policy_Number INT NOT NULL,
  Date_of_Purchase DATE NOT NULL,
  date_of_expire DATE NOT NULL,
  Policy_id INT,
  Customer_Id INT NOT NULL,
  Asset_Id INT NOT NULL,
  PRIMARY KEY (Policy_Number, Customer_Id),
  FOREIGN KEY (Policy_id) REFERENCES Policy(Policy_id),
  FOREIGN KEY (Customer_Id) REFERENCES Customer(Customer_Id),
  FOREIGN KEY (Asset_Id) REFERENCES Assets(Asset_Id)
);

CREATE TABLE Policy_Things_covered
(
  Things_covered VARCHAR(100) NOT NULL,
  Policy_id INT NOT NULL,
  PRIMARY KEY (Things_covered, Policy_id),
  FOREIGN KEY (Policy_id) REFERENCES Policy(Policy_id)
);

CREATE TABLE Manager
(
  Manager_Id INT NOT NULL,
  User_Id INT NOT NULL,
  PRIMARY KEY (Manager_Id, User_Id),
  FOREIGN KEY (Manager_Id) REFERENCES Employee(User_Id),
  FOREIGN KEY (User_Id) REFERENCES Employee(User_Id)
);

CREATE TABLE Documentof
(
  Document_Id INT NOT NULL,
  Policy_Number INT NOT NULL,
  Customer_Id INT NOT NULL,
  PRIMARY KEY (Document_Id, Policy_Number, Customer_Id),
  FOREIGN KEY (Document_Id) REFERENCES Documents(Document_Id),
  FOREIGN KEY (Policy_Number, Customer_Id) REFERENCES Customer_Policies(Policy_Number, Customer_Id)
);

CREATE TABLE Claim_Details
(
  Claim_Id INT NOT NULL,
  Damage VARCHAR(100) NOT NULL,
  Status VARCHAR(30) NOT NULL,
  Date DATE NOT NULL,
  Policy_Number INT,
  Customer_Id INT,
  PRIMARY KEY (Claim_Id),
  FOREIGN KEY (Policy_Number, Customer_Id) REFERENCES Customer_Policies(Policy_Number, Customer_Id)
);