// Cursos pertenecen a categorías
MATCH (c:Curso {id: 101}), (cat:CategoriaCurso {id: 10}) MERGE (c)-[:PERTENECE_A]->(cat);