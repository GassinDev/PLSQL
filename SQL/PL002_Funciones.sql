s----------------------------------------------------------------------------------------------------------------------------
-- File: PL002
-- Date: 2022-03
-- 
-- Uso de funciones en PL/SQL
----------------------------------------------------------------------------------------------------------------------------

----------------------------------------------------------------------------------------------------------------------------
-- De control
----------------------------------------------------------------------------------------------------------------------------
-- NVL
----------------------------------------------------------------------------------------------------------------------------
DECLARE 
    vv_cadena VARCHAR2(50 CHAR);
    
BEGIN
    dbms_output.put_line('Teniendo la cadena:  ' || vv_cadena);
    dbms_output.put_line('Teniendo la cadena:  ' || NVL(vv_cadena, 'vacia o nula'));
    vv_cadena := NVL(vv_cadena, 'Si vv_cadena es nulo se registrará esta cadena');
    dbms_output.put_line('Teniendo la cadena:  ' || vv_cadena);
    
END;
/

----------------------------------------------------------------------------------------------------------------------------
-- LENGTH
----------------------------------------------------------------------------------------------------------------------------
DECLARE 
    vv_cadena VARCHAR2(50 CHAR);
    
BEGIN
    dbms_output.put_line('Teniendo la cadena:  ' || vv_cadena);
    dbms_output.put_line('La longitud de la cadena es:  ' || LENGTH(vv_cadena));
    --if LENGTH(vv_cadena) is null then dbms_output.put_line('Nulo'); else dbms_output.put_line('Nulo'); end if;
    vv_cadena := NVL(vv_cadena, 'Si vv_cadena es nulo se registrará esta cadena');
    dbms_output.put_line('La longitud de la cadena es:  ' || LENGTH(vv_cadena));
    
END;
/

----------------------------------------------------------------------------------------------------------------------------
-- Numéricas
----------------------------------------------------------------------------------------------------------------------------
BEGIN
	-- ROUND
	dbms_output.put_line('El numero redondeado de 5.3 es ' || ROUND(5.3) || '.');
	dbms_output.put_line('El numero redondeado de 5.777 es ' || ROUND(5.777, 2) || '.');
	
	-- TRUNC
	dbms_output.put_line('El numero truncado de 5.3 es ' || TRUNC(5.3) || '.');
	dbms_output.put_line('El numero truncado de 5.777 es ' || TRUNC(5.777, 2) || '.');
	
END;
/

----------------------------------------------------------------------------------------------------------------------------
-- De cadena
----------------------------------------------------------------------------------------------------------------------------
-- SUBSTR
----------------------------------------------------------------------------------------------------------------------------
DECLARE
    vv_cadena VARCHAR2(20 CHAR) := 'Esto es una cadena';
    
BEGIN
    dbms_output.put_line('Teniendo la cadena:  ' || vv_cadena || '.');
    dbms_output.put_line('La subcadena desde la posicion 6 es: ' || SUBSTR(vv_cadena, 6));
    dbms_output.put_line('La subcadena desde la posicion -6 es: ' || SUBSTR(vv_cadena, -6)); -- Empieza por la derecha
	dbms_output.put_line('Los 2 caracteres desde la posicion 6 son: ' || SUBSTR(vv_cadena, 6, 2));
    
END;
/


----------------------------------------------------------------------------------------------------------------------------
-- INSTR
----------------------------------------------------------------------------------------------------------------------------
DECLARE
    vv_cadena VARCHAR2(25 CHAR) := 'Esto es una cadena normal';
    
BEGIN
    dbms_output.put_line('Teniendo la cadena:  ' || vv_cadena || '.');
    dbms_output.put_line('La posicion en la que se encuentra la letra n es: ' || INSTR(vv_cadena, 'n'));
    dbms_output.put_line('El caracter que hay en la posicion 10 es: ' || SUBSTR(vv_cadena, 10, 1)); 
    dbms_output.put_line('La subcadena desde la posicion 10 es: ' || SUBSTR(vv_cadena, 10));
    dbms_output.put_line('La posicion en la que se encuentra la letra n es: ' || INSTR(vv_cadena, 'n', 1, 3));
    dbms_output.put_line('El caracter que hay en la posicion 20 es: ' || SUBSTR(vv_cadena, 20, 1)); 
    dbms_output.put_line('La subcadena desde la posicion 20 es: ' || SUBSTR(vv_cadena, 20));
    
