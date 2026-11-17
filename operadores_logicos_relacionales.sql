--Operadores Logicos
DECLARE
    v_n1 Number(2):=3;
    v_n2 Number(2):=2;
    v_n3 Number(2):=1;
BEGIN
    if v_n1 > v_n2 then
        dbms_output.put_line(v_n1 || ' Es mayor que ' || v_n2);
    elsif v_n1 < v_n2 then
        dbms_output.put_line(v_n1 || ' Es menor que ' || v_n2);
    end if;
    if v_n1 >= v_n2 then
        dbms_output.put_line(v_n1 || ' Es mayor o igual que ' || v_n2);
    elsif v_n1 <= v_n2 then
        dbms_output.put_line(v_n1 || ' Es menor o igual que ' || v_n2);
    end if;
    
    --igualdad
    if v_n1 = v_n2 then
        dbms_output.put_line(v_n1 || ' Es igual que ' || v_n2);
    end if;
    --distinto
    if v_n1 <> v_n2 then
        dbms_output.put_line(v_n1 || ' Es distinto que ' || v_n2);
    end if;
    
    --Operadores relacionales
    
    if v_n1 > v_n2 and v_n1 > v_n3 then
        dbms_output.put_line(v_n1 || ' Es mayor que ' || v_n2 || ' y ' || v_n3);
    end if;
    
    if v_n1 = v_n2 or v_n1 > v_n3 then
        dbms_output.put_line(v_n1 || ' Es igual que ' || v_n2 || ' o ' ||
        ' que ' || v_n2 || ' es mayor que ' || v_n3);
    end if;
    
END;