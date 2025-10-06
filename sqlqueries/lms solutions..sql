use lms;
Create table LMS_MEMBERS
(
	MEMBER_ID Varchar(10),
	MEMBER_NAME Varchar(30) NOT NULL,
	CITY Varchar(20),
	DATE_REGISTER Date NOT NULL,
	DATE_EXPIRE Date ,
	MEMBERSHIP_STATUS Varchar(15)NOT NULL,
	Constraint LMS_cts1 PRIMARY KEY(MEMBER_ID)
);
Create table LMS_SUPPLIERS_DETAILS
(
	SUPPLIER_ID Varchar(3),
	SUPPLIER_NAME Varchar(30) NOT NULL,
	ADDRESS	Varchar(50),
	CONTACT bigint(10) NOT NULL,
	EMAIL Varchar(15) NOT NULL,
	Constraint LMS_cts2 PRIMARY KEY(SUPPLIER_ID)
);
Create table LMS_FINE_DETAILS
(
	FINE_RANGE Varchar(3),
	FINE_AMOUNT decimal(10,2) NOT NULL,
	Constraint LMS_cts3 PRIMARY KEY(FINE_RANGE)
);
Create table LMS_BOOK_DETAILS
(
	BOOK_CODE Varchar(10),	
	BOOK_TITLE Varchar(50) NOT NULL,
	CATEGORY Varchar(15) NOT NULL,
	AUTHOR Varchar(30) NOT NULL,
	PUBLICATION Varchar(30),
	PUBLISH_DATE Date,
	BOOK_EDITION int(2),
	PRICE decimal(8,2) NOT NULL,	
	RACK_NUM Varchar(3),
	DATE_ARRIVAL Date NOT NULL, 		
	SUPPLIER_ID Varchar(3) NOT NULL,
	Constraint LMS_cts4 PRIMARY KEY(BOOK_CODE), 
        Constraint LMS_cts41 FOREIGN KEY(SUPPLIER_ID) References LMS_SUPPLIERS_DETAILS(SUPPLIER_ID)
);
Create table LMS_BOOK_ISSUE
(
	BOOK_ISSUE_NO int,
	MEMBER_ID Varchar(10) NOT NULL,
	BOOK_CODE Varchar(10) NOT NULL,
	DATE_ISSUE Date NOT NULL,
	DATE_RETURN Date NOT NULL,
        DATE_RETURNED Date NULL,
	FINE_RANGE Varchar(3),
	Constraint LMS_cts5 PRIMARY KEY(BOOK_ISSUE_NO),
        Constraint LMS_Mem FOREIGN KEY(MEMBER_ID) References LMS_MEMBERS(MEMBER_ID),
        Constraint LMS_BookDetail FOREIGN KEY(BOOK_CODE) References LMS_BOOK_DETAILS(BOOK_CODE),
	Constraint LMS_FineDetail FOREIGN KEY(FINE_RANGE) References LMS_FINE_DETAILS(FINE_RANGE)
);
Insert into LMS_MEMBERS
Values('LM001', 'AMIT', 'CHENNAI', '2012-02-12', '2013-02-11','Temporary');
Insert into LMS_MEMBERS
Values('LM002', 'ABDHUL', 'DELHI', '2012-04-10', '2013-04-09','Temporary');
Insert into LMS_MEMBERS
Values('LM003', 'GAYAN', 'CHENNAI', '2012-05-13','2013-05-12', 'Permanent');
Insert into LMS_MEMBERS
Values('LM004', 'RADHA', 'CHENNAI', '2012-04-22', '2013-04-21', 'Temporary');
Insert into LMS_MEMBERS
Values('LM005', 'GURU', 'BANGALORE', '2012-03-30', '2013-05-16','Temporary');
Insert into LMS_MEMBERS
Values('LM006', 'MOHAN', 'CHENNAI', '2012-04-12', '2013-05-16','Temporary');


