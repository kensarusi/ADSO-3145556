CREATE TABLE Usuario (
    id_usuario INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    contrasena VARCHAR(255) NOT NULL,
    metodo_acceso VARCHAR(50),
    rol VARCHAR(50)
);

CREATE TABLE Aula (
    id_aula INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    ubicacion VARCHAR(100),
    descripcion TEXT,
    horario_monitoreo VARCHAR(100)
);

CREATE TABLE Variable (
    id_variable INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    unidad VARCHAR(50),
    valor_actual FLOAT,
    umbral_critico FLOAT,
    id_aula INT,
    FOREIGN KEY (id_aula) REFERENCES Aula(id_aula)
);

CREATE TABLE Sensor (
    id_sensor INT PRIMARY KEY,
    tipo VARCHAR(100),
    estado VARCHAR(50),
    id_aula INT,
    FOREIGN KEY (id_aula) REFERENCES Aula(id_aula)
);

CREATE TABLE CalificacionAula (
    id_calificacion_aula INT PRIMARY KEY,
    id_usuario INT,
    id_aula INT,
    puntaje INT,
    comentario TEXT,
    fecha DATETIME,
    FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario),
    FOREIGN KEY (id_aula) REFERENCES Aula(id_aula)
);

CREATE TABLE CalificacionVariable (
    id_calificacion_variable INT PRIMARY KEY,
    id_usuario INT,
    id_variable INT,
    puntaje INT,
    comentario TEXT,
    fecha DATETIME,
    FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario),
    FOREIGN KEY (id_variable) REFERENCES Variable(id_variable)
);

CREATE TABLE Favorito (
    id_favorito INT PRIMARY KEY,
    id_usuario INT,
    tipo VARCHAR(50),
    id_referencia INT,
    fecha_agregado DATETIME,
    FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario)
);

CREATE TABLE Notificacion (
    id_notificacion INT PRIMARY KEY,
    id_usuario INT,
    tipo VARCHAR(50),
    mensaje TEXT,
    fecha DATETIME,
    leida BOOLEAN,
    FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario)
);

CREATE TABLE HistoricoVariable (
    id_historico INT PRIMARY KEY,
    id_variable INT,
    valor FLOAT,
    fecha DATETIME,
    FOREIGN KEY (id_variable) REFERENCES Variable(id_variable)
);

CREATE TABLE Ranking (
    id_ranking INT PRIMARY KEY,
    id_aula INT,
    tipo_variable VARCHAR(100),
    posicion INT,
    promedio FLOAT,
    FOREIGN KEY (id_aula) REFERENCES Aula(id_aula)
);

CREATE TABLE Busqueda (
    id_busqueda INT PRIMARY KEY,
    id_usuario INT,
    texto VARCHAR(255),
    filtro VARCHAR(100),
    fecha DATETIME,
    FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario)
);