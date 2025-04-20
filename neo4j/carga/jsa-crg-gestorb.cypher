LOAD CSV WITH HEADERS FROM 'https://raw.githubusercontent.com/jsamaniego-22/jasm-ontograph-elearning/refs/heads/master/extraccion-datos/data/d_gest_basic_inf.csv' AS row
MERGE (g:Usuario:Gestor {id: "g_" + toInteger(row.id)})
SET g.username = row.username,
    g.nombre = row.firstname,
    g.apellido = row.lastname,
    g.email = row.email,
    g.nivel_acceso = toInteger(row.access_level);