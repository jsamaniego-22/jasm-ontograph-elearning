//Remediaciones
//1. Problemas con relaciones de REALIZO
// Verificar si existen relaciones REALIZO
MATCH (e:Estudiante)-[r:REALIZO]->(a:Actividad)
RETURN count(r) AS total_relaciones;

// Recrear relaciones desde cero (si es necesario)
CALL apoc.periodic.iterate(
  'MATCH (e:Estudiante), (a:Actividad) RETURN e, a',
  'MERGE (e)-[r:REALIZO]->(a)
   SET r.calificacion = toInteger(rand()*10) // Ejemplo con dato aleatorio
  ',
  {batchSize: 1000}
);

//2. Nodos Gestor y Profesor sin conexiones
// Conectar profesores con cursos
CALL apoc.periodic.iterate(
  'LOAD CSV WITH HEADERS FROM "https://raw.githubusercontent.com/jsamaniego-22/jasm-ontograph-elearning/refs/heads/master/extraccion-datos/data/d_prof_manag_course.csv" AS row RETURN row',
  'MATCH (p:Profesor {id: toInteger(row.teacher_id)})
   MATCH (c:Curso {id: toInteger(row.courseid)})
   MERGE (p)-[:GESTIONA]->(c)',
  {batchSize: 500}
);

// Conectar gestores con categorías
MATCH (g:Gestor)
MATCH (cat:Categoria)
WHERE g.departamento = cat.nombre  // Ajusta según tu modelo
MERGE (g)-[:ADMINISTRA]->(cat);