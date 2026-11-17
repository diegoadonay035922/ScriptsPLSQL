--diferentes bloques anonimos ejecutandose uno tras otro

begin

    dbms_output.put_line('Hola mundo');

end;

--Barra para separar bloques anonimos
/

begin

    dbms_output.put_line('Hola mundo');

end;

/

begin

    dbms_output.put_line('Hola mundo');

end; 