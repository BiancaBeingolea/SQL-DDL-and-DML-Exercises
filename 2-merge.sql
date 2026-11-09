-- create target table
create or replace table BB_target (
    id int,
    value varchar(10)
);

insert into BB_target (id, value) values
    (1, 'A'),
    (2, 'A'),
    (3, null),
    (5, 'A'),
    (8, 'A'),
    (9, null),
    (10, null);

select * from BB_target;

-- create source table
create or replace table BB_source (
    id int,
    value varchar(10)
);

insert into BB_source (id, value) values
    (1, null),
    (2, 'B'),
    (4, 'B'),
    (8, 'B'),
    (9, 'B'),
    (10, null),
    (11, null);

select * from BB_source;

-- solution: update target from source
-- replace target values with source values
-- if row only in source, insert into result; if only in target, keep the same
merge into BB_target as t
using BB_source as s
on (t.id = s.id)
when matched then -- update target row to source value
    update set t.value = s.value
when not matched then -- insert into source (data in source but not target)
    insert (id, value) 
    values (s.id, s.value);

-- verify results
select *
from BB_target
order by id;
