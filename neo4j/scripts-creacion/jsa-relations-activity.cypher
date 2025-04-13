// Tareas y cuestionarios asociados a cursos
MATCH (t:Tarea {id: 1001}), (c:Curso {id: 101}) MERGE (t)-[:ASOCIADO_A]->(c);
MATCH (q:Cuestionario {id: 2001}), (c:Curso {id: 101}) MERGE (q)-[:ASOCIADO_A]->(c);