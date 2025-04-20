LOAD CSV WITH HEADERS FROM 'https://raw.githubusercontent.com/jsamaniego-22/jasm-ontograph-elearning/refs/heads/master/extraccion-datos/data/d_stu_inscrip.csv' AS row
MATCH (e:Usuario {id: toInteger(row.userid)})
MATCH (c:Curso {id: toInteger(row.courseid)})
MERGE (e)-[r:INSCRITO_EN]->(c)
SET r.fecha_inicio = datetime(replace(row.timestart, ' ', 'T')),
    r.fecha_fin = datetime(replace(row.timeend, ' ', 'T'));