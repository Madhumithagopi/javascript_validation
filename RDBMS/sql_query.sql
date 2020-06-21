SQL> create table Yessr_employee(
  2   em_id int NOT NULL, 
  3   f_name char(20) NOT NULL,
  4   l_name char(20) NOT NULL,
  5   job char(20),mid int , 
  6   dob date, 
  7   hired_date date, 
  8   salary decimal(10,2), 
  9   comm decimal(10,2), 
 10   check(dob< '01-jan-1976'), 
 11   check(salary >= 20000 AND salary <= 100000),
 12   PRIMARY KEY (em_id) ,
 13   FOREIGN KEY (mid) REFERENCES Yessr_employee(em_id)
 14   );

_____________________________________________________________________________________________________

SQL> describe yessr_employee
 Name                                                                            Null?    Type
 ------------------------------------------------------------------------------- -------- --------------------
 EM_ID                                                                           NOT NULL NUMBER(38)
 F_NAME                                                                          NOT NULL CHAR(20)
 L_NAME                                                                          NOT NULL CHAR(20)
 JOB                                                                                      CHAR(20)
 MID                                                                                      NUMBER(38)
 DOB                                                                                      DATE
 HIRED_DATE                                                                               DATE
 SALARY                                                                                   NUMBER(10,2)
 COMM                                                                                     NUMBER(10,2)
_____________________________________________________________________________________________________

2. salary and dob

SQL> select * from yessr_employee where salary > 30000 and dob between '01-jan-1065' and '31-dec-1975';

_____________________________________________________________________________________________________
3.Employees Age less then 30 

SQL> SELECT f_name,l_name from yessr_employee  WHERE (EXTRACT(YEAR FROM SYSDATE))-(EXTRACT(YEAR FROM dob))<30;

_____________________________________________________________________________________________________

4 . Display first name and last name of the Employee where job is Analyst Manager :


SQL> select * from yessr_employee where JOB = 'Analyst Manager';
_____________________________________________________________________________________________________

5.


SQL> select * from yessr_employee where f_name LIKE '%an%';
_____________________________________________________________________________________________________

6.

SQL> select f_name from yessr_employee where f_name LIKE 'S%';

SQL> select f_name from yessr_employee where f_name LIKE 'K%';

_____________________________________________________________________________________________________


7.

SQL> SELECT * FROM Yessr_employee WHERE (EXTRACT(YEAR FROM SYSDATE))-(EXTRACT(YEAR FROM dob))>55;
_____________________________________________________________________________________________________
8.


SQL> select em_id,f_name,l_name,job,salary from yessr_employee where  (salary>=30000) AND (JOB ='Analyst' or JOB = 'Manager');
_____________________________________________________________________________________________________

9.

SQL> select em_id,f_name,l_name,job,salary from yessr_employee where ((salary+comm)>40000) AND (JOB ='Salesman' or JOB = 'Manager');

_____________________________________________________________________________________________________

10.

SQL>  select em_id,f_name,l_name,job,salary from yessr_employee where (JOB = 'Sales' or JOB = 'Programmer');

_____________________________________________________________________________________________________

11.


SQL> select em_id,l_name,salary from yessr_employee where (l_name = 'Kumar' or l_name = 'Manian' or l_name = 'Muthu' or l_name ='Ram');

_____________________________________________________________________________________________________

12.


SQL> select em_id,(EXTRACT(YEAR FROM SYSDATE))-(EXTRACT(YEAR FROM dob)) as age, l_name,salary from yessr_employee where (EXTRACT(YEAR FROM SYSDATE))-(EXTRACT(YEAR FROM dob))>=30 and
  2   (EXTRACT(YEAR FROM SYSDATE))-(EXTRACT(YEAR FROM dob))<=40;
_____________________________________________________________________________________________________

13.


SQL> select * from yessr_employee where mid = any(select em_id from yessr_employee where l_name = 'Ramanan' or l_name = 'Saravanan' or l_name = 'Nadarajan');

_____________________________________________________________________________________________________

