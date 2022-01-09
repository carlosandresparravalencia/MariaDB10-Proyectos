-- Número de clientes de Concreto
SELECT COUNT(DISTINCT aaa_concreto.Facturar_a) AS cliente_concreto
FROM aaa_concreto LEFT JOIN aaa_pretensado ON aaa_concreto.Facturar_a = aaa_pretensado.Facturar_a
WHERE ID_Remisión_Pretensado IS NULL AND aaa_concreto.Facturar_a != 36;

-- Número de clientes de Pretensados
SELECT COUNT(DISTINCT aaa_pretensado.Facturar_a) AS cliente_pretensado
FROM aaa_pretensado LEFT JOIN aaa_concreto ON aaa_pretensado.Facturar_a = aaa_concreto.Facturar_a
WHERE ID_Remisión_Concreto IS NULL AND aaa_pretensado.Facturar_a != 36;

-- Número de clientes en común 
SELECT COUNT(DISTINCT aaa_concreto.Facturar_a) AS cliente_ambos
FROM aaa_concreto INNER JOIN aaa_pretensado ON aaa_concreto.Facturar_a = aaa_pretensado.Facturar_a
WHERE aaa_concreto.Facturar_a != 36;

-- Número sin área asociada
SELECT COUNT(ID_Cliente) AS cliente_ninguno
FROM aaa_cliente LEFT JOIN aaa_concreto ON ID_Cliente = aaa_concreto.Facturar_a LEFT JOIN aaa_pretensado ON ID_Cliente = aaa_pretensado.Facturar_a
WHERE ID_Remisión_Concreto IS NULL AND ID_Remisión_Pretensado IS NULL;


-- Porcentaje de clientes de Concreto
SELECT COUNT(DISTINCT aaa_concreto.Facturar_a) / (SELECT COUNT(ID_Cliente)
    FROM aaa_cliente
    WHERE ID_Cliente != 36) * 100 AS cliente_concreto
FROM aaa_concreto LEFT JOIN aaa_pretensado ON aaa_concreto.Facturar_a = aaa_pretensado.Facturar_a
WHERE ID_Remisión_Pretensado IS NULL AND aaa_concreto.Facturar_a != 36;

-- Porcentaje de clientes de Pretensados
SELECT COUNT(DISTINCT aaa_pretensado.Facturar_a) / (SELECT COUNT(ID_Cliente)
    FROM aaa_cliente
    WHERE ID_Cliente != 36) * 100 AS cliente_pretensado
FROM aaa_pretensado LEFT JOIN aaa_concreto ON aaa_pretensado.Facturar_a = aaa_concreto.Facturar_a
WHERE ID_Remisión_Concreto IS NULL AND aaa_pretensado.Facturar_a != 36;

-- Porcentaje de clientes en común
SELECT COUNT(DISTINCT aaa_concreto.Facturar_a) / (SELECT COUNT(ID_Cliente)
    FROM aaa_cliente
    WHERE ID_Cliente != 36) * 100 AS cliente_ambos
FROM aaa_concreto INNER JOIN aaa_pretensado ON aaa_concreto.Facturar_a = aaa_pretensado.Facturar_a
WHERE aaa_concreto.Facturar_a != 36;

-- Porcentaje de clientes sin área asociada
SELECT COUNT(ID_Cliente) / (SELECT COUNT(ID_Cliente)
    FROM aaa_cliente
    WHERE ID_Cliente != 36) * 100 AS cliente_ninguno
FROM aaa_cliente LEFT JOIN aaa_concreto ON ID_Cliente = aaa_concreto.Facturar_a LEFT JOIN aaa_pretensado ON ID_Cliente = aaa_pretensado.Facturar_a
WHERE ID_Remisión_Concreto IS NULL AND ID_Remisión_Pretensado IS NULL;
