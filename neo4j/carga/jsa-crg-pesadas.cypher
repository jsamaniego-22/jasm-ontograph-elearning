//Carga de Tablas Pesadas
// Crear índices para optimizar las búsquedas (ejecutar primero)
CREATE INDEX estudiante_id IF NOT EXISTS FOR (e:Estudiante) ON (e.id);
CREATE INDEX actividad_id IF NOT EXISTS FOR (a:Actividad) ON (a.id);
CREATE INDEX curso_id IF NOT EXISTS FOR (c:Curso) ON (c.id);

//Actividades por cursos
CALL apoc.periodic.iterate(
  "LOAD CSV WITH HEADERS FROM 'https://raw.githubusercontent.com/jsamaniego-22/jasm-ontograph-elearning/refs/heads/master/extraccion-datos/data/d_course-activity_detail.csv' AS row RETURN row",
  "MERGE (a:Actividad {id: toInteger(row.module_id)})
   SET a.tipo = row.activity_type,
       a.nombre = row.activity_name,
       a.fecha_creacion = datetime(replace(row.date_added, ' ', 'T'))
   WITH a, row
   MATCH (c:Curso {id: toInteger(row.course_id)})
   MERGE (a)-[:PERTENECE_A]->(c)",
  {batchSize: 500, parallel: false}
);

//Carga notas por actividades del curso 
CALL apoc.periodic.iterate(
  'LOAD CSV WITH HEADERS FROM "https://raw.githubusercontent.com/jsamaniego-22/jasm-ontograph-elearning/master/extraccion-datos/data/d_stu_notes.csv" AS row 
   RETURN row',
  'WITH row 
   WHERE row.finalgrade IS NOT NULL AND row.finalgrade <> ""
   MATCH (e:Estudiante {id: toInteger(row.userid)})
   MATCH (a:Actividad {id: toInteger(row.itemid)})
   MERGE (e)-[r:REALIZO]->(a)
   SET r.calificacion = toFloat(row.finalgrade),
       r.fecha = datetime(row.timemodified)',
  {batchSize: 5000, parallel: false}
);

//3. Problema de Accedio
// 1. Crear nodos de Tecnología (si no existen)
MERGE (t:Tecnologia {id: 1, nombre: 'Plataforma Moodle', tipo: 'web'});

// 2. Cargar accesos desde el CSV
LOAD CSV WITH HEADERS FROM 'file:///accesos_estudiantes.csv' AS row
MATCH (e:Estudiante {id: toInteger(row.userid)})
MATCH (t:Tecnologia {id: 1})
MERGE (e)-[r:ACCEDIO]->(t)
SET 
    r.primera_conexion = datetime(row.primera_conexion),
    r.ultima_conexion = datetime(row.ultima_conexion),
    r.total_accesos = toInteger(row.total_accesos),
    r.minutos_conectado = toInteger(row.segundos_conectado)/60;