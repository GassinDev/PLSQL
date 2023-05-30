/*
    File: PL005 - Procedimientos y funciones
    Date: 2022-03
*/

CREATE table tbProveedores(
    nIDProveedor    NUMBER(3) PRIMARY KEY,
    vDesProveedor   VARCHAR2(50),
    dFechaAlta      DATE
);

INSERT INTO tbProveedores VALUES (1, 'Martillos', TO_DATE('05/05/2022', 'DD/MM/YYYY'));

-- procedimiento almacenado
CREATE PROCEDURE pr_alta_proveedor (    po_n_IDProveedor    OUT tbProveedores.nIDProveedor%TYPE,
                                        pi_v_DesProveedor   IN  tbProveedores.vDesProveedor%TYPE,
                                        pio_d_FechaAlta     IN OUT tbProveedores.dFechaAlta%TYPE)   
IS
    vv_DesProveedor     tbProveedores.vDesProveedor%TYPE;
    vn_NomProvExiste    NUMBER(1);
    ex_NomProvExiste    EXCEPTION;
BEGIN

    BEGIN   
        SELECT MAX(nIDProveedor) + 1 INTO po_n_IDProveedor FROM tbProveedores;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN 
            po_n_IDProveedor := 1;
    END;

    vv_DesProveedor := NVL(pi_v_DesProveedor, 'No definido');
    pio_d_FechaAlta := NVL(pio_d_FechaAlta, SYSDATE);

    DBMS_OUTPUT.PUT_LINE('Debug: ' || vv_DesProveedor);
    
    BEGIN
        SELECT 1 INTO vn_NomProvExiste FROM tbProveedores
        WHERE vDesProveedor = vv_DesProveedor;
        
        RAISE ex_NomProvExiste;

    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            NULL;
    END;
    
    INSERT INTO tbProveedores VALUES (po_n_IDProveedor, vv_DesProveedor, pio_d_FechaAlta);

EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        DBMS_OUTPUT.PUT_LINE('Ya existe un proveedor con ese ID');

    WHEN ex_NomProvExiste THEN
        DBMS_OUTPUT.PUT_LINE('Ya existe un proveedor con ese nombre');
        
END pr_alta_proveedor;

-- invocamos
DECLARE
    vn_IDProveedor  NUMBER;
    vd_Fecha        DATE := SYSDATE;
BEGIN

    pr_alta_proveedor(vn_IDProveedor, 'Frasquita', vd_Fecha);
    DBMS_OUTPUT.PUT_LINE('Nuevo registro: ' || vn_IDProveedor);
END;

-- comprueba
SELECT * FROM tbProveedores;