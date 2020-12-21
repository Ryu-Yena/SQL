--문제1(완료)
select em.employee_id,
       em.first_name,
       em.last_name,
       de.department_name
from employees em, departments de
where em.department_id = de.department_id
order by de.department_name asc, em.employee_id desc;

--문제2(완료)
select em.employee_id,
       em.first_name,
       em.salary,
       de.department_name,
       job.job_title
from employees em, departments de, jobs job
where em.department_id = de.department_id and em.job_id = job.job_id
order by em.employee_id asc;

--문제2-1(완료)
select em.employee_id,
       em.first_name,
       em.salary,
       de.department_name,
       job.job_title
from employees em, departments de, jobs job
where em.department_id = de.department_id(+) and em.job_id = job.job_id
order by em.employee_id asc;

--문제3(완료)
select lo.location_id,
       lo.city,
       de.department_id
from locations lo, departments de
where lo.location_id = de.location_id
order by lo.location_id asc;

--문제3-1(완료)
select lo.location_id,
       lo.city,
       de.department_id
from locations lo full outer join departments de
on lo.location_id = de.location_id(+)
order by lo.location_id asc;

--문제4(완료)
select re.region_name,
       co.country_name
from countries co, regions re
where co.region_id = re.region_id
order by re.region_name asc, co.country_name desc;

--문제5(완료)
select emp.employee_id,
       emp.first_name,
       emp.hire_date,
       man.first_name manager,
       man.hire_date       
from employees emp, employees man
where emp.manager_id = man.employee_id and man.hire_date > emp.hire_date;

--문제6(완료)
select co.country_name,
       co.country_id,
       lo.city,
       lo.location_id,
       de.department_name,
       de.department_id
from countries co, departments de, locations lo
where de.location_id = lo.location_id and co.country_id = lo.country_id
order by co.country_name asc;

--문제7(완료)
select em.employee_id,
       em.first_name || ' ' || em.last_name "Full Name",
       jh.job_id,
       jh.start_date,
       jh.end_date
from job_history jh, employees em
where jh.employee_id = em.employee_id and jh.job_id = 'AC_ACCOUNT';

--문제8
select de.department_id,
       de.department_name,
       em.first_name manager,
       lo.city,
       co.country_name,
       re.region_name
from departments de, employees em, locations lo, countries co, regions re
where de.manager_id = em.manager_id and em.employee_id = de.manager_id and lo.country_id = co.country_id 
and co.region_id = re.region_id;

--문제9
select em.employee_id,
       em.first_name,
       de.department_name,
       em.first_name manager,
from employees em, departments de
where de.manager_id(+) = em.employee_id;