--/* TABLE TRIGGERS */

-- 1

CREATE TRIGGER audit_subida_salario 
    AFTER UPDATE OF salario 
    ON emple
    FOR EACH ROW
BEGIN   
    INSERT INTO auditaremple 
        VALUES ('Subida salario empleado:' || :old.emp_no);
    END;
END;

CREATE TRIGGER audit_borrado_emple
    BEFORE DELETE
    ON emple
    FOR EACH ROW
BEGIN   
    INSERT INTO auditaremple 
        VALUES ('Borrado empleado: ' || :old.emp_no || '*' || old.apellido || '*' || old.dept_no); 
    END;
END;


/* Substitution TRIGGERS */

-- 1. Substitution trigger (NO)


/* SYSTEM TRIGGERS */

-- Trigger to control conections to the database (system)
--      (usuario, momento, LOGON) into control_conexiones
--      (usuario, momento, DDL op.) into control_eventos

CREATE TABLE control_conexiones (
    usuario     VARCHAR2(20),
    momento     TIMESTAMP,
    evento      VARCHAR2(20)
);

CREATE TABLE control_eventos (
    usuario     VARCHAR2(20),
    momento     TIMESTAMP,
    evento      VARCHAR2(40)
);

CREATE TRIGGER ctrl_conexiones
AFTER LOGON
ON DATABASE
BEGIN
    INSERT INTO control_conexiones (usuario, momento, evento)
    VALUES (ORA_LOGIN_USER, SYSTIMESTAMP, ORA_SYSEVENT);
END;

CREATE TRIGGER ctrl_eventos
AFTER DDL
ON DATABASE
BEGIN
    INSERT INTO control_eventos (usuario, momento, evento)
    VALUES (ORA_LOGIN_USER, SYSTIMESTAMP, ORA_SYSEVENT || ORA_DICT_OBJ_NAME);
END;

/********************
* A. Complementarias
*********************/

-- 1. Auditar operaciones de insercion o borrado en la tabla EMPLE segun las
--    a) se crea la tabla auditaremple col1 VARCHAR(200)
--    b) fila con fecha, hora, num. empleado, apellido y operacion (INSERT/DELETE)

-- 2. Escribe un trigger que permita auditar las modificaciones en EMPLE, insertando
--    los sig. datos en la tabla auditaremple: fecha, hora, num. empleado, apellido
--    y (valor anterior, valor nuevo) de cada columna modifcada.

