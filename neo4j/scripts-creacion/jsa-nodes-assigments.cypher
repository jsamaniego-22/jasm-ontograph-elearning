// Tareas
MERGE (t1:Tarea {id: 1001, name: "Tarea 1 - Derivadas", duedate: "2023-12-01T00:00:00Z"});
MERGE (t2:Tarea {id: 1002, name: "Ensayo sobre Borges", duedate: "2023-11-20T00:00:00Z"});

// Cuestionarios
MERGE (q1:Cuestionario {id: 2001, name: "Quiz 1 - Límites", timeopen: "2023-11-15T00:00:00Z", timeclose: "2023-11-30T23:59:59Z"});