create database pws;

use pws;

create table Student_Performance (
Student_Id int primary key,
Name varchar (50),
Course varchar (30),
Score int,
Attendance int,
Mentor varchar (50),
Join_date  date,
City varchar (50)
);

insert into student_performance (Student_Id,Name,Course,Score,Attendance,Mentor,Join_date,City)
values
(101, 'Aarav Mehta', 'Data Science', 88, 92, 'Dr. Sharma', '2023-06-12', 'Mumbai'),
(102, 'Riya Singh', 'Data Science', 76, 85, 'Dr. Sharma', '2023-07-01', 'Delhi'),
(103, 'Kabir Khanna', 'Python', 91, 96, 'Ms. Nair', '2023-06-20', 'Mumbai'),
(104, 'Tanvi Patel', 'SQL', 84, 89, 'Mr. Iyer', '2023-05-30', 'Bengaluru'),
(105, 'Ayesha Khan', 'Python', 67, 81, 'Ms. Nair', '2023-07-10', 'Hyderabad'),
(106, 'Dev Sharma', 'SQL', 73, 78, 'Mr. Iyer', '2023-05-28', 'Pune'),
(107, 'Arjun Verma', 'Tableau', 95, 98, 'Ms. Kapoor', '2023-06-15', 'Delhi'),
(108, 'Meera Pillai', 'Tableau', 82, 87, 'Ms. Kapoor', '2023-06-18', 'Kochi'),
(109, 'Nikhil Rao', 'Data Science', 79, 82, 'Dr. Sharma', '2023-07-05', 'Chennai'),
(110, 'Priya Desai', 'SQL', 92, 94, 'Mr. Iyer', '2023-05-27', 'Bengaluru'),
(111, 'Siddharth Jain', 'Python', 85, 90, 'Ms. Nair', '2023-07-02', 'Mumbai'),
(112, 'Sneha Kulkarni', 'Tableau', 74, 83, 'Ms. Kapoor', '2023-06-10', 'Pune'),
(113, 'Rohan Gupta', 'SQL', 89, 91, 'Mr. Iyer', '2023-05-25', 'Delhi'),
(114, 'Ishita Joshi', 'Data Science', 93, 97, 'Dr. Sharma', '2023-06-25', 'Bengaluru'),
(115, 'Yuvraj Rao', 'Python', 71, 84, 'Ms. Nair', '2023-07-12', 'Hyderabad');

select	 * from student_performance;


# Question 1 : Create a ranking of students based on score (highest first).

select
Student_Id,
Name,
Score,
rank() over(order by Score desc) as Merit_wise_Rank
from student_performance;


# Question 2 : Show each student's score and the previous student’s score (based on score order).

select
Student_Id,
Name,
Score,
lag (score) over(order by score desc) as Prvs_Stdt_Score
from student_performance;


# Question 3 : Convert all student names to uppercase and extract the month name from join_date.

select upper(name) as UpperCase_Name,
monthname(join_date) as Join_Month
from student_performance;


# Question 4 : Show each student's name and the next student’s attendance (ordered by attendance).

select Student_Id,
Name,
Attendance,
lead(Attendance) over (order by Attendance asc) as Next_Attendance
from student_performance;


# Question 5 : Assign students into 4 performance groups using NTILE().

select Name,
Score,
ntile(4) over (order by Score desc) as Grp
from student_performance;


# Question 6 : For each course, assign a row number based on attendance (highest first).

select row_number() over( partition by course order by Attendance desc) as Row_Nmbr,
Name,
Course,
Attendance
from student_performance;


# Question 7 : Calculate the number of days each student has been enrolled (from join_date to today). (Assume current date = '2025-01-01')

select 
Student_Id,
Name,
Course,
Join_Date,
datediff('2025-01-01' , Join_date) as Enroll_Days
from student_performance;


# Question 8 : Format join_date as “Month Year” (e.g., “June 2023”).

select Name,
date_format(join_date, '%M %Y')
from student_performance;


# Question 9 : Replace the city ‘Mumbai’ with ‘MUM’ for display purposes.

select 
city,
left(city,3) as First_3_Char
from student_performance;


# Question 10 : For each course, find the highest score using FIRST_VALUE().

select
Name,
course,
Score,
first_value(score) over (partition by course order by score desc) as Highest_Score
from student_performance;