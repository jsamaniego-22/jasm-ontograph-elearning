--Calificaciones
SELECT 
    gg.userid,
    gi.courseid,
    gi.itemname AS assessment_name,
    gg.finalgrade,
    FROM_UNIXTIME(gg.timemodified) AS timemodified
FROM 
    mdl_grade_grades gg
JOIN 
    mdl_grade_items gi ON gg.itemid = gi.id
JOIN 
    mdl_role_assignments ra ON gg.userid = ra.userid
JOIN 
    mdl_role r ON ra.roleid = r.id
WHERE 
    r.shortname = 'student';