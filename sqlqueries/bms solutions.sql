﻿use bms;
CREATE TABLE customer
   (
       custid VARCHAR(6),
       fname VARCHAR(30),
       mname VARCHAR(30),
       ltname VARCHAR(30),
       city VARCHAR(15),
       mobileno VARCHAR(10),
       occupation VARCHAR(10),
       dob DATE,
      CONSTRAINT customer_custid_pk PRIMARY KEY(custid)   
   );   

 CREATE TABLE branch
   (
    bid VARCHAR(6),
    bname VARCHAR(30),
    bcity VARCHAR(30),
    CONSTRAINT branch_bid_pk PRIMARY KEY(bid) 
   );

CREATE TABLE account
   (
      acnumber VARCHAR(6),
      custid  VARCHAR(6),
      bid VARCHAR(6),
      opening_balance INT(7),
      aod DATE,
      atype VARCHAR(10),
      astatus VARCHAR(10),
      CONSTRAINT account_acnumber_pk PRIMARY KEY(acnumber),
      CONSTRAINT account_custid_fk FOREIGN KEY(custid) REFERENCES customer(custid),
      CONSTRAINT account_bid_fk FOREIGN KEY(bid) REFERENCES branch(bid) 
    );

CREATE TABLE trandetails
    (   
     tnumber VARCHAR(6),
     acnumber VARCHAR(6),
     dot DATE,
     medium_of_transaction VARCHAR(20),
     transaction_type VARCHAR(20),
     transaction_amount INT(7),    
     CONSTRAINT trandetails_tnumber_pk PRIMARY KEY(tnumber),
     CONSTRAINT trandetails_acnumber_fk FOREIGN KEY(acnumber) REFERENCES account(acnumber)  
    );

CREATE TABLE loan
   (
   
    custid VARCHAR(6),
    bid VARCHAR(6),
    loan_amount INT(7),
    CONSTRAINT loan_customer_custid_bid_pk PRIMARY KEY(custid,bid),
    CONSTRAINT loan_custid_fk FOREIGN KEY(custid) REFERENCES  customer(custid),
    CONSTRAINT loan_bid_fk FOREIGN KEY(bid) REFERENCES  branch(bid)
   );

INSERT INTO customer VALUES('C00001','Ramesh','Chandra','Sharma','Delhi','9543198345','Service','1976-12-06');
INSERT INTO customer VALUES('C00002','Avinash','Sunder','Minha','Delhi','9876532109','Service','1974-10-16');
INSERT INTO customer VALUES('C00003','Rahul',null,'Rastogi','Delhi','9765178901','Student','1981-09-26');
INSERT INTO customer VALUES('C00004','Parul',null,'Gandhi','Delhi','9876532109','Housewife','1976-11-03');
INSERT INTO customer VALUES('C00005','Naveen','Chandra','Aedekar','Mumbai','8976523190','Service','1976-09-19');
INSERT INTO customer VALUES('C00006','Chitresh',null,'Barwe','Mumbai','7651298321','Student','1992-11-06');
INSERT INTO customer VALUES('C00007','Amit','Kumar','Borkar','Mumbai','9875189761','Student','1981-09-06');
INSERT INTO customer VALUES('C00008','Nisha',null,'Damle','Mumbai','7954198761','Service','1975-12-03');
INSERT INTO customer VALUES('C00009','Abhishek',null,'Dutta','Kolkata','9856198761','Service','1973-05-22');
INSERT INTO customer  VALUES('C00010','Shankar',null,'Nair','Chennai','8765489076','Service','1976-07-12');


INSERT INTO branch VALUES('B00001','Asaf ali road','Delhi');
INSERT INTO branch VALUES('B00002','New delhi main branch','Delhi');
INSERT INTO branch VALUES('B00003','Delhi cantt','Delhi');
INSERT INTO branch VALUES('B00004','Jasola','Delhi');
INSERT INTO branch VALUES('B00005','Mahim','Mumbai');
INSERT INTO branch VALUES('B00006','Vile parle','Mumbai');
INSERT INTO branch VALUES('B00007','Mandvi','Mumbai');
INSERT INTO branch VALUES('B00008','Jadavpur','Kolkata');
INSERT INTO branch VALUES('B00009','Kodambakkam','Chennai');

