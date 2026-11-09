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

-- solution: fill with values from source when target has no matching row
merge into bb_target as t
using bb_source as s
    on (t.id = s.id)
when matched and t.value is null then -- source value overrides if target value is empty
    update set value = s.value
when not matched then
    insert (id, value) 
    values (s.id, s.value);

select * from BB_target
order by id;
