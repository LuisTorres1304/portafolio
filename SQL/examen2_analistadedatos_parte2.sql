USE ordenes;
GO

CREATE TABLE RESUMEN_DESPACHO (
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

CREATE TABLE costo_prod (
    COD_SKU_SAP INT,
    COSTO DECIMAL(10,2)
);
GO


USE ordenes;
GO
INSERT INTO RESUMEN_DESPACHO (anio, mes, codigo_sap_producto, Total_Valor_despachado, Total_unidades, Promedio_unidades, Desviacion_estandar_unidades, ABC_Und_Despachadas, ABC_valor_despachado)
SELECT
    YEAR(o.FECHA_ORDEN) AS anio,
    MONTH(o.FECHA_ORDEN) AS mes,
    o.COD_SKU_SAP AS codigo_sap_producto,
    SUM(cp.COSTO * o.UND_ORDEN) AS Total_Valor_despachado,
    SUM(o.UND_ORDEN) AS Total_unidades,
    AVG(o.UND_ORDEN) AS Promedio_unidades,
    STDEV(o.UND_ORDEN) AS Desviacion_estandar_unidades,
    '' AS ABC_Und_Despachadas,
    '' AS ABC_valor_despachado
FROM
    WMS.ord_orig o
    INNER JOIN costo_prod cp ON o.COD_SKU_SAP = cp.COD_SKU_SAP
WHERE
    MONTH(o.FECHA_ORDEN) = 9 -- Mes de septiembre
GROUP BY
    YEAR(o.FECHA_ORDEN),
    MONTH(o.FECHA_ORDEN),
    o.COD_SKU_SAP;
GO








