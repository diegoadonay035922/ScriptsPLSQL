--Bucles

--While
Declare
    v_i Number(2) := 1;
BEGIN
    DBMS_OUTPUT.PUT_LINE('While');
    While(v_i < 10)
    loop
        DBMS_OUTPUT.PUT_LINE(v_i);
        v_i := v_i + 1;
    end loop;
END;

/
--For
BEGIN
    DBMS_OUTPUT.PUT_LINE('For');
    For v_i in 1..10
    --For v_i in reverse 1..10
    loop
        DBMS_OUTPUT.PUT_LINE(v_i);
    end loop;
END;

/

--loop
DECLARE
    v_i Number(2) := 1;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Loop');
    loop
        DBMS_OUTPUT.PUT_LINE(v_i);
        exit when v_i = 10; --La condicion de salida se puede poner en cualquier lado
        v_i := v_i + 1;
    end loop;
END;