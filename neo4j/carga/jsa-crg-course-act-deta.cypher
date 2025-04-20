LOAD CSV WITH HEADERS FROM 'https://raw.githubusercontent.com/jsamaniego-22/jasm-ontograph-elearning/refs/heads/master/extraccion-datos/data/d_course-activity_detail.csv' AS row
MERGE (cat:Categoria {id: toInteger(row.id)})
SET cat.nombre = row.name,
    cat.descripcion = row.description;