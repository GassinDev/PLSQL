/*
    File: PL003 - Bloques anidados (lite) y estructuras de control
    Date: 2022-03
*/

DECLARE
    vv_aplicacion VARCHAR2(10 CHAR) := 'Mi app';
BEGIN
    BEGIN
        vv_aplicacion := vv_aplicacion || '2';
    END;
    DBMS_OUTPUT.PUT_LINE('Contenido:' || vv_aplicacion);
END;

/* Condicionales con IF */
DECLARE 
    vn_numero NUMBER := 1;
BEGIN
    IF vn_numero = 1 THEN
        DBMS_OUTPUT.PUT_LINE('Es el número 1');
    ELSIF vn_numero = 0 THEN
        DBMS_OUTPUT.PUT_LINE('Es el número 0');
    ELSE
        DBMS_OUTPUT.PUT_LINE('No se cumple ninguna condicion');
    END IF;
END;

/* Condicionales con CASE */
DECLARE 
    vn_numero NUMBER := 1;
BEGIN 
    CASE vn_numero
        WHEN 0 THEN DBMS_OUTPUT.PUT_LINE('Es el número 0'); 
        WHEN 1 THEN DBMS_OUTPUT.PUT_LINE('Es el número 1'); 
        WHEN 2 THEN DBMS_OUTPUT.PUT_LINE('Es el número 2');
        ELSE DBMS_OUTPUT.PUT_LINE('Es otro número');
    END CASE;
END;

DECLARE 
    vn_numero NUMBER := 1;
    vv_cadena VARCHAR2(1) := 'A';
BEGIN 
    CASE 
        WHEN vn_numero = 0 THEN DBMS_OUTPUT.PUT_LINE('Es el número 0');
        WHEN NOT vn_numero = 1 AND vv_cadena = 'A' THEN DBMS_OUTPUT.PUT_LINE('No es el número 1'); DBMS_OUTPUT.PUT_LINE('Y es la letra A');
        WHEN NOT vn_numero = 1 OR vv_cadena = 'A' THEN DBMS_OUTPUT.PUT_LINE('Es el número 1'); DBMS_OUTPUT.PUT_LINE('o es la letra A');
        WHEN vn_numero = 2 THEN DBMS_OUTPUT.PUT_LINE('Es el número 2');
        ELSE DBMS_OUTPUT.PUT_LINE('Es otro número');
    END CASE;

END;

/* Iterativas con FOR */
DECLARE
BEGIN
    FOR i IN 1..10 LOOP
        DBMS_OUTPUT.PUT_LINE('Iteracion número ' || i);
    END LOOP;
END;

/* Iterativas con LOOP */
DECLARE 
    vn_index NUMBER := 1;
BEGIN
    LOOP
        DBMS_OUTPUT.PUT_LINE('Iteracion número ' || vn_index);
        EXIT WHEN vn_index = 9;
        vn_index := vn_index + 1;
    END LOOP;
END;

/* Iterativas con WHILE */
DECLARE 
    vn_index NUMBER := 1;
BEGIN
    WHILE vn_index < 10 LOOP
        DBMS_OUTPUT.PUT_LINE('Iteracion número ' || vn_index);
        vn_index := vn_index + 1;
    END LOOP;
END;