select
    project_id,
    round(sum(experience_years)/count(project_id), 2) average_years
from
    Project P
left join
    Employee E on P.employee_id = E.employee_id
group by project_id