Insert into  LMS_SUPPLIERS_DETAILS 
Values ('S01','SINGAPORE SHOPPEE', 'CHENNAI', 9894123555,'sing@gmail.com');
Insert into  LMS_SUPPLIERS_DETAILS 
Values ('S02','JK Stores', 'MUMBAI', 9940123450 ,'jks@yahoo.com');
Insert into  LMS_SUPPLIERS_DETAILS 
Values ('S03','ROSE BOOK STORE', 'TRIVANDRUM', 9444411222,'rose@gmail.com');
Insert into  LMS_SUPPLIERS_DETAILS 
Values ('S04','KAVARI STORE', 'DELHI', 8630001452,'kavi@redif.com');
Insert into  LMS_SUPPLIERS_DETAILS 
Values ('S05','EINSTEN BOOK GALLARY', 'US', 9542000001,'eingal@aol.com');
Insert into  LMS_SUPPLIERS_DETAILS 
Values ('S06','AKBAR STORE', 'MUMBAI',7855623100 ,'akbakst@aol.com');

Insert into LMS_FINE_DETAILS Values('R0', 0);
Insert into LMS_FINE_DETAILS Values('R1', 20);
insert into LMS_FINE_DETAILS Values('R2', 50);
Insert into LMS_FINE_DETAILS Values('R3', 75);
Insert into LMS_FINE_DETAILS Values('R4', 100);
Insert into LMS_FINE_DETAILS Values('R5', 150);
Insert into LMS_FINE_DETAILS Values('R6', 200);

Insert into LMS_BOOK_DETAILS
Values('BL000001', 'Java How To Do Program', 'JAVA', 'Paul J. Deitel', 'Prentice Hall', '1999-12-10', 6, 600.00, 'A1', '2011-05-10', 'S01');
Insert into LMS_BOOK_DETAILS
Values('BL000002', 'Java: The Complete Reference ', 'JAVA', 'Herbert Schildt',  'Tata Mcgraw Hill ', '2011-10-10', 5, 750.00, 'A1', '2011-05-10', 'S03');
Insert into LMS_BOOK_DETAILS 
Values('BL000003', 'Java How To Do Program', 'JAVA', 'Paul J. Deitel', 'Prentice Hall', '1999-05-10', 6, 600.00, 'A1', '2012-05-10', 'S01');
Insert into LMS_BOOK_DETAILS
Values('BL000004', 'Java: The Complete Reference ', 'JAVA', 'Herbert Schildt', 'Tata Mcgraw Hill ', '2011-10-10', 5, 750.00, 'A1', '2012-05-11', 'S01');
Insert into LMS_BOOK_DETAILS 
Values('BL000005', 'Java How To Do Program', 'JAVA', 'Paul J. Deitel',  'Prentice Hall', '1999-12-10', 6, 600.00, 'A1', '2012-05-11', 'S01');
Insert into LMS_BOOK_DETAILS
Values('BL000006', 'Java: The Complete Reference ', 'JAVA', 'Herbert Schildt', 'Tata Mcgraw Hill ', '2011-10-10', 5, 750.00, 'A1', '2012-05-12', 'S03');
Insert into LMS_BOOK_DETAILS 
Values('BL000007', 'Let Us C', 'C', 'Yashavant Kanetkar ', 'BPB Publications', '2010-12-11',  9, 500.00 , 'A3', '2010-11-03', 'S03');
Insert into LMS_BOOK_DETAILS 
Values('BL000008', 'Let Us C', 'C', 'Yashavant Kanetkar ','BPB Publications', '2010-05-12',  9, 500.00 , 'A3', '2011-08-09', 'S04');