END;
/


----------------------------------------------------------------------------------------------------------------------------
-- UPPER y LOWER
----------------------------------------------------------------------------------------------------------------------------
DECLARE
    vv_cadena VARCHAR2(25 CHAR) := 'Esto es una cadena normal';
    
BEGIN   
    dbms_output.put_line('Teniendo la cadena:  ' || vv_cadena || '.');
    dbms_output.put_line('La cadena en minuscula es: ' || UPPER(vv_cadena));
    dbms_output.put_line('La cadena en minuscula es: ' || LOWER(vv_cadena));
    
END;
/


----------------------------------------------------------------------------------------------------------------------------
-- REPLACE
----------------------------------------------------------------------------------------------------------------------------
DECLARE 
    vv_cadena VARCHAR2(25 CHAR) := 'Esto%es%una%cadena%normal';

BEGIN
    dbms_output.put_line('Teniendo la cadena:  ' || vv_cadena || '.');
    
    dbms_output.put_line('La cadena escrita correctamente es: ' || REPLACE(vv_cadena, '%', ' ') || '.');
    dbms_output.put_line('Necesitamos cambiar los separadores de una linea de fichero: ' || REPLACE(vv_cadena, '%', '|') || '.');
    dbms_output.put_line('Necesitamos cambiar los separadores de una linea de fichero: ' || REPLACE('1%25/05/2021%Producto1%50%C/Melancolia%', '%') || '.');
    dbms_output.put_line('Necesitamos cambiar los separadores de una linea de fichero: ' || REPLACE('1%_%25/05/2021%_%Producto1%_%50%_%C/Melancolia%_%', '%_%', '|') || '.');
    
END;
/


----------------------------------------------------------------------------------------------------------------------------
-- LPAD, RPAD, LTRIM, RTRIM, TRIM
----------------------------------------------------------------------------------------------------------------------------
DECLARE 
    vv_cadena VARCHAR2(100 CHAR) := 'Esto es una cadena';
    
BEGIN
    dbms_output.put_line('Teniendo la cadena:  ' || vv_cadena);
    dbms_output.put_line('La longitud de la cadena es:  ' || LENGTH(vv_cadena));
    dbms_output.put_line('--------------------------------------------------------------------------------------');
    
    vv_cadena := LPAD(vv_cadena, 50, '%');
    dbms_output.put_line('La cadena con LPAD es:  ' || vv_cadena);
    dbms_output.put_line('La longitud de la cadena con LPAD es:  ' || LENGTH(vv_cadena));
    dbms_output.put_line('--------------------------------------------------------------------------------------');
    
    vv_cadena := LTRIM(vv_cadena, '%');
    dbms_output.put_line('La cadena con LTRIM es:  ' || vv_cadena);
    dbms_output.put_line('La longitud de la cadena con LTRIM es:  ' || LENGTH(vv_cadena));
    dbms_output.put_line('--------------------------------------------------------------------------------------');
    
    vv_cadena := RPAD(vv_cadena, 50, '%');
    dbms_output.put_line('La cadena con RPAD es:  ' || vv_cadena);
    dbms_output.put_line('La longitud de la cadena con RPAD es:  ' || LENGTH(vv_cadena));
    dbms_output.put_line('--------------------------------------------------------------------------------------');
    
    vv_cadena := RTRIM(vv_cadena, '%');
    dbms_output.put_line('La cadena con RTRIM es:  ' || vv_cadena);
    dbms_output.put_line('La longitud de la cadena con RTRIM es:  ' || LENGTH(vv_cadena));
    dbms_output.put_line('--------------------------------------------------------------------------------------');
    
    vv_cadena := RPAD(LPAD(vv_cadena, 50, '%'), 100, '%');
    dbms_output.put_line('La cadena con LPAD y RPAD es:  ' || vv_cadena);
    dbms_output.put_line('La longitud de la cadena con LPAD y RPAD  es:  ' || LENGTH(vv_cadena));
    dbms_output.put_line('--------------------------------------------------------------------------------------');
    
    vv_cadena := TRIM('%' FROM vv_cadena);
    dbms_output.put_line('La cadena con TRIM(%) es:  ' || vv_cadena);
    dbms_output.put_line('La longitud de la cadena con con TRIM(%)  es:  ' || LENGTH(vv_cadena));
    
