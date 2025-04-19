-- Categorias Gestionandas
SELECT 
    cc.id,
    cc.name,
    cc.description,
    u.id AS manager_id
FROM 
    mdl_course_categories cc
JOIN 
    mdl_context ctx ON cc.id = ctx.instanceid AND ctx.contextlevel = 40
JOIN 
    mdl_role_assignments ra ON ctx.id = ra.contextid
JOIN 
    mdl_role r ON ra.roleid = r.id
JOIN 
    mdl_user u ON ra.userid = u.id
WHERE 
    r.shortname = 'manager';