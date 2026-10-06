/*
I downloaded a dataset from Kaggle and imported it into SQL
 using the Table Import Wizard. After importing the data, 
 I started exploring and analyzing it using SQL queries.
 */
select * from students;
create database students;
use students;
-- total students

select count(*) from students;

-- gender waise student count

select gender ,count(student_id) as total_students from students

 group by gender order by total_students desc;
 
 -- avg gpa, higest gpa , lowest gpa from students
 
 select avg(previous_gpa) as avg_gpa,min(previous_gpa) as lowest_gpa
,max(previous_gpa) as higest_gpa from students;

-- age group wise students

select count(student_id), case  when age <= 10 then "5-10 years"
		                    	when age <=15 then "10-15 years"
                                when age<=20 then "15-20 years"
                                else "20+ years"
                                end as std_age 
							    from students group by std_age;
                                
-- education level wise students   

select education_level ,count(student_id) as students from 
students group by education_level;

-- school type wise students

select school_type ,count(student_id)as students from 
students group by school_type;  

-- education app usage wise students 

select educational_app_usage ,count(student_id) as students from 
students group by educational_app_usage;    

-- rank wise students

select student_id ,age ,gender ,school_type,education_level,previous_gpa,
previous_exam_score,dense_rank() over(order by previous_exam_score desc) as ranking from students;      

-- who got higgest score in exams

select student_id ,age ,gender,education_level ,previous_exam_score ,previous_gpa
from students where previous_exam_score =(select max(previous_exam_score) from students);

-- who got lowest score in exams

select student_id ,age ,gender,education_level ,previous_exam_score ,previous_gpa
from students where previous_exam_score =(select min(previous_exam_score) from students);

-- who got avg score in exams

select student_id ,age ,gender,education_level ,previous_exam_score ,previous_gpa
from students where previous_exam_score =(select avg(previous_exam_score) from students);


                 