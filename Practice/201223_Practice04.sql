/* subquery SQL 문제 */

--문제1
--평균 급여보다 적은 급여를 받는 직원은 몇명인지 구하시오.
--1. 평균급여
select avg(salary)
from employees;

--2. 평균보다 적은 급여를 받는 직원
select first_name
from employees
where salary < 6461.83;

--3. 조합
select count(salary)
from employees
where salary < (select avg(salary)
                from employees);
                
--문제2
--평균급여 이상, 최대급여 이하의 월급을 받는 사원의 직원번호(employee_id), 이름(first_name), 
--급여(salary), 평균급여, 최대급여를 급여의 오름차순으로 정렬하여 출력하세요
--1. 평균급여
select avg(salary)
from employees;

--2. 최대급여
select max(salary)
from employees;

--3. 평균이상 직원리스트
select employee_id,
       first_name,
       salary,
from employees
where salary >= 6461.83;

--4. 최대급여 이하 직원리스트
select employee_id,
       first_name,
       salary
from employees
where salary <= 24000;

--5. 조합
select employee_id,
       first_name,
       salary
from employees
where salary >= all (select avg(salary)
                  from employees)
order by salary asc;


--문제3
-- 직원중 Steven(first_name) king(last_name)이 소속된 부서(departments)가 있는 곳의 주소를 알아보려고 한다.
-- 도시아이디(location_id), 거리명(street_address), 우편번호(postal_code), 도시명(city),
-- 주(state_province), 나라아이디(country_id) 를 출력하세요
-- 1. steven king이 소속된 부서
select first_name,
       last_name,
       department_id
from employees
where first_name = 'Steven'
and last_name = 'King'; --department_id = 90

--2. 90부서의 주소
select de.location_id,
       lo.street_address,
       lo.postal_code,
       lo.city,
       lo.state_province,
       lo.country_id
from departments de, locations lo
where de.location_id = lo.location_id
and de.department_id = 90;

--3. 조건합치기
select lo.location_id,
       lo.street_address,
       lo.postal_code,
       lo.city,
       lo.state_province,
       lo.country_id
from locations lo, departments de
where de.location_id = lo.location_id
and (de.department_id) in (select department_id
                           from employees
                           where first_name = 'Steven'
                           and last_name = 'King');

--문제4
--job_id 가 'ST_MAN' 인 직원의 급여보다 작은 직원의 사번,이름,급여를
--급여의 내림차순으로 출력하세요 -ANY연산자 사용
--1. job_id가 'ST_MAN'인 직원
select job_id,
       first_name,
       salary
from employees
where job_id = 'ST_MAN'; --제일 높은 8200보다 낮은 급여

--2. 8200보다 낮은 급여 리스트
select employee_id,
       first_name,
       salary
from employees
where salary < 8200;

--3. 조건 합치기
select employee_id,
       first_name,
       salary
from employees
where salary < any (select salary
                    from employees
                    where job_id = 'ST_MAN')
order by salary desc;

--문제5
--각 부서별로 최고의 급여를 받는 사원의 직원번호(employee_id), 이름(first_name)과 급여(salary) 부서번호(department_id)
--단 조회결과는 급여의 내림차순으로 정렬되어 나타나야 합니다. 조건절비교, 테이블조인 2가지 방법으로 작성하세요
--1. 각부서별로 최고의 급여
select max(salary)
from employees
group by department_id;

--2. 최고의 급여를 받는 사원의 리스트
select employee_id,
       first_name,
       salary,
       department_id
from employees
group by department_id
having max(salary);
