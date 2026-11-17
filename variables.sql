--VARIABLES EN PLSQL

DECLARE 
    --NUMBER, equivalente de Decimal en SQL Server
    v_num Number(2);
    v_cadena Varchar(20) := 'Diego Calles';
    --SYSDATE, FECHA DE HOY
    v_fecha DATE := SYSDATE;
BEGIN
    v_num := 15;
    DBMS_OUTPUT.PUT_LINE('El valor de v_num es ' || v_num);
    DBMS_OUTPUT.PUT_LINE('El valor de v_cadena es ' || v_cadena);
    DBMS_OUTPUT.PUT_LINE('El valor de v_fecha es ' || v_fecha);
END;