END;
/


----------------------------------------------------------------------------------------------------------------------------
-- De conversion
----------------------------------------------------------------------------------------------------------------------------
-- TO_NUMBER
----------------------------------------------------------------------------------------------------------------------------
DECLARE	
	vv_numero VARCHAR2(2) := '89';
	vn_numero NUMBER(2); 
	
BEGIN 
	dbms_output.put_line('La cadena contiene el valor:' || vv_numero);
	vn_numero := TO_NUMBER(vv_numero) - 2;
	dbms_output.put_line('Si le resto 2, tengo el resultado: ' || vn_numero);
	
END;
/


----------------------------------------------------------------------------------------------------------------------------
-- TO_DATE
----------------------------------------------------------------------------------------------------------------------------


----------------------------------------------------------------------------------------------------------------------------
-- De fecha
----------------------------------------------------------------------------------------------------------------------------
-- TRUNC
----------------------------------------------------------------------------------------------------------------------------
BEGIN 
    dbms_output.put_line('TRUNC de ' || sysdate || ' es ' || trunc(sysdate) || '.');
    dbms_output.put_line('TRUNC de ' || sysdate || ' es ' || to_char(trunc(sysdate), 'DD/MM/YYYY HH24:MI:SS') || '.');
    dbms_output.put_line('El primer dia del mes es ' || trunc(sysdate, 'mm') || '.');
    dbms_output.put_line('El primer dia del anio es ' || trunc(sysdate, 'yyyy') || '.');
    
END;
/


--------------------------------------------------------------------------------
-- Uso de funciones SQL en PL/SQL - PRACTICA
-- Existen ocasiones en las que la interconexion entre sistemas se realiza 
-- mediante la carga de ficheros de texto plano
--------------------------------------------------------------------------------

DECLARE
    -- Variable utilizada para simular la linea de un fichero recibido
    vv_texto    VARCHAR2(100 CHAR)  := 'Destornillador|40|3.25|25/04/2021';
    
    -- Variables de los campos recibidos en la linea
    vv_producto         VARCHAR2(20 CHAR);
    vn_unidades         NUMBER(2);
    vn_precio           NUMBER(3,2);
    vd_fecha_entrega    DATE;
    
BEGIN
    vv_producto 		:= SUBSTR(vv_texto, 1, INSTR(vv_texto, '|') -1);
    vn_unidades         := TO_NUMBER(SUBSTR(vv_texto, INSTR(vv_texto, '|', 1, 1) + 1, (INSTR(vv_texto, '|', 1, 2) - (INSTR(vv_texto, '|', 1, 1) +1))));
    vn_precio           := SUBSTR(vv_texto, INSTR(vv_texto, '|', 1, 2) + 1, (INSTR(vv_texto, '|', 1, 3) - (INSTR(vv_texto, '|', 1, 2) +1)));
    vd_fecha_entrega    := TO_DATE(SUBSTR(vv_texto, INSTR(vv_texto, '|', 1, 3) + 1), 'DD/MM/YYYY');
    
    DBMS_OUTPUT.PUT_LINE('El producto es: ' || vv_producto);
    DBMS_OUTPUT.PUT_LINE('El número de unidades recibidas es: ' || vn_unidades);
    DBMS_OUTPUT.PUT_LINE('El precio unitario es: ' || vn_precio);
    DBMS_OUTPUT.PUT_LINE('La fecha de entrega es: ' || TO_CHAR(vd_fecha_entrega, 'DD/MM/YYYY'));
END;
/



DECLARE 
    -- Variable utilizada para simular la linea de un fichero recibido 
    vv_texto    VARCHAR2(100 CHAR)  := 'Destornillador |40|3.25|25/04/2021| |'; 
     
    -- Variables de los campos recibidos en la linea 
    vv_producto         VARCHAR2(14 CHAR); 
    vn_unidades         NUMBER(2); 
    vn_precio           NUMBER(3,2); 
    vd_fecha_entrega    DATE; 
    vv_localildad       VARCHAR2(20 CHAR); -- Recibimos un valor nulo
     
