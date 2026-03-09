USE EduAirControl;
GO
--Triggers

-- Hace un registro de cada que se actualiza los valores de las variables
CREATE TRIGGER trg_InsertHistoricoVariable
ON Variable
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO HistoricoVariable (id_variable, valor, fecha)
    SELECT 
        i.id_variable,
        i.valor_actual,
        GETDATE()
    FROM inserted i
    INNER JOIN deleted d ON i.id_variable = d.id_variable
    WHERE i.valor_actual <> d.valor_actual;
END;
GO

-- Informa cuando un umbral se supera
CREATE TRIGGER trg_NotificacionUmbralCritico
ON Variable
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO Notificacion (id_notificacion, id_usuario, tipo, mensaje, fecha, leida)
    SELECT 
        (SELECT ISNULL(MAX(id_notificacion),0)+ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) FROM Notificacion),
        u.id_usuario,
        'Alerta',
        CONCAT('La variable ', i.nombre, ' en el aula ', a.nombre, 
               ' superó su umbral crítico. Valor actual: ', i.valor_actual),
        GETDATE(),
        0
    FROM inserted i
    JOIN Aula a ON i.id_aula = a.id_aula
    JOIN Usuario u ON u.rol IN ('Administrativo', 'Instructor')  --solo los administrativos e instructores
    WHERE i.valor_actual > i.umbral_critico;
END;
GO

GO