Insert into LMS_BOOK_ISSUE 
Values (001, 'LM001', 'BL000001', '2012-05-01', '2012-05-16', '2012-05-16', 'R0');
Insert into LMS_BOOK_ISSUE 
Values (002, 'LM002', 'BL000002', '2012-05-01', '2012-05-06','2012-05-16', 'R2');
Insert into LMS_BOOK_ISSUE
Values (003, 'LM003', 'BL000007', '2012-04-01', '2012-04-16', '2012-04-20','R1');
Insert into LMS_BOOK_ISSUE 
Values (004, 'LM004', 'BL000005', '2012-04-01', '2012-04-16','2012-04-20', 'R1');
Insert into LMS_BOOK_ISSUE 
Values (005, 'LM005', 'BL000008', '2012-03-30', '2012-04-15','2012-04-20' , 'R1');
Insert into LMS_BOOK_ISSUE 
Values (006, 'LM005', 'BL000008', '2012-04-20', '2012-05-05','2012-05-05' , 'R0');
Insert into LMS_BOOK_ISSUE 
Values (007, 'LM003', 'BL000007', '2012-04-22', '2012-05-07','2012-05-25' , 'R4');



/*-------------------Simple qry with solutions------------------------*/

/* Problem # 1:
Write a query to display the member id, member name, city and membership status who are all having life time membership.
Hint: Life time membership status is “Permanent”.*/
select member_id,member_name,city,membership_status from lms_members
where membership_status="permanent";


/*Problem # 2:
Write a query to display the member id, member name who have not returned the books. 
Hint: Book return status is book_issue_status ='Y' or 'N'.*/
select member_id from lms_members where member_id not in
(select member_id from lms_book_issue where date_returned is not null);

/*Problem # 3:
Write a query to display the member id, member name who have taken the book with book code 'BL000002'.*/
select b.member_id,m.member_name from lms_members m,lms_book_issue b
where b.member_id=m.member_id and b.book_code="BL000002";


/*Problem # 4:
Write a query to display the book code, book title and author of the books whose author name begins with 'P'.*/
select book_code,book_title,author from lms_book_details 
where author like "p%";

/*Problem # 5:
Write a query to display the total number of Java books available in library with alias name ‘NO_OF_BOOKS’.*/
select distinct count(*) as 'NO_OF_BOOKS'  from lms_book_details 
where category = 'JAVA' group by category;

/*Problem # 6:
Write a query to list the category and number of books in each category with alias name ‘NO_OF_BOOKS’.*/
select count(*) as 'NO OF BOOKS',category from lms_book_details
group by category;

/*Problem # 7:
Write a query to display the number of books published by "Prentice Hall” with the alias name “NO_OF_BOOKS”.*/
select count(*) as 'NO OF BOOKS' from lms_book_details
where publication='Prentice Hall' group by publication;

/* Problem # 8:
Write a query to display the book code, book title of the books which are issued on the date "1st April 2012".*/
select i.book_code,d.book_title from lms_book_details d,lms_book_issue i 
where i.book_code=d.book_code and i.date_issue like '2012-04-01';

/*Problem # 9:
Write a query to display the member id, member name, date of registration and expiry date of the members 
whose membership expiry date is before APR 2013.*/
select member_id from lms_members where date_expire<"2013-04-01";


/* Problem # 10:
write a query to display the member id, member name, date of registration, membership status of 
the members who registered before "March 2012" and membership status is "Temporary"*/
select member_id,member_name,date_register,membership_status
from lms_members where membership_status="temporary" and date_register>"2012-03-01";


/*Problem #11:
Write a query to display the member id, member name who’s City is CHENNAI or DELHI. Hint:
Display the member name in title case with alias name 'Name'.*/
select member_id,member_name as 'name' from lms_members
where city="chennai" or city="delhi";

/*Problem #12:
Write a query to concatenate book title, author and display in the following format.
Book_Title_is_written_by_Author
Example: Let Us C_is_written_by_Yashavant Kanetkar
Hint: display unique books. Use “BOOK_WRITTEN_BY” as alias name.*/
select concat(book_title,'is written by',author) as 'book_written_by'
from lms_book_details;

/*Problem #13:
Write a query to display the average price of books which is belonging to ‘JAVA’ category with alias 
name “AVERAGEPRICE”.*/
select avg(price) from lms_book_details 
where category="java";

/*Problem #14:
Write a query to display the supplier id, supplier name and email of the suppliers who are all having gmail account.*/
select supplier_id,supplier_name,email 
from lms_suppliers_details
where email like "%@gmail.com";

