/************************
그룹함수
************************/

--오류 : 그룹함수 표시 컬럼이 하나
select avg(salary), 
       first_Name
from employees;

--따라서, 평균 표시 시
select avg(salary)
from employees;

--그룹함수 count()
select count(*) --null을 포함한 개수
from employees;

select count(commission_pct) --commission_pct의 null값 제외하고 카운트
from employees;

select count(*)
from employees
where salary > 16000;

--그룹함수 sum()
select sum(salary),count(*)
from employees;

--그룹함수 - avg() null일때 0으로 변환
select count(*),
       sum(salary),
       avg(salary)
from employees;

select count(*),
       sum(salary),
       avg(nvl(salary,0))
from employees;

--그룹함수 - max() / min()
select max(salary)
from employees;

select min(salary)
from employees;

--정렬이 필요한 경우 많은 연상을 수행해야 한다.
select max(salary),
       min(salary),
       count(*)
from employees;

/****
*group by 절
****/

select department_id,
       salary
from employees
order by department_id;

select department_id,
       avg(salary)
from employees
group by department_id;

--group by 절 자주하는 오류
select department_id, 
       count(*), 
       sum(salary),
       job_id
from employees
group by department_id;

--수정
select department_id, 
       count(*), 
       sum(salary),
       job_id
from employees
group by department_id, job_id
order by department_id asc;


--[예제]
--연봉(salary)의 합계가 20000 이상인 부서의 부서 번호와 , 인원수, 급여합계를 출력하세요
select department_id,
       count(*),
       sum(salary)
from employees
where sum(salary) >= 20000
group by department_id;  --where절에는 그룹함수를 사용할 수 없다.

--having 절사용
select department_id,
       count(*),
       sum(salary)
from employees
group by department_id
having sum(salary) >= 20000
and department_id =100;

--CASE ~ END 문
select employee_id,
       salary,
       job_id,
       case when job_id = 'AC_ACCOUNT' then salary * 0.1
            when job_id = 'SA_REP' then salary * 0.2
            when job_id = 'ST_CLERK' then salary * 0.3
            else salary*0
       end bonus
from employees;

--DECODE문
select employee_id,
       salary,
       job_id,
       decode(
         job_id, 'AC_ACCOUNT', salary * 0.1 , 
                 'SA_REP', salary * 0.2, 
                 'ST_CLERK', salary * 0.3, 
                 salary*0) bonus
from employees;


select *
from employees