BEGIN 
    vv_producto         := TRIM(' ' FROM SUBSTR(vv_texto, 1, INSTR(vv_texto, '|') -1)); 
    vn_unidades         := TO_NUMBER(SUBSTR(vv_texto, INSTR(vv_texto, '|', 1, 1) + 1, (INSTR(vv_texto, '|', 1, 2) - (INSTR(vv_texto, '|', 1, 1) +1)))); 
    vn_precio           := SUBSTR(vv_texto, INSTR(vv_texto, '|', 1, 2) + 1, (INSTR(vv_texto, '|', 1, 3) - (INSTR(vv_texto, '|', 1, 2) +1))); 
    vd_fecha_entrega    := TO_DATE(SUBSTR(vv_texto, INSTR(vv_texto, '|', 1, 3) + 1, (INSTR(vv_texto, '|', 1, 4) - (INSTR(vv_texto, '|', 1, 3) +1))), 'DD/MM/YYYY'); 
    vv_localildad       := NVL(TRIM(' ' FROM SUBSTR(vv_texto, INSTR(vv_texto, '|', 1, 4) + 1, (INSTR(vv_texto, '|', 1, 5) - (INSTR(vv_texto, '|', 1, 4) +1)))), 'Sin localidad');
     
    DBMS_OUTPUT.PUT_LINE('El producto es: ' || vv_producto); 
    DBMS_OUTPUT.PUT_LINE('El número de unidades recibidas es: ' || vn_unidades); 
    DBMS_OUTPUT.PUT_LINE('El precio unitario es: ' || vn_precio); 
    DBMS_OUTPUT.PUT_LINE('La fecha de entrega es: ' || TO_CHAR(vd_fecha_entrega, 'DD/MM/YYYY')); 
    DBMS_OUTPUT.PUT_LINE('La localidad es: ' || vv_localildad); 
    DBMS_OUTPUT.PUT_LINE('-----------------------------------------------------------------------------');
    DBMS_OUTPUT.PUT_LINE(RPAD(vv_producto, 20, ' ') ||
                            LPAD(vn_unidades, 5, ' ') ||
                            LPAD(vn_precio, 6, ' ') ||
                            RPAD(TO_CHAR(vd_fecha_entrega, 'DD/MM/YYYY'), 12, ' ') ||
                            RPAD(vv_localildad, 25, ' ') 
                        );
    DBMS_OUTPUT.PUT_LINE('-----------------------------------------------------------------------------');
    DBMS_OUTPUT.PUT_LINE('La longitud del producto es ' || LENGTH(vv_producto) || ' pero en la linea su longitud es ' || LENGTH(RPAD(vv_producto, 20, ' '))); 
    DBMS_OUTPUT.PUT_LINE('La longitud del número de unidades es ' || LENGTH(vn_unidades) || ' pero en la linea su longitud es ' || LENGTH(LPAD(vn_unidades, 5, ' '))); 
    DBMS_OUTPUT.PUT_LINE('La longitud del precio unitario es ' || LENGTH(vn_precio) || ' pero en la linea su longitud es ' || LENGTH(LPAD(vn_precio, 6, ' '))); 
    DBMS_OUTPUT.PUT_LINE('La longitud de la fecha de entrega es ' || LENGTH(TO_CHAR(vd_fecha_entrega, 'DD/MM/YYYY')) || ' pero en la linea su longitud es ' || LENGTH(RPAD(TO_CHAR(vd_fecha_entrega, 'DD/MM/YYYY'), 12, ' '))); 
    DBMS_OUTPUT.PUT_LINE('La longitud de la localidad es ' || LENGTH(vv_localildad) || ' pero en la linea su longitud es ' || LENGTH(RPAD(vv_localildad, 25, ' '))); 
    
END; 


