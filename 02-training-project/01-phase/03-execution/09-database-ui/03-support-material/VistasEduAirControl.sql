USE EduAirControl;
GO


-- Promedio de calificación por aula
CREATE VIEW vw_PromedioCalificacionAula AS
SELECT 
    a.id_aula,
    a.nombre AS nombre_aula,
    AVG(ca.puntaje) AS promedio_puntaje,
    COUNT(ca.id_calificacion_aula) AS cantidad_calificaciones
FROM Aula a
LEFT JOIN CalificacionAula ca ON a.id_aula = ca.id_aula
GROUP BY a.id_aula, a.nombre;
GO

-- Promedio de calificación por variable
CREATE VIEW vw_PromedioCalificacionVariable AS
SELECT 
    v.id_variable,
    v.nombre AS nombre_variable,
    AVG(cv.puntaje) AS promedio_puntaje,
    COUNT(cv.id_calificacion_variable) AS cantidad_calificaciones
FROM Variable v
LEFT JOIN CalificacionVariable cv ON v.id_variable = cv.id_variable
GROUP BY v.id_variable, v.nombre;
GO

-- Variables con su aula y umbral crítico
CREATE VIEW vw_VariablesAula AS
SELECT 
    v.id_variable,
    v.nombre AS variable,
    v.valor_actual,
    v.umbral_critico,
    a.nombre AS aula,
    a.ubicacion
FROM Variable v
JOIN Aula a ON v.id_aula = a.id_aula;
GO

-- Promedio de variables para usar en el rankig
CREATE VIEW vw_PromedioVariablesAula AS
SELECT 
    a.id_aula,
    a.nombre AS aula,
    AVG(v.valor_actual) AS promedio_variables
FROM Aula a
JOIN Variable v ON a.id_aula = v.id_aula
GROUP BY a.id_aula, a.nombre;
GO

--Muestra un historial de las variables en la última semana
CREATE VIEW vw_HistoricoReciente AS
SELECT 
    h.id_historico,
    v.nombre AS variable,
    h.valor,
    h.fecha,
    a.nombre AS aula
FROM HistoricoVariable h
JOIN Variable v ON h.id_variable = v.id_variable
JOIN Aula a ON v.id_aula = a.id_aula
WHERE h.fecha >= DATEADD(DAY, -7, GETDATE());
GO
-- Esta vista sirve para que ejecutarla cada pocos segundos o minutos y poder mostrar el estado actual de las variables en tiempo real
CREATE VIEW vw_VariablesTiempoReal AS
SELECT 
    v.id_variable,
    v.nombre AS variable,
    v.valor_actual,
    v.umbral_critico,
    a.nombre AS aula,
    a.ubicacion,
    CASE 
        WHEN v.valor_actual > v.umbral_critico THEN 'Crítico'
        ELSE 'Normal'
    END AS estado
FROM Variable v
JOIN Aula a ON v.id_aula = a.id_aula;
GO

