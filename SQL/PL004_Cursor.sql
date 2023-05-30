/*
    File: PL004 - PLSQL, Cursor, Exception
    Date: 2022-03
*/

CREATE table tbProductos(
    nIDProducto     NUMBER(3) PRIMARY KEY,
    vDesProducto    VARCHAR2(50),
    nUnidades       NUMBER(4),
    nPrecioUnidad   NUMBER(6,2),
    dFechaAlta      DATE
);

BEGIN 
    INSERT INTO tbProductos VALUES (
        1, 'Destornillador', 50, 3.25, 
        TO_DATE('05/05/2022', 'DD/MM/YYYY')
    );
    COMMIT;
END;

SELECT * FROM tbProductos;

DECLARE 
    vr_tbproductos tbProductos%ROWTYPE; 
BEGIN 
    SELECT * INTO vr_tbproductos FROM tbProductos WHERE nIDProducto = 1; 
    DBMS_OUTPUT.PUT_LINE('Producto: ' || vr_tbproductos.vDesProducto);
    DBMS_OUTPUT.PUT_LINE('Unidades: ' || vr_tbproductos.nUnidades); 
    DBMS_OUTPUT.PUT_LINE('Precio: ' || vr_tbproductos.nPrecioUnidad); 
    DBMS_OUTPUT.PUT_LINE('Fecha: ' || TO_CHAR(vr_tbproductos.dFechaAlta, 'DD/MM/YYYY'));     
END;

-- Excepciones anidadas
DECLARE 
    vr_tbproductos tbProductos%ROWTYPE; 
BEGIN
    
    BEGIN 
        INSERT INTO tbProductos VALUES (2, 'Otro', 9, 1.25, TO_DATE('08/04/2022', 'DD/MM/YYYY'));
    EXCEPTION
        WHEN DUP_VAL_ON_INDEX THEN
            DBMS_OUTPUT.PUT_LINE('El id ya existe en el stma'); 
    END;

    BEGIN 
        SELECT * INTO vr_tbproductos FROM tbProductos; 
    EXCEPTION
        WHEN TOO_MANY_ROWS THEN 
            DBMS_OUTPUT.PUT_LINE('Hay mas de un registro'); 
    END;

    BEGIN 
        
    BEGIN 
        UPDATE tbProductos SET nPrecioUnidad = 3.5 WHERE nIDProducto = 1;
    EXCEPTION
        WHEN OTHERS THEN 
            BMS_OUTPUT.PUT_LINE(sqlcode);
            BMS_OUTPUT.PUT_LINE(sqlerrm);
    END;
END;

-- Algunas excepciones predefinidas son:
--  * DUP_VAL_ON_INDEX: insertar un registro que incumple la restricción de registro único.
--  * INVALID_NUMBER. Ha fallado la conversión de una cadena a número.
--  * NO_DATA_FOUND: Una consulta SQL no ha devuelto ningún registro.
--  * TOO_MANY_ROWS: Una consulta SQL ha devuelto mas de un registro


-- Cursor explícito estático 
BEGIN 
	
	FOR vr_tbProductos IN (SELECT * FROM tbProductos) LOOP 
        DBMS_OUTPUT.PUT_LINE('Registro: ' || vr_tbProductos.nIDProducto); 
        DBMS_OUTPUT.PUT_LINE('El producto es: ' || vr_tbProductos.vDesProducto); 
        DBMS_OUTPUT.PUT_LINE('El número de unidades recibidas es: ' || vr_tbProductos.nUnidades); 
        DBMS_OUTPUT.PUT_LINE('El precio unitario es: ' || vr_tbProductos.nPrecioUnidad); 
        DBMS_OUTPUT.PUT_LINE('La fecha de entrega es: ' || TO_CHAR(vr_tbProductos.dFechaAlta, 'DD/MM/YYYY'));
        DBMS_OUTPUT.PUT_LINE('---------------------------------------------------------------------------'); 
    END LOOP;
END;

-- Cursor explícito dinámico
DECLARE
    vn_IDProducto_inicio    TBPRODUCTOS.NIDPRODUCTO%TYPE;
    vn_IDProducto_fin       TBPRODUCTOS.NIDPRODUCTO%TYPE;
    
    CURSOR c_tbProductos (pin_IDProducto_ini TBPRODUCTOS.NIDPRODUCTO%TYPE, 
                          pin_IDProducto_fin TBPRODUCTOS.NIDPRODUCTO%TYPE) 
    IS 
        SELECT * FROM tbProductos 
        WHERE nIDProducto BETWEEN vn_IDProducto_inicio AND vn_IDProducto_fin;
        
BEGIN 

    vn_IDProducto_inicio    := 1;
    vn_IDProducto_fin       := 4;
	FOR vr_tbProductos IN c_tbProductos(vn_IDProducto_inicio, vn_IDProducto_fin) LOOP 
        
        DBMS_OUTPUT.PUT_LINE('Registro: ' || vr_tbProductos.nIDProducto); 
        DBMS_OUTPUT.PUT_LINE('El producto es: ' || vr_tbProductos.vDesProducto); 
        DBMS_OUTPUT.PUT_LINE('El número de unidades recibidas es: ' || vr_tbProductos.nUnidades); 
        DBMS_OUTPUT.PUT_LINE('El precio unitario es: ' || vr_tbProductos.nPrecioUnidad); 
        DBMS_OUTPUT.PUT_LINE('La fecha de entrega es: ' || TO_CHAR(vr_tbProductos.dFechaAlta, 'DD/MM/YYYY'));
        DBMS_OUTPUT.PUT_LINE('---------------------------------------------------------------------------'); 
        
    END LOOP;    
END;

