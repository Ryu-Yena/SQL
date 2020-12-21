/* outer join
join 조건을 만족하지 않는 컬럼이 없는 경우 Null을 포함하여 결과를 생성 
└ Null이 올 수 있는 쪽 조건에 (+)를 붙인다.
*/


--full out join
select em.department_id,
       em.first_name,
       de.department_name,
       de.department_id
from employees em full outer join departments de 
on em.department_id = de.department_id;


select em.department_id,
       em.first_name,
       de.department_name,
       de.department_id
from employees em, departments de
where em.department_id(+) = de.department_id(+); --사용하지 않는다.

--alias
select /*employees*/em.department_id, --별명을 지어주면 무조건 별명을 사용해야함
       em.first_name,
       de.department_name,
       de.department_id
from employees em, departments de
where em.department_id = de.department_id
order by em.department_id desc;


--잘못된 사용 예
select *
from employees em, locations lo
where em.salary = lo.location_id; --우연히 숫자가 같을 뿐 아무런 연관도 없지만 숫자가 같아서 join은 가능