begin
    -- ascii
    dbms_output.put_line('El caracter es: ' || ascii(' '));
    dbms_output.put_line('El caracter es:' || chr(32) || '.');
    
    -- Fecha
    dbms_output.put_line('La fecha dentro de dos meses es: ' || to_char(add_months(sysdate, 2), 'dd/mm/yyyy') || '.');
    dbms_output.put_line('La fecha hace dos meses fue: ' || to_char(add_months(sysdate, -2), 'dd/mm/yyyy') || '.');
    dbms_output.put_line('La fecha actual es: ' || current_date || '.');
    dbms_output.put_line('La fecha hora actual es: ' || current_timestamp || '.');
    dbms_output.put_line('La fecha hora actual es: ' || to_char(current_timestamp, 'dd/mm/yyyy hh24:mi:ss') || '.');
    dbms_output.put_line('Los meses entre: ' || sysdate || ' y ' || to_char(add_months(sysdate, -2), 'dd/mm/yyyy') || ' son ' || months_between(sysdate, add_months(sysdate, -2)));
    dbms_output.put_line('Los meses entre: ' || to_date('01/01/2021', 'dd/mm/yyyy') || ' y ' || to_date('01/05/2021', 'dd/mm/yyyy') || ' son ' || months_between(to_date('15/05/2021', 'dd/mm/yyyy'), to_date('25/01/2021', 'dd/mm/yyyy')));
    --dbms_output.put_line('El próximo lunes es: ' || next_day(current_date, 'monday') || '.');
    dbms_output.put_line('ROUND de ' || sysdate || ' es ' || round(sysdate) || '.');
    dbms_output.put_line('TRUNC de ' || sysdate || ' es ' || trunc(sysdate) || '.');
    dbms_output.put_line('El primer dia del mes es ' || trunc(sysdate, 'mm') || '.');
    dbms_output.put_line('El primer dia del anio es ' || trunc(sysdate, 'yyyy') || '.');
    dbms_output.put_line('Hoy empezo el dia a las ' || to_char(trunc(current_timestamp), 'dd/mm/yyyy hh24:mi:ss') || '.');
    dbms_output.put_line('Ahora es ' || to_char(sysdate, 'dd/mm/yyyy hh24:mi:ss') || '.');
    dbms_output.put_line('Hoy empezo el dia a las ' || to_char(trunc(sysdate), 'dd/mm/yyyy hh24:mi:ss') || '.');
    
    dbms_output.put_line('El dia actual es: ' || extract(day from sysdate) || '.');
    dbms_output.put_line('El mes actual es: ' || extract(month from sysdate) || '.');
    dbms_output.put_line('El anio actual es: ' || extract(year from sysdate) || '.');
    dbms_output.put_line('La hora actual es: ' || extract(hour from current_timestamp) || '.');
    dbms_output.put_line('Los minutos actuales son: ' || extract(minute from current_timestamp) || '.');
    dbms_output.put_line('Los segundos actuales son: ' || extract(second from current_timestamp) || '.');
    
    -- Numerico
    dbms_output.put_line('El entero inferior de 5.25 es ' || floor(5.25) || '.');
    dbms_output.put_line('El resto de 5 / 3 es ' || mod(5,3) || '.');
    
    dbms_output.put_line('El numero truncado de 5.733 es ' || trunc(5.737, 2) || '.');
    
    -- Longitud
    dbms_output.put_line('La longitud es ' || length(5.25) || '.');
    dbms_output.put_line('La longitud es ' || length('Cadsena de texto') || '.');
    dbms_output.put_line('La longitud es ' || length(sysdate) || '.');
    
    -- Cadena
    dbms_output.put_line('la cadena en minuscula es: ' || lower('ESTO ES UNA CADENA EN MINUSCULA') || '.');
    dbms_output.put_line('la cadena en minuscula es: ' || upper('esto es una cadena en mayuscula') || '.');
    dbms_output.put_line('La cadena escrita correctamente es: ' || replace('Esto%era%una%cadena%con%separadores%incorrectos', '%', ' ') || '.');
    dbms_output.put_line('Necesitamos cambiar los separadores de una linea de fichero: ' || replace('1%25/05/2021%Producto1%50%C/Melancolia%', '%', '|') || '.');
    dbms_output.put_line('Necesitamos cambiar los separadores de una linea de fichero: ' || replace('1%25/05/2021%Producto1%50%C/Melancolia%', '%') || '.');
    dbms_output.put_line('Necesitamos cambiar los separadores de una linea de fichero: ' || replace('1%_%25/05/2021%_%Producto1%_%50%_%C/Melancolia%_%', '%_%', '|') || '.');
    
end;