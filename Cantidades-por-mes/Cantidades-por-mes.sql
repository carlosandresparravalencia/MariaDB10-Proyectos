-- Cantidades por mes
SELECT SUM(Cantidad) AS tiempo_ejecucion, DATE_FORMAT(Fecha,'%Y-%c') AS periodo
FROM aaa_concreto
GROUP BY periodo
ORDER BY Fecha;