INSERT INTO account VALUES('A00001','C00001','B00001',1000,'2012-12-15','Saving','Active');
INSERT INTO account VALUES('A00002','C00002','B00001',1000,'2012-06-12','Saving','Active');
INSERT INTO account VALUES('A00003','C00003','B00002',1000,'2012-05-17','Saving','Active');
INSERT INTO account VALUES('A00004','C00002','B00005',1000,'2013-01-27','Saving','Active');
INSERT INTO account VALUES('A00005','C00006','B00006',1000,'2012-12-17','Saving','Active');
INSERT INTO account VALUES('A00006','C00007','B00007',1000,'2010-08-12','Saving','Suspended');
INSERT INTO account VALUES('A00007','C00007','B00001',1000,'2012-10-02','Saving','Active');
INSERT INTO account VALUES('A00008','C00001','B00003',1000,'2009-11-09','Saving','Terminated');
INSERT INTO account VALUES('A00009','C00003','B00007',1000,'2008-11-30','Saving','Terminated');
INSERT INTO account VALUES('A00010','C00004','B00002',1000,'2013-03-01','Saving','Active');

INSERT INTO trandetails VALUES('T00001','A00001','2013-01-01','Cheque','Deposit',2000);
INSERT INTO trandetails VALUES('T00002','A00001','2013-02-01','Cash','Withdrawal',1000);
INSERT INTO trandetails VALUES('T00003','A00002','2013-01-01','Cash','Deposit',2000);
INSERT INTO trandetails VALUES('T00004','A00002','2013-02-01','Cash','Deposit',3000);
INSERT INTO trandetails VALUES('T00005','A00007','2013-01-11','Cash','Deposit',7000);
INSERT INTO trandetails VALUES('T00006','A00007','2013-01-13','Cash','Deposit',9000);
INSERT INTO trandetails VALUES('T00007','A00001','2013-03-13','Cash','Deposit',4000);
INSERT INTO trandetails VALUES('T00008','A00001','2013-03-14','Cheque','Deposit',3000);
INSERT INTO trandetails VALUES('T00009','A00001','2013-03-21','Cash','Withdrawal',9000);
INSERT INTO trandetails VALUES('T00010','A00001','2013-03-22','Cash','Withdrawal',2000);
INSERT INTO trandetails VALUES('T00011','A00002','2013-03-25','Cash','Withdrawal',7000);
INSERT INTO trandetails VALUES('T00012','A00007','2013-03-26','Cash','Withdrawal',2000);

INSERT INTO loan VALUES('C00001','B00001',100000);
INSERT INTO loan VALUES('C00002','B00002',200000);
INSERT INTO loan VALUES('C00009','B00008',400000);
INSERT INTO loan VALUES('C00010','B00009',500000);
INSERT INTO loan VALUES('C00001','B00003',600000);
INSERT INTO loan VALUES('C00002','B00001',600000);

/*-------------------- Query with solutions--------------------------------*/



/*1 :Write a query to display the customer number , firstname, customer’s date of birth . 
Display in a sorted order of date of birth year and within that sort by firstname. */

select custid,fname,dob from customer order by dob,fname;

/* 2: Write a query to display customer’s number, first name and middle name.
The customer’s who don’t have middle name, for them display the last name. Give the alias name as Cust_Name.*/
select custid,concat(concat(fname,' '),coalesce(mname,ltname))as Cust_Name from customer;

/* 3: Write a query to display account number, customer’s number, customer’s firstname,
lastname,account opening date.*/
select a.custid,c.fname,c.ltname,a.aod from customer c,account a where a.custid=c.custid;

/* 4:Write a query to display the number of customer’s from Delhi. Give the count an alias name of Cust_Count.*/
select count(*) as Cust_Count from customer where city='delhi';

/* 5:Write a query to display  the customer number, customer firstname,account number for the customer’s whose accounts
were created after 15th of any month. */
select a.custid,c.fname,a.acnumber from account a,customer c where a.custid=c.custid and day(aod)>15;

