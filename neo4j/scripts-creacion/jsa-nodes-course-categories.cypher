// Categorías de cursos
MERGE (cat1:CategoriaCurso {id: 10, name: "Ciencias Exactas", description: "Matemáticas, Física"});
MERGE (cat2:CategoriaCurso {id: 20, name: "Humanidades", description: "Literatura, Historia"});

// Cursos
MERGE (c1:Curso {id: 101, fullname: "Matemáticas Avanzadas", shortname: "MATH-101", summary: "Curso de cálculo diferencial"});
MERGE (c2:Curso {id: 102, fullname: "Literatura Contemporánea", shortname: "LIT-102", summary: "Análisis de obras modernas"});