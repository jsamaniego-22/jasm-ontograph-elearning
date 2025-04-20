LOAD CSV WITH HEADERS FROM 'https://raw.githubusercontent.com/jsamaniego-22/jasm-ontograph-elearning/refs/heads/master/extraccion-datos/data/d_stu_basic_inf.csv' AS row
MERGE (e:Usuario:Estudiante {id: toInteger(row.id)})
SET e.username = row.username,
    e.nombre = row.firstname,
    e.apellido = row.lastname,
    e.email = row.email,
    e.fecha_registro = datetime(replace(row.timecreated, " ", "T"));