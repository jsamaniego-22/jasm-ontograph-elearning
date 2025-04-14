--Cursos Gestionados
SELECT 
    c.id AS courseid,
    c.fullname,
    c.shortname,
    c.summary,
    u.id AS teacher_id,
    u.username AS teacher_username
FROM 
    mdl_course c
JOIN 
    mdl_context ctx ON c.id = ctx.instanceid AND ctx.contextlevel = 50
JOIN 
    mdl_role_assignments ra ON ctx.id = ra.contextid
JOIN 
    mdl_role r ON ra.roleid = r.id
JOIN 
    mdl_user u ON ra.userid = u.id
WHERE 
    r.shortname IN ('teacher', 'editingteacher','editingteacher2');