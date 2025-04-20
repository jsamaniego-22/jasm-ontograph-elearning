LOAD CSV WITH HEADERS FROM 'https://raw.githubusercontent.com/jsamaniego-22/jasm-ontograph-elearning/refs/heads/master/extraccion-datos/data/d_course-detail.csv' AS row
MERGE (c:Curso {id: toInteger(row.courseid)})
SET c.nombre = row.fullname,
    c.codigo = row.shortname,
    c.descripcion = row.summary;