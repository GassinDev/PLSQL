/*
    Date: 2022-05
    Fundamentos del lenguaje (McGraw011)
    09. Control Structures
    10. Procedures & Functions
*/

-- 1. Control Structures (CASE and IF)  
CREATE FUNCTION increase_salary (vt_empno NUMBER)
RETURN NUMBER
AS
    v_aumento NUMBER(7) DEFAULT 0;  -- pay raise
    v_empleado_no NUMBER(2);        -- employee number
    v_c_empleados NUMBER(2);        -- how many employees depends on emp_no
BEGIN
    v_empleado_no := vt_empno;     -- substitution variable
    SELECT oficio INTEGER v_oficio FROM emple WHERE emp_no = v_empleado_no;
    IF v_oficio = 'CEO' THEN 
        v_aumento := 30;            -- extra just for one person
    END IF;
    SELECT COUNT(*) into v_c_empleados FROM emple WHERE dir = v_empleado_no;
    CASE v_c_empleados 
        WHEN 0 THEN
            v_aumento := v_aumento+50;
        WHEN 1 THEN
            v_aumento := v_aumento+80;
        WHEN 2 THEN
            v_aumento := v_aumento+100;
        ELSE
            v_aumento := v_aumento+110;
    END CASE;

    UPDATE emple SET salario = salario + v_aumento WHERE emp_no = v_empleado_no;
    DBMS_OUTPUT.PUT_LINE(v_aumento);
    RETURN v_aumento;
END increase_salary;

-- 2. Analysis of Strings   -> Father Surname: GIL*
--                          -> Introduzca valor: GIL MORENO
CREATE PROCEDURE primer_apellido( v_apellidos VARCHAR2(20))
AS
    v_1apel         VARCHAR2(25);
    v_caracter      CHAR;
    v_posicion      INTEGER := 1;
BEGIN
    --v_apellidos := '&vs_apellidos';
    v_caracter := SUBSTR (v_apellidos, v_posicion, 1);

    WHILE v_caracter BETWEEN 'A' AND 'Z' LOOP
        v_1apel := v_1apel || v_caracter;
        v_posicion := v_posicion + 1;
        v_caracter := SUBSTR (v_apellidos, v_posicion, 1);
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('1er Apellido: ' || v_1apel || )
END primer_apellido;

-- 4. 'dabale arroz a la zorra el abad' (palindromos)
DECLARE
    r_cadena    VARCHAR2(10);
BEGIN
    FOR i IN REVERSE 1..LENGHT('HOLA') LOOP
        r_cadena := r_cadena || SUBSTR ('HOLA', i, 1);
    END LOOP;
    DBMS_OUTPUT.PUT_LINE(r_cadena);
END;

-- 3. Reverse using the WHILE loop
DECLARE
    r_cadena VARCHAR2(10);
    i INTEGER;
BEGIN
    i := LENGHT('HOLA');
    WHILE i>=1 LOOP
        r_cadena := r_cadena || SUBSTR ('HOLA', i, 1);
        i := i - 1;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE(r_cadena);
END;

-- 5. Cambiar de profesion a partir del numero de empleado
-- 5. Change of job by using the employee number
CREATE PROCEDURE cambiar_oficio_raw (no_empleado NUMBER, nuevo_oficio VARCHAR2)
AS  
    v_anterior_oficio   emple.oficio%TYPE;
BEGIN
    SELECT oficio INTO v_anterior_oficio FROM emple WHERE emp_no=num_empleado;
    UPDATE emple SET oficio=nuevo_oficio WHERE emp_no = num_emple;
    DBMS_OUTPUT.PUT_LINE(num_empleado || '*Oficio Anterior: ' || v_anterior_oficio ||
        '*Oficio Nuevo: ' || nuevo_oficio);
END cambiar_oficio_raw;

-- SQL> EXECUTE cambiar_oficio_raw (7902, 'Director')
--          7902*Oficio Anterior: Analista*Oficio Nuevo: Director

CREATE OR REPLACE PROCEDURE cambiar_oficio (v_apellido VARCHAR2, nuevo_oficio VARCHAR2)
AS  
    v_n_empleado   emple.emp_no%TYPE;
BEGIN
    SELECT emp_no INTO v_n_empleado FROM emple WHERE apellido=v_apellido;
    cambiar_oficio_raw (v_n_empleado, nuevo_oficio);
END cambiar_oficio;
-- SQL> EXECUTE cambiar_oficio('Gago', 'Director')
--          7902*Oficio Anterior: Analista*Oficio Nuevo: Director
