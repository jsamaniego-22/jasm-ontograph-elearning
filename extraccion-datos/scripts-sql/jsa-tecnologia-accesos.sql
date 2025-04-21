-- Extraer datos de conexión desde mdl_logstore_standard_log
SELECT 
    userid,
    courseid,
    MIN(from_unixtime(timecreated, '%Y-%m-%d %H:%i:%s')) AS primera_conexion,
    MAX(from_unixtime(timecreated, '%Y-%m-%d %H:%i:%s')) AS ultima_conexion,
    COUNT(id) AS total_accesos,
    (MAX(timecreated) - MIN(timecreated)) AS segundos_conectado  -- Diferencia en segundos
FROM 
    mdl_logstore_standard_log
WHERE 
    action = 'viewed'  -- Filtra solo eventos de visualización
    AND target = 'course'  -- Accesos a cursos específicos
    AND userid IN (SELECT userid FROM mdl_role_assignments WHERE roleid = 5)  -- Solo estudiantes
GROUP BY 
    userid, courseid;