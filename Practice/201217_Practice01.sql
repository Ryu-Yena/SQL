--문제 1
select first_name 이름,
       salary 월급,
       phone_number 전화번호,
       hire_date 입사일
from employees
order by hire_date asc;

--문제2
select job_id as job_title,
       salary as max_salary
from employees
order by salary desc;

--문제3
select *
from employees
where in (manager_id, commission_pct is null, salary > 3000);
