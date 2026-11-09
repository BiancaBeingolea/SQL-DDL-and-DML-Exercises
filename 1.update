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
-- update target values with source values only when target id = source id and source value is not null
update BB_target t
set t.value = s.value
from BB_source s
where t.id = s.id;

-- verify results
select *
from BB_target
order by id;
