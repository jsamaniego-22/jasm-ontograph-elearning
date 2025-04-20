LOAD CSV WITH HEADERS FROM 'https://raw.githubusercontent.com/jsamaniego-22/jasm-ontograph-elearning/refs/heads/master/extraccion-datos/data/d_prof_basic.csv' AS row
MERGE (p:Usuario:Profesor {id: "p_" + toInteger(row.id)})
SET p.username = row.username,
    p.nombre = row.firstname,
    p.apellido = row.lastname,
    p.email = row.email,
    p.departamento = row.department;