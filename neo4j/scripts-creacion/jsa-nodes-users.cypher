// Usuarios básicos (etiquetas múltiples según rol)
MERGE (u1:Usuario:Estudiante {id: 1, username: "estudiante1", firstname: "Ana", lastname: "Pérez", email: "ana@example.com", timecreated: datetime()});
MERGE (u2:Usuario:Profesor {id: 2, username: "profesor1", firstname: "Carlos", lastname: "Gómez", email: "carlos@example.com", timecreated: datetime()});
MERGE (u3:Usuario:Gestor {id: 3, username: "gestor1", firstname: "Luisa", lastname: "Martínez", email: "luisa@example.com", timecreated: datetime()});