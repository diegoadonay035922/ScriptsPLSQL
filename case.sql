--Case
DECLARE
    v_dia Number(2) := &dia;
BEGIN
    case v_dia 
        when 1 then
        DBMS_OUTPUT.put_line('Lunes');
        when 2 then
        DBMS_OUTPUT.put_line('Martes');
        when 3 then
        DBMS_OUTPUT.put_line('Miercoles');
        when 4 then
        DBMS_OUTPUT.put_line('Jueves');
        when 5 then
        DBMS_OUTPUT.put_line('Viernes');
        when 6 then
        DBMS_OUTPUT.put_line('Sabado');
        when 7 then
        DBMS_OUTPUT.put_line('Domingo');
    Else DBMS_OUTPUT.PUT_LINE('Introducir valor entre 1 y 7');
    end case;
END;