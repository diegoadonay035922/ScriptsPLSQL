--if elsif else
DECLARE
    v_n1 Number(2):= 10;
    v_n2 Number(2):= 4;
    v_n3 Number(2):= 3;
BEGIN
    if v_n1 >= v_n2 and v_n1 >= v_n3 then
        dbms_output.put_line(v_n1 || ' Es el mayor');
    elsif v_n2 >= v_n3 then
        dbms_output.put_line(v_n2 || ' Es el mayor');
    else
        dbms_output.put_line(v_n3 || ' Es el mayor');
    end if;
END;
