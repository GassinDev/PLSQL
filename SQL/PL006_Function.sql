/*
    File: PL006 - Funciones
    Date: 2022-03
*/


-- Funcion
CREATE FUNCTION fn_alta_proveedor (     po_n_IDProveedor    OUT tbProveedores.nIDProveedor%TYPE,
                                        pi_v_DesProveedor   IN  tbProveedores.vDesProveedor%TYPE,
                                        pio_d_FechaAlta     IN OUT tbProveedores.dFechaAlta%TYPE,
                                        po_v_error          VARCHAR2)   
RETURN BOOLEAN IS
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
    RETURN TRUE;

EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        po_v_error := 'Ya existe un proveedor con ese ID';
        RETURN FALSE;

    WHEN ex_NomProvExiste THEN
        po_v_error := 'Ya existe un proveedor con ese nombre';
        RETURN FALSE;

END fn_alta_proveedor;

-- invocamos
DECLARE
    vn_IDProveedor  NUMBER;
    vd_Fecha        DATE := SYSDATE;
BEGIN

    fn_alta_proveedor(vn_IDProveedor, 'Frasquita', vd_Fecha);
    DBMS_OUTPUT.PUT_LINE('Nuevo registro: ' || vn_IDProveedor);
END;

-- comprueba
SELECT * FROM tbProveedores;