/* 6:Write a query to display the female customers firstname, city and account number who
are not into business, service or studies.*/
select distinct c.custid,c.fname,c.city,a.acnumber from customer c,account a where a.custid=c.custid and
occupation not in(
select occupation from customer where occupation="service" or occupation="student" or occupation="business");

/* 7:Write a query to display city name and count of branches in that city. 
Give the count of branches an alias name of Count_Branch. */
select bcity,count(*) as Count_Branch from branch group by bcity;

/* 8:Write a query to display account id, customer’s firstname, customer’s lastname for the customer’s whose 
account is Active. */
select a.acnumber,c.custid,c.fname,c.ltname from account a,customer c where a.custid=c.custid and astatus="active";

/* 9: Write a query to display the customer’s number, customer’s firstname, branch id and 
loan amount for people who have taken loans.*/
select l.custid,l.bid,l.loan_amount,c.fname from loan l,customer c where c.custid=l.custid;

/* 10: Write a query to display customer number, customer name, account number where the account status is terminated*/
select a.custid,a.acnumber,c.fname from account a,customer c where a.custid=c.custid and astatus="terminated";

/*---------- Average queries ----------------------*/

/*1:Write a query to display  the total number of  withdrawals and total number of deposits being done by 
customer whose registration is C00001. Give the count an alias name of Trans_Count. */ 
select count(*) as trans_count from trandetails t,account a where t.acnumber=a.acnumber 
and a.custid="C00001";

/* 2:Write a query to display the customer’s number, customer’s firstname, customer’s city and 
branch city where the city of the customer and city of the branch is different. */
select c.custid,c.fname,c.city,b.bcity from branch b inner join customer c inner join account a 
on a.custid=c.custid and a.bid=b.bid where b.bcity<>c.city;

/* 3:Write a query to display the customer number, customer firstname, customer lastname who has taken 
loan from more then 1 bank.*/
select custid,fname,ltname from customer where custid in(
select custid from loan group by custid having count(*)>1);

/*4:Write a query to display the number of client who have asked for loans but they don’t have any account 
in the bank though they are registered customers. Give the count an alias name of Count.*/
select count(*) Count from loan where custid not in
(select distinct custid from account);

/*5:Write a query to display account id, and total amount deposited by each account holder 
( Including the opening balance ). Give the total amount deposited an alias name of Deposit_Amount.*/
select distinct a.acnumber,sum(t.transaction_amount)+a.opening_balance as Deposit_Amount from account a,trandetails t 
where  t.acnumber=a.acnumber and transaction_type="deposit" group by acnumber
union
select acnumber,opening_balance from account where acnumber not in
(select acnumber from trandetails);

/*6:Write a query to the count the number of customers who have registration but no account in the bank.
Give the alias name as Count_Customer.*/
select count(*) as Count_Customer from customer where custid not in
(select distinct custid from account);

/*7: Write a query to display citywise, branchwise count of accounts.
For the branch where we don’t have any records display 0.*/
select b.bcity,count(*) from branch b,account a where b.bid=a.bid group by bcity
union
select bcity,0 from branch where bcity not in
(select bcity from branch b,account a where a.bid=b.bid group by bcity)
union
select b.bid,count(*) from branch b,account a where a.bid=b.bid group by bid
union
select bid,0 from branch where bid not in
(select a.bid from branch b,account a where a.bid=b.bid group by bid);

/* 8:Write  a query to display the customer’s firstname who have more then 1 account*/
select c.fname from customer c,account a where a.custid=c.custid  group by c.fname having count(*)>1 ;

/* 9:Write a query to display the customer’s firstname who have multiple accounts atleast in 2 banks.*/
select c.fname from customer c,account a,branch b where a.custid=c.custid 
and a.bid=b.bid group by c.fname having count(*)>1;

/* 10:Display the customer number, customer name, account number and number of transactions  being made by a customer. 
Give the alias name for number of transactions as Count_Trans*/
select c.custid,c.fname,a.acnumber,count(*) as Count_Trans 
from customer c,account a,trandetails t
where a.custid=c.custid and t.acnumber=a.acnumber 
group by t.acnumber;


/*----------------------Complex Query-------------------------*/