/*Problem#15:
Write a query to display the supplier id, supplier name and contact details.
Contact details can be either phone number or email or address with alias name “CONTACTDETAILS”. 
If phone number is null then display email, even if email also null then display the address of the supplier.
Hint: Use Coalesce function.*/
select supplier_id,supplier_name,coalesce(cast(contact as char),cast(email as char),cast(address as char)) as 'Contact'
from lms_suppliers_details;

/*Problem#16:
Write a query to display the supplier id, supplier name and contact. 
If phone number is null then display ‘No’ else display ‘Yes’ with alias name “PHONENUMAVAILABLE”. Hint: Use NVL2.*/

select supplier_id,supplier_name,
 case
when contact is null then 'no'
else
'yes'
end as 'phoneavailable'
from lms_suppliers_details;



/*----------------------Average query-------------------------------------*/
/*Problem # 1:
Write a query to display the member id, member name of the members, book code and book title of the books taken 
by them.*/
select m.member_id,m.member_name,d.book_code,d.book_title
from lms_members m,lms_book_issue i,lms_book_details d
where d.book_code=i.book_code and m.member_id=i.member_id;

/*Problem # 2:
Write a query to display the total number of books available in the library with alias name “NO_OF_BOOKS_AVAILABLE” 
(Which is not issued). Hint: The issued books details are available in the LMS_BOOK_ISSUE table.*/
select count(*) as 'NO_of_books' from lms_book_details where book_code not in 
(select book_code from lms_book_issue) group by book_code;

/*Problem # 3:
Write a query to display the member id, member name, fine range and fine amount of the members 
whose fine amount is less than 100.*/
select m.member_id,m.member_name,f.fine_range,f.fine_amount
from lms_fine_details f,lms_members m,lms_book_issue i
where i.member_id=m.member_id and i.fine_range=f.fine_range
and f.fine_amount<100;

/* Problem # 4:
Write a query to display the book code, book title and availability status of the ‘JAVA’ books whose edition is "6”.
Show the availability status with alias name “AVAILABILITYSTATUS”. Hint: Book availability status can be fetched 
from “BOOK_ISSUE_STATUS” column of LMS_BOOK_ISSUE table.*/
select book_code,book_title from lms_book_details
where book_edition=6;
-- no status available see from amol solutions--

/*Problem # 5:
Write a query to display the book code, book title and rack number of the books which are placed in rack 'A1' 
and sort by book title in ascending order.*/
select book_code,book_title,rack_num
from lms_book_details
where rack_num='A1'
order by book_tlms_memberslms_membersitle asc;

/*Problem # 6:
Write a query to display the member id, member name, due date and date returned of the members who has returned 
the books after the due date. Hint: Date_return is due date and Date_returned is actual book return date.*/
select member_id,date_return,date_returned
from lms_book_issue
where date_returned>date_return;

/*Problem # 7:
Write a query to display the member id, member name and date of registration who 
have not taken any book.*/

select member_id,member_name,date_register
from lms_members where member_id not in
(select member_id from lms_book_issue);


/*Problem # 8:
Write a Query to display the member id and member name of the members who has not paid any fine 
in the year 2012.*/
select b.member_id,m.member_name from lms_book_issue b,lms_fine_details f,lms_members m
where b.fine_range=f.fine_range and b.member_id=m.member_id 
and f.fine_range="R0" and b.date_returned like "2012-%-%";

/*Problem # 9:
Write a query to display the date on which the maximum numbers of books were issued and
 the number of books issued with alias name “NOOFBOOKS”.*/
select distinct date_issue,count(*) as 'NOOFBOOKS' from lms_book_issue 
group by date_issue having date_issue in
(select date_issue from lms_book_issue group by date_issue having count(*) in
(select max(c) from
(select count(*)c from lms_book_issue 
group by date_issue)a
)
);


/*Problem # 10:
Write a query to list the book title and supplier id for the books authored by “Herbert Schildt" 
and the book edition is 5 and supplied by supplier ‘S01’.*/
select d.book_title,s.supplier_id from lms_book_details d,lms_suppliers_details s
where d.supplier_id=s.supplier_id and d.author="herbert Schildt"
and d.book_edition='5' and s.supplier_id="S01";

