-- EXCEPCIONES

-- 5. Dos excepciones: una definida por usuario y la otra predefinida
CREATE PROCEDURE subir_salario (num_emple NUMBER, incremento REAL)
IS
    salario_actual  REAL;
    salario_nulo    EXCEPTION;
BEGIN
    SELECT salario INTO salario_actual FROM emple WHERE emp_no = num_emple;
    IF salario_actual IS NULL THEN
        RAISE salario_nulo;
    END IF;
    UPDATE emple SET salario = salario_actual + incremento;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE(num_emple || '*Err. No encontrado');
    WHEN salario_nulo THEN
        DBMS_OUTPUT.PUT_LINE(num_emple || '*Err. Salario nulo');
END subir_salario;

-- 7. Similar al anterior con RAISE_APPLICATION_ERROR
CREATE PROCEDURE subir_salario2
    (num_emple NUMBER, incremento NUMBER)
IS
    salario_actual NUMBER;
BEGIN
    SELECT salario INTO salario_actual FROM emple WHERE emp_no = num_emple;
    IF salario_actual IS NULL THEN
        RAISE_APPLICATION_ERROR(-20010, 'Salario nulo');
    ELSE 
        UPDATE emple SET salario = salario_actual + incremento WHERE emp_no = num_emple;
    END IF;
END subir_salario2;
