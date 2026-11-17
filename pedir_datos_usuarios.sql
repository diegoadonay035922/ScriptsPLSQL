--Pedir datos al usuario para sustituir datos de una variable
DECLARE
    v_op1 Number(2) := &operando1;
    v_op2 Number(2) := &operando2;
    v_sum Number(3);
BEGIN
    v_sum := v_op1 + v_op2;
    dbms_output.put_line(v_op1 || ' + ' || v_op2 || ' = ' || v_sum);
END; 