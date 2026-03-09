-- Generado automáticamente

INSERT INTO Usuario (id_usuario, nombre, email, contrasena, metodo_acceso, rol) VALUES
(1,'Carlos Ruiz','carlos@example.com','pass123','local','admin'),
(2,'Laura Gómez','laura@example.com','pass123','google','usuario'),
(3,'Jhon Cortez','jhon@example.com','pass123','local','usuario'),
(4,'Daniel Torres','daniel@example.com','pass123','local','usuario'),
(5,'Sofia Rojas','sofia@example.com','pass123','facebook','usuario'),
(6,'Mariana Pérez','mariana@example.com','pass123','google','usuario'),
(7,'Felipe Castro','felipe@example.com','pass123','local','usuario'),
(8,'Ana Valdez','ana@example.com','pass123','local','usuario'),
(9,'Luis Mendoza','luis@example.com','pass123','facebook','usuario'),
(10,'Camila Ortega','camila@example.com','pass123','google','usuario');

INSERT INTO Aula (id_aula, nombre, ubicacion, descripcion, horario_monitoreo) VALUES
(1,'Aula 101','Bloque A','Aula principal de sistemas','6am - 6pm'),
(2,'Aula 102','Bloque A','Sala de estudio','7am - 5pm'),
(3,'Aula 201','Bloque B','Laboratorio de electrónica','8am - 8pm'),
(4,'Aula 202','Bloque B','Aula de prácticas','7am - 6pm'),
(5,'Aula 301','Bloque C','Laboratorio de física','6am - 4pm'),
(6,'Aula 302','Bloque C','Laboratorio de química','6am - 4pm'),
(7,'Aula 401','Bloque D','Sala audiovisual','8am - 6pm'),
(8,'Aula 402','Bloque D','Salón interactivo','9am - 7pm'),
(9,'Aula 501','Bloque E','Aula de robótica','7am - 3pm'),
(10,'Aula 502','Bloque E','Taller de mecánica','8am - 5pm');

INSERT INTO Variable (id_variable, nombre, unidad, valor_actual, umbral_critico, id_aula) VALUES
(1,'Temperatura','°C',24.5,30,1),
(2,'Humedad','%',55,80,1),
(3,'Ruido','dB',40,70,2),
(4,'CO2','ppm',500,1000,3),
(5,'Luminosidad','lx',350,900,4),
(6,'Vibración','Hz',12,30,5),
(7,'Presión','Pa',1020,1100,6),
(8,'Voltaje','V',110,150,7),
(9,'Corriente','A',15,25,8),
(10,'Temperatura','°C',27.2,30,9);

INSERT INTO Sensor (id_sensor, tipo, estado, id_aula) VALUES
(1,'Sensor de temperatura','activo',1),
(2,'Sensor de humedad','activo',1),
(3,'Sensor de ruido','inactivo',2),
(4,'Sensor CO2','activo',3),
(5,'Sensor de luz','activo',4),
(6,'Sensor de vibración','inactivo',5),
(7,'Sensor de presión','activo',6),
(8,'Sensor eléctrico','activo',7),
(9,'Sensor de corriente','activo',8),
(10,'Sensor de temperatura','activo',9);

INSERT INTO CalificacionAula (id_calificacion_aula, id_usuario, id_aula, puntaje, comentario, fecha) VALUES
(1,1,1,5,'Muy buen ambiente',GETDATE()),
(2,2,2,4,'Cómoda y ordenada',GETDATE()),
(3,3,3,3,'Un poco desordenada',GETDATE()),
(4,4,4,5,'Perfecta para estudiar',GETDATE()),
(5,5,5,4,'Bien equipada',GETDATE()),
(6,6,6,3,'Podría mejorar',GETDATE()),
(7,7,7,5,'Excelente aula',GETDATE()),
(8,8,8,4,'Muy limpia',GETDATE()),
(9,9,9,5,'Muy moderna',GETDATE()),
(10,10,10,3,'Hace calor',GETDATE());

