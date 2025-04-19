-- Actividades de un curso
SELECT 
    cm.id AS module_id,
    cm.course AS course_id,
    m.name AS activity_type,  
    cm.instance AS activity_id,  
    cm.section AS course_section,
    FROM_UNIXTIME(cm.added) AS date_added
FROM 
    mdl_course_modules cm
JOIN 
    mdl_modules m ON cm.module = m.id

-- Actividades agrupadas por curso
SELECT 
    cm.id AS module_id,
    cm.course AS course_id,
    m.name AS activity_type,  
    cm.instance AS activity_id,  
    cm.section AS course_section,
    FROM_UNIXTIME(cm.added) AS date_added
FROM 
    mdl_course_modules cm
JOIN 
    mdl_modules m ON cm.module = m.id
GROUP BY m.name;