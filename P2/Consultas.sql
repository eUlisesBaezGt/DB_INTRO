-- UNION
SELECT * from class

UNION

select * from course;


-- EXCEPT
select class_id from class
EXCEPT
select class_id from course;


-- CARTESEAN PRODUCT
select * from class
CROSS JOIN course;

