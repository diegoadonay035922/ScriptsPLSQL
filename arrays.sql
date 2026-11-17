--Arrays
DECLARE
    type alumnosarray is varray(3) of VARCHAR2(20);
    v_alumnos alumnosarray := alumnosarray('Fernando', 'Manuel', 'Diego');
    type notasarray is varray(3) of Number(2);
    v_notas notasarray := notasarray(7,8,9);
BEGIN
--devuelve la longitud del array
    --arreglo contable pararelo
    for v_i in 1..v_alumnos.count
    loop
        DBMS_OUTPUT.PUT_LINE('Alumno:¨' || v_alumnos(v_i) || ', nota: ' || v_notas(v_i));
    end loop;
END;