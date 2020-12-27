/***********
** rownum **
***********/

--급여를 가장 많이 받는 5명의 직원의 이름을 출력하시오.

--rownum이 order by 보다 먼저 생겨서 번호가 섞인다.
select rownum,
       employee_id,
       first_name,
       salary
from employees
order by salary desc;

--정렬하고 rownum순서를 사용
select rownum,
       o.employee_id,
       o.first_name,
       o.salary
from (select emp.employee_id,
             emp.first_name,
             emp.salary
      from employees emp
      order by salary desc) O --salary로 정렬되어있는 테이블 사용
where rownum >=1 --where 절 조건이 2부터 값이 없음
and rownum <=5;

-- 일련번호주고 바로 조건을 판단해서
select ro.rnum,
       ro.employee_id,
       ro.first_name,
       ro.salary
from (select rownum rnum,
             o.employee_id,
             o.first_name,
             o.salary
     from(select emp.employee_id,
             emp.first_name,
             emp.salary
      from employees emp
      order by salary desc) o
      ) ro
where rnum >= 2
and rnum <=5;

--[예제]
--급여를 가장 많이 받는 5명의 직원의 이름을 출력하시오.
select  ro.rn,
        ro.employee_id,
        ro.first_name,
        ro.hire_date
from (select rownum rn,
             o.employee_id,
             o.first_name,
             o.salary,
             o.hire_date
      from (select employee_id,
                   first_name,
                   salary,
                   hire_date
            from employees
            where hire_date >= '07/01/01'
            and hire_date <= '07/12/31'
            order by salary desc)o
      )ro
where ro.rn >2
and ro.rn <= 7;