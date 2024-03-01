USE master;
GO

-- Definir el nombre y la ubicación del archivo lógico
CREATE DATABASE ordenes
ON (
    NAME = 'ordenes',
    FILENAME = 'C:\Users\Public\ordenes.mdf',
    SIZE = 10MB,  -- Tamaño inicial del archivo de datos
    MAXSIZE = UNLIMITED,  -- Tamaño máximo del archivo de datos
    FILEGROWTH = 5MB  -- Incremento automático del archivo de datos
)
LOG ON (
    NAME = 'ordenes_log',
    FILENAME = 'C:\Users\Public\ordenes_log.ldf',
    SIZE = 5MB,  -- Tamaño inicial del archivo de registro
    MAXSIZE = 2GB,  -- Tamaño máximo del archivo de registro
    FILEGROWTH = 1MB  -- Incremento automático del archivo de registro
);