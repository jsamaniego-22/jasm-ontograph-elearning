// Estudiantes inscritos en cursos
MATCH (e:Usuario {id: 1}), (c:Curso {id: 101}) 
MERGE (e)-[:INSCRITO_EN {timestart: datetime(), timeend: ""}]->(c);

// Profesores gestionan cursos
MATCH (p:Usuario {id: 2}), (c:Curso {id: 101}) MERGE (p)-[:GESTIONA]->(c);

// Gestores administran categorías
MATCH (g:Usuario {id: 3}), (cat:CategoriaCurso {id: 10}) MERGE (g)-[:ADMINISTRA]->(cat);