/*Problem # 11:
Write a query to display the rack number and the number of books in each rack with alias
 name “NOOFBOOKS” and sort by rack number in ascending order.*/
select rack_num,count(*) as 'noofbooks' from lms_book_details group by rack_num asc;

/*Problem # 12:
Write a query to display book issue number, member name, date or registration, date of expiry, 
book title, category author, price, date of issue, date of return, actual returned date, issue status, 
fine amount.*/
select s.book_issue_no,m.member_name,m.date_register,m.date_expire,d.book_title,d.category,d.author
,d.price,s.date_issue,s.date_return,s.date_returned,f.fine_amount
from lms_book_details d,lms_members m,lms_fine_details f,lms_book_issue s
where d.book_code=s.book_code and s.member_id=m.member_id
and f.fine_range=s.fine_range;

/*Problem # 13:
Write a query to display the book code, title, publish date of the books which is 
been published in the month of December.*/
select book_code,book_title,publish_date 
from lms_book_details
where publish_date like "%-12-%";

/*Problem # 14:
Write a query to display the book code, book title and availability status of the ‘JAVA’ books 
whose edition is "5”. Show the availability status with alias name “AVAILABILITYSTATUS”.
 Hint: Book availability status can be fetched from “BOOK_ISSUE_STATUS” column of LMS_BOOK_ISSUE table.*/
select d.book_code,d.book_title,i.book_issue_status as 'AVAILABILITYSTATUS'
from lms_book_details d,lms_book_issue i
where d.book_code=i.book_code and d.book_edition="5"
and d.category="java";

/*--------------COMPLEX QUERY---------------------------*/

/*Problem # 1:
Write a query to display the book code, book title and supplier name of the supplier who 
has supplied maximum number of books. For example, if “ABC Store” supplied 3 books, 
“LM Store” has supplied 2 books and “XYZ Store” has supplied 1 book. So “ABC Store” has supplied 
maximum number of books, hence display the details as mentioned below.
Example:BOOK_CODE BOOK_TITLE SUPPLIER_NAME
BL000008 Easy Reference for Java ABC STORE
BL000001 Easy Reference for C ABC STORE
BL000003 Easy Reference for VB ABC STORE*/
select d.book_code,d.book_title,s.supplier_name 
from lms_book_details d,lms_suppliers_details s
where s.supplier_id=d.supplier_id and s.supplier_id in
(select supplier_id from lms_book_details group by supplier_id having count(*)=
(select max(c) from
(select count(*)c from lms_book_details group by supplier_id)a
)
);

/*Problem # 2:
Write a query to display the member id, member name and number of remaining books he/she
 can take with “REMAININGBOOKS” as alias name. Hint: Assuming a member can take maximum 3 books. 
For example, Ramesh has already taken 2 books; he can take only one book now. 
Hence display the remaining books as 1 in below format.
Example:MEMBER_ID MEMBER_NAME REMAININGBOOKS
LM001 RAMESH 1
LM002 MOHAN 3*/
select s.member_id,m.member_name,3-count(*) as 'Remainingbooks'
from lms_book_issue s,lms_members m
where m.member_id=s.member_id
group by s.book_code;

/*Problem # 3
Write a query to display the supplier id and supplier name of the supplier who has 
supplied minimum number of books. For example, if “ABC Store” supplied 3 books, “LM Store” has supplied 
2 books and “XYZ Store” has supplied 1 book. So “XYZ Store” has supplied minimum number of books,
 hence display the details as mentioned below.
Example:
SUPPLIER_ID SUPPLIER_NAME
S04 XYZ STORE*/
select s.supplier_id,s.supplier_name
from lms_book_details d,lms_suppliers_details s
where s.supplier_id=d.supplier_id and d.supplier_id=
(select supplier_id from lms_book_details group by supplier_id having count(*)=
(select min(c) from
(select count(*)c from lms_book_details group by supplier_id)a
)
);