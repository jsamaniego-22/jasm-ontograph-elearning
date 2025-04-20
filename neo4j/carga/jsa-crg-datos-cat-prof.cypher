//Carga datos falantes de CSV

// Cargar CSV de profesores faltantes
LOAD CSV WITH HEADERS FROM 'https://.../profesores_faltantes.csv' AS row
MATCH (c:Curso {id: toInteger(row.course_id)})
MERGE (p:Profesor {id: toInteger(row.teacher_id)})
ON CREATE SET p.nombre = row.teacher_name
MERGE (p)-[:GESTIONA]->(c);

// Cargar CSV de categorías faltantes
LOAD CSV WITH HEADERS FROM 'https://.../categorias_faltantes.csv' AS row
MERGE (cat:Categoria {id: toInteger(row.category_id)})
ON CREATE SET cat.nombre = row.category_name
WITH cat, row
MATCH (c:Curso {id: toInteger(row.course_id)})
MERGE (c)-[:PERTENECE_A]->(cat);