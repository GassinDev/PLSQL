/*
    Date: 2022-05
    10. Introduccion al PL/SQL (McGraw010)
    2. Features: expections, modular, DML support
    5. Examples of subprograms
*/

-- 1. Borrar el dept 20 pero antes meter empleados en dept 99 (Provisional)
-- 1. Delete dept 20 but first put those employees in dept 99 (temporary)
DECLARE
    v_num_empleados NUMBER;
BEGIN
    INSERT INTO depart VALUES (99, 'Provisional', NULL);
    UPDATE emple SET dept_no = 99 WHERE dept_no = 20;
    v_num_empleados := SQL.%ROWCOUNT;
    DELETE FROM depart WHERE dept_no = 20;
    DBMS_OUTPUT.PUT_LINE(v_num_empleados || ' Empleados en Provisional');

EXCEPTION
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-2000, 'Error en aplicacion');
END;

-- 3. Apellido y oficio del empleado 7900 (EXCEPTIONS)
-- 3. Surname and job of the employee 7900
DECLARE
    v_ape   VARCHAR2(20);
    v_ofi   VARCHAR2(20);
BEGIN
    SELECT apellido, oficio INTO v_ape, v_ofi FROM emple WHERE emp_no = 7900;
    DBMS_OUTPUT.PUT_LINE(v_ape || ' * ' || v_ofi);

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-2000, 'ERROR, no hay datos');
    WHEN TOO_MANY_ROWS THEN
        RAISE_APPLICATION_ERROR(-2000, 'ERROR demasiados datos');
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-2000, 'Error en la aplicacion');
END;

-- 4. cuando se elimine algun empleado --> visualizar numero y apellido borrado
-- 4. when a employee is deleted --> display his number and surname (TRIGGER)
CREATE TRIGGER audit_borrado BEFORE DELETE ON emple
    FOR EACH ROW
BEGIN
    DBMS_OUTPUT.PUT_LINE('Borrado' || '*' || :old.emp_no || '*' || :old.apellido);
END;

-- 5. Variables de sustitucion en bloques anonimos SOLO!
-- 5. Substitution variables (data input through keyboard)
DECLARE
    v_nom CLIENTES.NOMBRE%TYPE;
BEGIN
    SELECT nombre INTO v_nom FROM clientes WHERE cliente_no = &vn_cli;
    DBMS_OUTPUT.PUT_LINE(v_nom);
END;

-- 6. Procedimiento para consultar datos de un departamento
-- 6. Procedure to request information about a department
CREATE PROCEDURE ver_depart (num_depart NUMBER)
AS  
    v_dnombre    VARCHAR2(20);
    v_localidad  VARCHAR2(20);
BEGIN
    SELECT dnombre, loc INTO v_dnombre, v_localidad FROM depart 
        WHERE dept_no = num_depart;
    DBMS_OUTPUT.PUT_LINE ('Num dpt:' || num_depart || ' * Nombre dpt:' || v_dnombre || ' * Localidad:' || v_localidad);

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Departamento no encontrado');
END ver_depart;

-- Execution
CREATE TABLE depart (
    dept_no INT, dnombre VARCH;AR2(9), loc VARCHAR2(9)
);
EXECUTE ver_depart(10);

-- 7.a) Show the cost a product 
CREATE PROCEDURE ver_precio (numprod NUMBER)
AS
    v_precio NUMBER(5);
BEGIN
    SELECT precio_actual INTO v_precio FROM productos WHERE prod_no = numprod;
    DBMS_OUTPUT.PUT_LINE('Precio = ' || v_precio);
END ver_precio;

-- 7.b) F. que modifique el precio de un producto siempre qno supere el 20%
-- 7.b) Modify the price provided the increment is not more than 20%
CREATE PROCEDURE modificar_precio_producto (numprod NUMBER, nuevoprecio NUMBER)
AS
    v_precioant NUMBER(5);
BEGIN
    SELECT precio_actual INTO v_precioant FROM productos WHERE prod_no = numprod;
    IF (v_precioant * 0.2) > (nuevoprecio - v_precioant) THEN
        UPDATE productos SET precio_actual = nuevoprecio WHERE prod_no = numprod;
    ELSE
        DBMS_OUTPUT.PUT_LINE('Error, supera el 20%');
    END IF;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No encontrado: ' || numprod)
END modificar_precio_producto;

-- 7.c) default values for a input parameter (FUNCTION)
CREATE FUNCTION con_iva (cantidad NUMBER, tipo NUMBER default 16)
    RETURN NUMBER
AS
    v_resultado NUMBER(10,2) DEFAULT 0;
BEGIN
    v_resultado := cantidad * (1 + tipo/100);
    RETURN(v_resultado)
END;

-- 7.d) Execution
EXECUTE ver_precio(50);
EXECUTE modificar_precio_producto(50, 120);
SELECT prod_no, precio_actual, con_iva(precio_actual) FROM productos;

-- NOTE: Stored subprograms:
--      Store and execute (/) or only store (.)
--      BEGIN ver_depart(30); END; ---> EXECUTE ver_depart(30)
