-- CURSORES

-- 1. Visualizar empleados del dept 20
DECLARE
    CURSOR c1 IS
        SELECT apellido FROM emple WHERE dept_no = 20;
    v_apellido  VARCHAR2(10);
BEGIN
    OPEN c1;
    LOOP
        FETCH c1 INTO v_apellido;
        EXIT WHEN c1%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(TO_CHAR(c1%ROWCOUNT,'99.')||v_apellido);
    END LOOP;
    CLOSE c1;
END;
/

-- 2. Visualizar empleados usando una vble de acoplamiento
CREATE PROCEDURE ver_empl_por_dept(dep VARCHAR2)
AS
    v_dept  NUMBER(2);
    CURSOR c1 IS
        SELECT apellido FROM emple WHERE dept_no = v_dept;
    v_apellido  VARCHAR2(10);
BEGIN
    v_dept := dep;
    OPEN c1;
    FETCH c1 INTO v_apellido;
    WHILE c1%FOUND LOOP
        ...
    END LOOP;
    CLOSE c1;
END;
/
SQL> EXECUTE ver_empl_por_dept(20);

-- 3. Apellidos y fecha de alta ordenados por fecha de alta
DECLARE
    CURSOR c1 IS
        SELECT apellido, fecha_alt FROM emple ORDER BY fecha_alt;
BEGIN
    FOR v_reg IN c1 LOOP
        DBMS_OUTPUT.PUT_LINE(v_reg.apellido || ' ' || v_reg.fecha_alt);
    END LOOP;
END;

-- 4. Tipo examen
CREATE PROCEDURE listar_emple
AS
    CURSOR c1 IS
        SELECT apellido, salario, dept_no FROM emple ORDER BY dept_no, apellido;
    vr_emp      c1%ROWTYPE;
    dept_ant    EMPLE.DEPT_NO%TYPE DEFAULT 0;
    cont_emple  NUMBER(4) DEFAULT 0;
    sum_sal     NUMBER(9,2) DEFAULT 0;
    total_emple NUMBER(4) DEFAULT 0;
    total_sal   NUMBER(10,2) DEFAULT 0;
BEGIN

    OPEN c1;
    LOOP
        FETCH c1 INTO vr_emp;
        IF c1%ROWCOUNT = 1 THEN
            -- primer fetch, iniciamos dept_ant
            dept_ant := vr_emp.dept_no;
        END IF;

        IF dept_ant != vr_emp.dept_no OR c1%NOTFOUND THEN  
            -- nuevo departamento o finalizacion
            DBMS_OUTPUT.PUT_LINE('*** DEPTO: ' || dept_ant || 
                'NUM. EMPLEADOS: ' || cont_emple || 'SUM. SALARIOS: ' || sum_sal);
            -- actualizacion de acumuladores parciales
            total_emple := total_emple + cont_emple;
            total_sal := total_sal + sum_sal;
            -- inicializacion contadores
            cont_emple := 0; sum_sal := 0;
            dept_ant := vr_emp.dept_no;
        END IF;

        EXIT WHEN c1%NOTFOUND; -- condicion de salida

        DBMS_OUTPUT.PUT_LINE(vr_emp.apellido || '*' || TO_CHAR(vr_emp.salario, '999,999'));
        cont_emple := cont_emple + 1; 
        sum_sal := sum_sal + 1;
    END LOOP;
    CLOSE c1;

    DBMS_OUTPUT.PUT_LINE(' *** Numero Total de Empleados: ' || total_emple ||
        ' Total Salarios: ' || total_sal);

END listar_emple;
