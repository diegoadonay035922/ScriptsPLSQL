--Operadores aritmeticos
DECLARE
    v_n1 Number(2) := 10;
    v_n2 Number(2) := 2;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Suma ' || (v_n1 + v_n2));
    DBMS_OUTPUT.PUT_LINE('Resta ' || (v_n1 - v_n2));
    DBMS_OUTPUT.PUT_LINE('Multiplicacion ' || (v_n1 * v_n2));
    DBMS_OUTPUT.PUT_LINE('Division ' || (v_n1 / v_n2));
    DBMS_OUTPUT.PUT_LINE('Potencia ' || (v_n1 ** v_n2));
END;