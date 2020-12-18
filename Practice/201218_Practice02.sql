--문제1
select count(manager_id)
from employees;

--문제2
select max(salary) "최고임금",
       min(salary) "최저임금",
       max(salary)-min(salary) "최고임금 - 최저임금"
from employees;

--문제3
select to_char(max(hire_date), 'YYYY년 MM월 DD일')
from employees;

select *
from employees;


select *
from employees;


select *
from employees;

select *
from employees;