INSERT INTO CalificacionVariable (id_calificacion_variable, id_usuario, id_variable, puntaje, comentario, fecha) VALUES
(1,1,1,5,'Temperatura ideal',GETDATE()),
(2,2,2,4,'Humedad estable',GETDATE()),
(3,3,3,3,'Ruido alto',GETDATE()),
(4,4,4,5,'Nivel de CO2 excelente',GETDATE()),
(5,5,5,4,'Buena iluminación',GETDATE()),
(6,6,6,3,'Vibración molesta',GETDATE()),
(7,7,7,5,'Presión adecuada',GETDATE()),
(8,8,8,4,'Voltaje correcto',GETDATE()),
(9,9,9,5,'Corriente estable',GETDATE()),
(10,10,10,3,'Temperatura un poco alta',GETDATE());

INSERT INTO Favorito (id_favorito, id_usuario, tipo, id_referencia, fecha_agregado) VALUES
(1,1,'aula',1,GETDATE()),
(2,2,'variable',1,GETDATE()),
(3,3,'aula',2,GETDATE()),
(4,4,'variable',3,GETDATE()),
(5,5,'aula',4,GETDATE()),
(6,6,'variable',5,GETDATE()),
(7,7,'aula',6,GETDATE()),
(8,8,'variable',7,GETDATE()),
(9,9,'aula',8,GETDATE()),
(10,10,'variable',9,GETDATE());

INSERT INTO Notificacion (id_notificacion, id_usuario, tipo, mensaje, fecha, leida) VALUES
(1,1,'alerta','Temperatura alta en Aula 101',GETDATE(),0),
(2,2,'info','Nuevo sensor agregado',GETDATE(),1),
(3,3,'alerta','Ruido excedió el límite',GETDATE(),0),
(4,4,'info','Nuevo ranking disponible',GETDATE(),1),
(5,5,'alerta','CO2 en aumento',GETDATE(),0),
(6,6,'info','Humedad estable',GETDATE(),1),
(7,7,'alerta','Voltaje bajo',GETDATE(),0),
(8,8,'info','Calificación registrada',GETDATE(),1),
(9,9,'alerta','Corriente irregular',GETDATE(),0),
(10,10,'info','Aula agregada a favoritos',GETDATE(),1);

INSERT INTO HistoricoVariable (id_historico, id_variable, valor, fecha) VALUES
(1,1,23.8,GETDATE() - INTERVAL 1 DAY),
(2,1,24.1,GETDATE()),
(3,2,50,GETDATE() - INTERVAL 2 DAY),
(4,3,38,GETDATE() - INTERVAL 3 DAY),
(5,4,480,GETDATE() - INTERVAL 1 DAY),
(6,5,340,GETDATE() - INTERVAL 4 DAY),
(7,6,10,GETDATE() - INTERVAL 5 DAY),
(8,7,1015,GETDATE()),
(9,8,108,GETDATE() - INTERVAL 1 DAY),
(10,9,14.5,GETDATE());

INSERT INTO Ranking (id_ranking, id_aula, tipo_variable, posicion, promedio) VALUES
(1,1,'Temperatura',1,24.0),
(2,2,'Ruido',2,42.5),
(3,3,'CO2',3,520.3),
(4,4,'Luminosidad',1,360.2),
(5,5,'Vibración',2,13.4),
(6,6,'Presión',1,1021.1),
(7,7,'Voltaje',3,112.0),
(8,8,'Corriente',2,16.0),
(9,9,'Temperatura',1,26.8),
(10,10,'Ruido',4,48.9);

INSERT INTO Busqueda (id_busqueda, id_usuario, texto, filtro, fecha) VALUES
(1,1,'temperatura aula 101','variable',GETDATE()),
(2,2,'ruido aulas','variable',GETDATE()),
(3,3,'aula electrónica','aula',GETDATE()),
(4,4,'co2 niveles','variable',GETDATE()),
(5,5,'luminosidad','variable',GETDATE()),
(6,6,'vibración laboratorio','variable',GETDATE()),
(7,7,'presión aula','variable',GETDATE()),
(8,8,'voltaje aulas','variable',GETDATE()),
(9,9,'corriente','variable',GETDATE()),
(10,10,'temperatura robótica','variable',GETDATE());
