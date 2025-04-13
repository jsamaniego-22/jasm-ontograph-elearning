// Usuarios
CREATE CONSTRAINT unique_usuario_id IF NOT EXISTS FOR (u:Usuario) REQUIRE u.id IS UNIQUE;
CREATE CONSTRAINT unique_usuario_username IF NOT EXISTS FOR (u:Usuario) REQUIRE u.username IS UNIQUE;

// Cursos y categorías
CREATE CONSTRAINT unique_curso_id IF NOT EXISTS FOR (c:Curso) REQUIRE c.id IS UNIQUE;
CREATE CONSTRAINT unique_categoria_id IF NOT EXISTS FOR (cat:CategoriaCurso) REQUIRE cat.id IS UNIQUE;

// Actividades (Tareas, Cuestionarios)
CREATE CONSTRAINT unique_tarea_id IF NOT EXISTS FOR (t:Tarea) REQUIRE t.id IS UNIQUE;
CREATE CONSTRAINT unique_quiz_id IF NOT EXISTS FOR (q:Cuestionario) REQUIRE q.id IS UNIQUE;