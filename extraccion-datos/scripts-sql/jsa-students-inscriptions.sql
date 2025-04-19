-- Inscripciones en Cursos
SELECT 
    ue.userid,
    ue.enrolid,
    c.id AS courseid,
    c.fullname AS course_name,
    FROM_UNIXTIME(ue.timestart) AS timestart,
    FROM_UNIXTIME(ue.timeend) AS timeend
FROM 
    mdl_user_enrolments ue
JOIN 
    mdl_enrol e ON ue.enrolid = e.id
JOIN 
    mdl_course c ON e.courseid = c.id
JOIN 
    mdl_role_assignments ra ON ue.userid = ra.userid
JOIN 
    mdl_role r ON ra.roleid = r.id
WHERE 
    r.shortname = 'student';