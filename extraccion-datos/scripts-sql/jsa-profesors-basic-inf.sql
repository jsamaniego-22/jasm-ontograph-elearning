-- Informacion de Profesores
SELECT 
    u.id,
    u.username,
    u.firstname,
    u.lastname,
    u.email
FROM 
    mdl_user u
JOIN 
    mdl_role_assignments ra ON u.id = ra.userid
JOIN 
    mdl_role r ON ra.roleid = r.id
WHERE 
    r.shortname = 'teacher' OR r.shortname = 'editingteacher' OR r.shortname = 'editingteacher2';