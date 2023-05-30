/*
    File: PL001 - Variables y Funciones (lite)
    Date: 2022-03
*/

DECLARE 
    vv_product      VARCHAR2(20 CHAR); 
    vv_string       VARCHAR2(12 CHAR); 
    vn_units        NUMBER(2); 
    cn_price        CONSTANT NUMBER(3,2) :=2.55; 
    vd_date         DATE; 
    vb_sale         BOOLEAN; 
/*  v_nombre        tabla.column%TYPE; */
    
BEGIN 
    vv_product  := 'Screwdriver'; 
    vn_units    := 50; 
    vb_sale     := TRUE; 
    vv_string   := '10/05/2022'; 
    vd_date     := TO_DATE(vv_string, 'DD/MM/YYYY');
/*  SELECT tabla.column INTO v_nombre FROM tabla WHERE condicion; */
    DBMS_OUTPUT.PUT_LINE('Producto: ' || vv_product || CASE WHEN vb_sale THEN ' en oferta!!!' END); 
    DBMS_OUTPUT.PUT_LINE('Precio: ' || cn_price); 
    DBMS_OUTPUT.PUT_LINE('Fecha: ' || TO_CHAR(vd_date, 'DD/MM/YYYY')); 
END;

DECLARE
    vv_mi_cadena    VARCHAR2(50) := 'esta es mi cadena';
    vn_mi_numero    NUMBER(2);
    vd_mi_fecha     DATE;
    vn_mi_numero1   NUMBER(3,2) := 7.77;
    vn_mi_numero2   NUMBER(3,2) := 7.77;
BEGIN

    /* cadenas */
    vv_mi_cadena := NVL(vv_mi_cadena, 'Cadena vacia');
    DBMS_OUTPUT.PUT_LINE('Valor: ' || vv_mi_cadena);
    DBMS_OUTPUT.PUT_LINE('Longitud: ' || LENGTH(vv_mi_cadena));
    
    /* subcadenas: INSTR, LPAD, TRIM*/
    vn_mi_numero := INSTR(vv_mi_cadena, 'a', 1, 3);
    DBMS_OUTPUT.PUT_LINE('Pos: ' || vn_mi_numero);
    
    vv_mi_cadena := REPLACE(vv_mi_cadena, 'a', '$');
    DBMS_OUTPUT.PUT_LINE('Subcadena: ' || vv_mi_cadena);
    
    vv_mi_cadena := SUBSTR(vv_mi_cadena, 6, 2);
    DBMS_OUTPUT.PUT_LINE('Subcadena: ' || vv_mi_cadena);
    
    vv_mi_cadena := LPAD(vv_mi_cadena, 50, '$');
    DBMS_OUTPUT.PUT_LINE('Subcadena: ' || vv_mi_cadena);   
    
    vv_mi_cadena := TRIM('$' FROM vv_mi_cadena);
    DBMS_OUTPUT.PUT_LINE('Subcadena: ' || vv_mi_cadena);   
           
    /* fechas */
    vv_mi_cadena    := '10/05/2022';
    vd_mi_fecha     := TO_DATE(vv_mi_cadena, 'DD/MM/YYYY');
    DBMS_OUTPUT.PUT_LINE('Fecha: ' || TO_CHAR(vd_mi_fecha, 'DD-MM-YYYY'));   

    vd_mi_fecha := TRUNC(vd_mi_fecha, 'MM');
    --vd_mi_fecha := ADDMONTHS(vd_mi_fecha, -2);
    DBMS_OUTPUT.PUT_LINE('Fecha: ' || TO_CHAR(vd_mi_fecha, 'DD-MM-YYYY'));   

    /* numericas */
    vn_mi_numero1 := ROUND(vn_mi_numero1, 1);
    vn_mi_numero2 := TRUNC(vn_mi_numero2, 1);
    DBMS_OUTPUT.PUT_LINE('Num1: ' || vn_mi_numero1 || ', Num2: ' || vn_mi_numero2);
    
END;