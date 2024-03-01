USE master;
GO

-- Definir el nombre y la ubicaci�n del archivo l�gico
CREATE DATABASE ordenes
ON (
    NAME = 'ordenes',
    FILENAME = 'C:\Users\Public\ordenes.mdf',
    SIZE = 10MB,  -- Tama�o inicial del archivo de datos
    MAXSIZE = UNLIMITED,  -- Tama�o m�ximo del archivo de datos
    FILEGROWTH = 5MB  -- Incremento autom�tico del archivo de datos
)
LOG ON (
    NAME = 'ordenes_log',
    FILENAME = 'C:\Users\Public\ordenes_log.ldf',
    SIZE = 5MB,  -- Tama�o inicial del archivo de registro
    MAXSIZE = 2GB,  -- Tama�o m�ximo del archivo de registro
    FILEGROWTH = 1MB  -- Incremento autom�tico del archivo de registro
);