LOAD CSV WITH HEADERS FROM 'https://raw.githubusercontent.com/jsamaniego-22/jasm-ontograph-elearning/refs/heads/master/extraccion-datos/data/d_prof_manag_course.csv' AS row
MATCH (p:Usuario {id: toInteger(row.teacher_id)})
MATCH (c:Curso {id: toInteger(row.courseid)})
MERGE (p)-[:GESTIONA]->(c);