/*1:Write a query to display the  account number who has done the highest transaction.

For example the account A00023 has done 5 transactions i.e. suppose 3 withdrawal and 2 deposits.
Whereas the account A00024 has done 3 transactions i.e. suppose 2 withdrawals and 1 deposit. 
So account number of A00023 should be displayed. */
select acnumber from trandetails t group by acnumber having count(*)=
(select max(c) from
(select count(*)c from trandetails t group by t.acnumber)a
);

/* 2: Write a query to show the branch name,branch city where we have the maximum customers.
For example the branch B00019 has 3 customers, B00020 has 7 and B00021 has 10. 
So branch id B00021 is having maximum customers. B00021 is suppose for Koramangla branch Bangalore.  
So Koramangla branch should be displayed along with city name Bangalore.*/
select bname,bcity,max(m) from(
select b.bid,b.bname,b.bcity,count(*)m from branch b,account a,customer c where
a.custid=c.custid and a.bid=b.bid
group by b.bid)a;

/* 3:Write a query to show the balance amount  for account number A00001. 
Note: Balance amount includes account opening balance also.For example A00015 is having an opening balance of 1000. 
A00015 has deposited 2000 on 2012-06-12 and deposited 3000 on 2012-07-13. 
The same account has drawn money of 500 on 2012-08-12 , 500 on 2012-09-15, 1000 on 2012-12-17. 
So balance amount is 4000 i.e (1000 (opening balance)+2000+3000 ) – (500+500+1000). */
select a.acnumber,(s.de+a.opening_balance)-m.wt as balnce_amount from account a,(
select sum(transaction_amount)de from trandetails where acnumber="A00001" and transaction_type="deposit")s,
(select sum(transaction_amount)wt from trandetails where acnumber="A00001" and transaction_type="withdrawal")m
where a.acnumber="A00001";


-- for diplaying all account records --
select a.acnumber,(s.de+a.opening_balance)-m.wt as balnce_amount from account a,(
select acnumber,sum(transaction_amount)de from trandetails where transaction_type="deposit" group by acnumber)s,
(select acnumber,sum(transaction_amount)wt from trandetails where transaction_type="withdrawal" group by acnumber)m
where a.acnumber=s.acnumber and a.acnumber=m.acnumber
union 
select a.acnumber,opening_balance from account a where acnumber not in
(select acnumber from trandetails);

/* 4:Write a query to display all those account number, deposit, withdrawal where withdrawal is more then deposit amount.
For example A00011 deposited 2000 rupees on 2012-12-01 and 3000 rupees on 2012-12-02. 
The same account i.e A00011 withdrawn 3000 rupees on 2013-01-01 and 7000 rupees on 2013-01-03. 
So the total deposited amount is 5000 and total withdrawal amount is 10000. So withdrawal amount is more then deposited 
for account number A00011.*/
select distinct t.acnumber,d.tr_am as deposit,w.tr_am as withdrawal from trandetails t,
(select acnumber,sum(transaction_amount) as tr_am from trandetails where transaction_type="withdrawal" group by acnumber)w,
(select acnumber,sum(transaction_amount) as tr_am from trandetails where  transaction_type="deposit" group by acnumber)d
where w.tr_am>d.tr_am and w.acnumber=t.acnumber and t.acnumber=d.acnumber;

/* 5: Write a query to display the customer number, firstname, lastname for those client where total loan 
amount taken is maximum and at least taken from 2 banks. 
For example the customer C00012 took a loan of 100000 from bank branch with id B00009 and C00012
Took a loan of 500000 from bank branch with id B00010. So total loan amount for customer C00012 is 
600000. C00013 took a loan of 100000 from bank branch B00009 and 200000 from bank branch B00011.
So total loan taken is 300000. So loan taken by C00012 is more then C00013.
*/

select custid,c.fname,c.ltname from customer c where custid=
(select custid from loan group by custid having sum(loan_amount)=(
select max(c)amt from
(select custid,sum(loan_amount)c from loan group by custid having count(*)>1)l
)
);
     

select custid,fname,ltname
from customer
where custid=(  select custid
                from loan
                group by custid
                having sum(loan_amount)=(  select max(mt)
                                           from (  select custid,sum(loan_amount) mt
                                                   from loan
                                                   group by custid
                                                   having count(*)>1
                                        ) temp
                                )
            );

