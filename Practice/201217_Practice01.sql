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
select first_name,
       manager_id,
       commission_pct,
       salary
from employees
where manager_id is not null and commission_pct is null and salary > 3000;

--문제4
select job_id job_title,
       salary max_salary
from employees
where salary >= 10000
order by salary desc;

--문제5
select first_name,
       salary,
       nvl(commission_pct, 0)
from employees
where salary between 10000 and 14000
order by salary asc;

--문제6
select first_name,
       salary,
       to_char( hire_date, 'YYYY-MM'),
       department_id
from employees
where department_id in (10,90,100);

--문제7
select first_name, salary
from employees
where first_name like 'S%' OR first_name like '%s%';

--문제8
select job_id
from employees
order by length(job_id) desc;

--문제9
select *
from employees;

--문제10
select first_name,
       salary,
       replace(phone_number,'.','-'),
       hire_date
from employees
where hire_date < '03/12/31';