14.
SQL>  select * from yessr_employee where job NOT IN ('Analyst Manager','Manager');


_____________________________________________________________________________________________________

15.

SQL> select * from yessr_employee where dob = (select max(dob) from yessr_employee) and comm is NOT NULL;


_____________________________________________________________________________________________________

16.

SQL> select JOB, count(*) as no_of_employees from yessr_employee GROUP BY JOB;
_____________________________________________________________________________________________________

17.

sum without comm : 

SQL> select JOB,count(*) as no_of_employees ,sum(salary) as Salary  from yessr_employee GROUP BY JOB;

_____________________________________________________________________________________________________

18.

SQL> select job, count(*) as no_of_employees, sum(salary) "SALARY" from yessr_employee GROUP BY JOB having sum(salary)>40000;
_____________________________________________________________________________________________________

19.


SQL> select f_name,job,salary from yessr_employee where salary IN (select max(salary) as salary from yessr_employee GROUP BY JOB);

_____________________________________________________________________________________________________
20.

SQL> select f_name,l_name,dob,salary from yessr_employee where to_char(dob,'mon')='jan' or to_char(dob,'mon')='mar' or to_char(dob,'mon')='aug';
_____________________________________________________________________________________________________

21.
SQL>  select EXTRACT(YEAR from hired_date) "Years",count(*) "Hired Employees" from yessr_employee GROUP BY EXTRACT(YEAR from hired_date) ORDER BY EXTRACT(YEAR from hired_date);

_____________________________________________________________________________________________________

22.

22.

SQL> select f_name "Employee Name",l_name "Father Name",job "Designation" from yessr_employee;

_____________________________________________________________________________________________________

23.

SELECT concat(concat(concat('Dear ',f_name),' you were born on'),TO_CHAR( dob, ' DD, DAY-FMMonth-YYYY' )) "Date of Birth Employees" from  yessr_employee;
_____________________________________________________________________________________________________
24.

SQL> select f_name,salary,comm,(salary+nvl(comm,0)) "Total salary" from yessr_employee;

_____________________________________________________________________________________________________

25.


SQL>  select f_name,salary,COALESCE(comm,0) "Commission",(salary+nvl(comm,0)) "Total salary" from yessr_employee;

_____________________________________________________________________________________________________

26.
select concat(concat(concat(concat(concat(concat(f_name,job),' earn Rs. '),salary),' with Rs.'),nvl(comm,0)),' as Commission')  "CONCATENATION" from yessr_employee;

_____________________________________________________________________________________________________


27.
SQL> select * from yessr_employee where hired_date in(select min(hired_date) from yessr_employee group by job) and job in(select distinct job from yessr_employee);

_____________________________________________________________________________________________________

28.

select concat(concat(concat(concat(upper(concat(concat(concat(f_name,job),' earn Rs. '),salary)),' with Rs.'),nvl(comm,0)),' as'),upper(' Commission')) "CONCATENATION" from yessr_employee;

_____________________________________________________________________________________________________

29.


SQL> select * from yessr_employee where (job = 'Analyst Manager' or job = 'Manager') and salary>40000 and EXTRACT(YEAR from dob) < 1972;

_____________________________________________________________________________________________________

30.

SQL>  select * from yessr_employee where  salary between 20000 and 35000 AND nvl(comm,0) = 0;

_____________________________________________________________________________________________________

31.


SQL> select f_name "employee name",hired_date from yessr_employee;

_____________________________________________________________________________________________________

32.

SQL> select * from yessr_employee where EXTRACT(YEAR from hired_date) = 1981 or  EXTRACT(YEAR from hired_date) = 1982;
_____________________________________________________________________________________________________

33.


SQL> select f_name "Name",hired_date "Start Date" from yessr_employee;

_____________________________________________________________________________________________________

34.


SQL> select f_name "Name",hired_date "Start Date" from yessr_employee order by hired_date;
_____________________________________________________________________________________________________

35.


SQL> select job,sum(salary) "Total Salary", sum(nvl(comm,0))"Total Commission" from yessr_employee group by job;
