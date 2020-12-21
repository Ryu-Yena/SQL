--문제1
select count(manager_id)
from employees;

--문제2
select max(salary) "최고임금",
       min(salary) "최저임금",
       max(salary)-min(salary) "최고임금 - 최저임금"
from employees;

--문제3
select to_char(max(hire_date), 'YYYY"년" MM"월" DD"일"')
from employees;

--문제4
select avg(salary),
       max(salary),
       min(salary)
from employees
group by department_id;

--문제5
select avg(salary)
from employees
group by job_id;

select *
from employees;

select *
from employees;