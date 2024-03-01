USE ordenes;
GO

CREATE TABLE RESUMEN_DESPACHO_A (
    anio INT,
    mes INT,
    codigo_sap_producto INT,
    Total_Valor_despachado DECIMAL(10,2),
    Total_unidades INT,
    Promedio_unidades DECIMAL(10,2),
    Desviacion_estandar_unidades DECIMAL(10,2),
    ABC_Und_Despachadas VARCHAR(1),
    ABC_valor_despachado VARCHAR(1)
);
GO

USE ordenes;
GO

DELETE FROM RESUMEN_DESPACHO
WHERE ABC_Und_Despachadas IN ('C', 'D');
GO

USE ordenes;
GO

DECLARE @anio INT, @mes INT, @codigo_sap_producto INT, @Total_Valor_despachado DECIMAL(10,2), @Total_unidades INT, @Promedio_unidades DECIMAL(10,2), @Desviacion_estandar_unidades DECIMAL(10,2), @ABC_Und_Despachadas VARCHAR(1), @ABC_valor_despachado VARCHAR(1);

DECLARE cur CURSOR FOR
SELECT anio, mes, codigo_sap_producto, Total_Valor_despachado, Total_unidades, Promedio_unidades, Desviacion_estandar_unidades, ABC_Und_Despachadas, ABC_valor_despachado
FROM RESUMEN_DESPACHO;

OPEN cur;

FETCH NEXT FROM cur INTO @anio, @mes, @codigo_sap_producto, @Total_Valor_despachado, @Total_unidades, @Promedio_unidades, @Desviacion_estandar_unidades, @ABC_Und_Despachadas, @ABC_valor_despachado;

WHILE @@FETCH_STATUS = 0
BEGIN
    INSERT INTO RESUMEN_DESPACHO_A (anio, mes, codigo_sap_producto, Total_Valor_despachado, Total_unidades, Promedio_unidades, Desviacion_estandar_unidades, ABC_Und_Despachadas, ABC_valor_despachado)
    VALUES (@anio, @mes, @codigo_sap_producto, @Total_Valor_despachado, @Total_unidades, @Promedio_unidades, @Desviacion_estandar_unidades, @ABC_Und_Despachadas, @ABC_valor_despachado);

    FETCH NEXT FROM cur INTO @anio, @mes, @codigo_sap_producto, @Total_Valor_despachado, @Total_unidades, @Promedio_unidades, @Desviacion_estandar_unidades, @ABC_Und_Despachadas, @ABC_valor_despachado;
END;

CLOSE cur;
DEALLOCATE cur;
GO




