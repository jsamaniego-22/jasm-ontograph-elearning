-- Este script SQL está diseñado para extraer información sobre las actividades de los cursos en Moodle.
SELECT 
    cm.id AS module_id,
    cm.course AS course_id,
    m.name AS activity_type,  -- Ej: 'hvp', 'quiz', 'attendance'
    cm.instance AS activity_id,
    cm.section AS course_section,
    FROM_UNIXTIME(cm.added) AS date_added,
    -- Datos específicos por tipo de actividad
    CASE 
        WHEN m.name = 'assign' THEN (SELECT name FROM mdl_hvp WHERE id = cm.instance)
        WHEN m.name = 'choice' THEN (SELECT name FROM mdl_hvp WHERE id = cm.instance)
        WHEN m.name = 'choicegroup' THEN (SELECT name FROM mdl_hvp WHERE id = cm.instance)
        WHEN m.name = 'feedback' THEN (SELECT name FROM mdl_hvp WHERE id = cm.instance)
        WHEN m.name = 'forum' THEN (SELECT name FROM mdl_hvp WHERE id = cm.instance)
        WHEN m.name = 'glossary' THEN (SELECT name FROM mdl_hvp WHERE id = cm.instance)
        WHEN m.name = 'h5pactivity' THEN (SELECT name FROM mdl_hvp WHERE id = cm.instance)
        WHEN m.name = 'lesson' THEN (SELECT name FROM mdl_hvp WHERE id = cm.instance)
        WHEN m.name = 'scorm' THEN (SELECT name FROM mdl_hvp WHERE id = cm.instance)
        WHEN m.name = 'survey' THEN (SELECT name FROM mdl_hvp WHERE id = cm.instance)
        WHEN m.name = 'workshop' THEN (SELECT name FROM mdl_hvp WHERE id = cm.instance)
        WHEN m.name = 'hvp' THEN (SELECT name FROM mdl_hvp WHERE id = cm.instance)
        WHEN m.name = 'quiz' THEN (SELECT name FROM mdl_quiz WHERE id = cm.instance)
        WHEN m.name = 'attendance' THEN (SELECT name FROM mdl_attendance WHERE id = cm.instance)
        WHEN m.name = 'book' THEN (SELECT name FROM mdl_book WHERE id = cm.instance)
        WHEN m.name = 'page' THEN (SELECT name FROM mdl_page WHERE id = cm.instance)
        WHEN m.name = 'url' THEN (SELECT name FROM mdl_url WHERE id = cm.instance)
    END AS activity_name
FROM 
    mdl_course_modules cm
JOIN 
    mdl_modules m ON cm.module = m.id
ORDER BY 
    cm.course, cm.section;