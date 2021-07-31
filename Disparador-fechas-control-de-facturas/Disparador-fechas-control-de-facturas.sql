-- 1. Visualice los registros tabla fact_reporte
SELECT id_reporte, nombre_cuenta, ENERO, FEBRERO, MARZO, ABRIL, MAYO, JUNIO, JULIO, AGOSTO, SEPTIEMBRE, OCTUBRE, NOVIEMBRE, DICIEMBRE
FROM fact_reporte;
-- 2. Visualice los registros tabla factura
SELECT Mes
FROM factura;
-- 3. Crear disparador en la tabla factura
DELIMITER //
CREATE TRIGGER ai_fact_reporte
AFTER
INSERT ON
factura
FOR
EACH
ROW
BEGIN
    IF NEW.Mes = 1 THEN
    UPDATE fact_reporte SET ENERO = NOW() WHERE New.Cuenta = nombre_cuenta;
    ELSEIF NEW.Mes = 2 THEN
    UPDATE fact_reporte SET FEBRERO = NOW() WHERE New.Cuenta = nombre_cuenta;
    ELSEIF NEW.Mes = 3 THEN
    UPDATE fact_reporte SET MARZO = NOW() WHERE New.Cuenta = nombre_cuenta;
    ELSEIF NEW.Mes = 4 THEN
    UPDATE fact_reporte SET ABRIL = NOW() WHERE New.Cuenta = nombre_cuenta;
    ELSEIF NEW.Mes = 5 THEN
    UPDATE fact_reporte SET MAYO = NOW() WHERE New.Cuenta = nombre_cuenta;
    ELSEIF NEW.Mes = 6 THEN
    UPDATE fact_reporte SET JUNIO = NOW() WHERE New.Cuenta = nombre_cuenta;
    ELSEIF NEW.Mes = 7 THEN
    UPDATE fact_reporte SET JULIO = NOW() WHERE New.Cuenta = nombre_cuenta;
    ELSEIF NEW.Mes = 8 THEN
    UPDATE fact_reporte SET AGOSTO = NOW() WHERE New.Cuenta = nombre_cuenta;
    ELSEIF NEW.Mes = 9 THEN
    UPDATE fact_reporte SET SEPTIEMBRE = NOW() WHERE New.Cuenta = nombre_cuenta;
    ELSEIF NEW.Mes = 10 THEN
    UPDATE fact_reporte SET OCTUBRE = NOW() WHERE New.Cuenta = nombre_cuenta;
    ELSEIF NEW.Mes = 11 THEN
    UPDATE fact_reporte SET NOVIEMBRE = NOW() WHERE New.Cuenta = nombre_cuenta;
    ELSE
    UPDATE fact_reporte SET DICIEMBRE = NOW() WHERE New.Cuenta = nombre_cuenta;
END
IF;
END; //
DELIMITER ;