--셀렉트문
/* 멀티주석
*/
select * from employees;

select * from departments;

--원하는 컬럼 조회하기
select employee_id, 
       first_name, 
       last_name 
from employees;

--사원의 이름(first_name)과 전화번호 입사일 연봉을 출력하시오
select first_name,
       phone_number,
       hire_date,
       salary
from employees;

--사원의 이름(first_name)과 성(last_name) 급여, 전화번호, 이메일, 입사일을 출력하시오
select first_name,
       last_name,
       salary,
       phone_number,
       email,
       hire_date
from employees;

/*출력할 때 컬럼에 별명 사용하기*/
select employee_id as empNo,
       first_name "f-name", --as 생략가능, 대소문자 구분, 특수문자, 공백 등이 필요할 시, " " 사용
       salary "연봉"
from employees;

--사원의 이름(first_name)과 전화번호 입사일 급여로 표시되도록 출력하세요
select first_name as "이름",
       phone_number as "전화번호",
       hire_date as "입사일",
       salary as "급여"
from employees;

--사원의 사원번호 이름(first_name)과 성(last_name) 급여 전화번호 이메일 입사일로 표시되도록 출력하세요
select first_name as "이름",
       last_name as "성",
       salary as "급여",
       phone_number as "전화번호",
       email as "이메일",
       hire_date as "입사일"
from employees;

/* 연결 연산자(Concatenation)로 컬럼들 붙이기 */
select first_name || last_name
from employees;

select first_name || '  ' || last_name as name --중간에 공백을 추가함
from employees; 

select first_name || ' ''hire date is''  ' || hire_date
from employees;

--산술 연산자 사용하기
select first_name, salary
from employees;

select first_name,
       salary,
       salary*12
from employees;

select first_name,
       salary as 연봉,
       (salary+300)*12
from employees;

--문자열 산술연산 되지 않음
select job_id
from employees;

/* 예제
   전체직원의 정보를 다음과 같이 출력하세요 */
   
select first_name || '-' || last_name as "성명",
       salary as "급여",
       (salary*12) as "연봉",
       (salary*12+5000) as "연봉2",
       phone_number as "전화번호"
from employees;

/* select문에서 where 절 */
select first_name
from employees
where department_id = 10;

--연봉이 15000 이상인 사원들의 이름과 연봉을 출력하세요
select first_name,
       salary
from employees
where salary >=15000;

--07/01/01 일 이후에 입사한 사원들의 이름과 입사일을 출력하세요
select first_name,
       hire_date
from employees
where hire_date >= '07/01/01';

--이름이 Lex인 직원의 연봉을 출력하세요
select salary
from employees
where first_name = 'Lex';

--조건이 2개 이상일 때 한꺼번에 조회하기
select first_name,
       salary
from employees
where salary >= 14000
and salary <= 17000;

--연봉이 14000 이하 이거나 17000 이상인 사원의 이름과 연봉을 출력하세요
select first_name, salary
from employees
where salary <= 14000
or salary >= 17000;

--입사일이 04/01/01 에서 05/12/31 사이의 사원의 이름과 입사일을 출력하세요
select first_name, hire_date
from employees
where hire_date >= '04/01/01'
and hire_date <= '05/12/31';

--연봉이 14000이상 17000이하인
--사원의 이름과 연봉을 구하시오 (between)
select first_name, salary
from employees
where salary between 14000 and 17000;


--in
select first_name, last_name, salary
from employees
where first_name in ('Neena', 'Lex', 'John');

--연봉이 2100, 3100, 4100, 5100 인 사원의 이름과 연봉을 구하시오
select first_name, salary
from employees
where salary in (2100, 3100, 4100, 5100);

--like연산자
select first_name,
       last_name,
       salary
from employees
where first_name like 'L&';


select first_name,
       last_name,
       salary
from employees
where first_name like '%am'; --first_name 글자수 상관없이 맨 마지막 am으로 끝나는 조건

select first_name,
       last_name,
       salary
from employees
where first_name like '%a%'; --순서 상관없이 a를 포함하고 있는 조건

select first_name,
       last_name,
       salary
from employees
where first_name like 'A%'; --첫 글자가 A 로 시작하는 조건

select first_name,
       last_name,
       salary
from employees
where first_name like '___a%'; --다섯글자 이름의 두번째 글자가 a 인 조건

select first_name,
       last_name
from employees
where first_name like '_a__'; --이름이 4글자인 사원중 끝에서 두번째 글자가 a인 사원의 이름을 출력

--nuil
--직원테이블에 급여가 13000에서 15000사이인
--직원의 이름, 급여, 커미션%, 급여*커미션 출력하세요
select first_name,
       salary,
       commission_pct,
       salary*commission_pct
from employees
where salary between 13000 and 15000;

--위와 동일한 조건이지만 null값 제외
select first_name,
       salary,
       commission_pct,
       salary*commission_pct
from employees
where commission_pct is not null;

--담당매니저가 없고 커미션비율이 없는 직원의 이름을 출력하세요
select first_name, salary, commission_pct
from employees
where manager_id is null
and commission_pct is null;

select email, employee_id
from employees
where employee_id = 110;

--order by / 원하는 값을 정렬하는 것
select *
from employees
order by salary desc;

select first_name
from employees
where salary >= 9000
order by salary desc; --asc 작은 것부터 큰 거 순으로 정렬(생략가능)

--부서번호를 오름차순으로 정렬하고 부서번호, 급여, 이름을 출력하시오
select department_id,
       salary,
       first_name
from employees
order by department_id desc;

--급여가 10000 이상인 직원의 이름 급여를 급여가 큰직원부터 출력하세요
select first_name,
       salary
from employees
where salary >= 10000
order by salary desc;

--부서번호를 오름차순으로 정렬하고 부서번호가 같으면 급여가 높은 사람부터 부서번호 급여 이름을 출력하세요  
select department_id,
       salary,
       first_name
from employees
order by department_id asc, salary desc;