DECLARE
    v_total Number(8);
    v_suma_productos Number(8, 2);
BEGIN
    --almacenar resultado de select en variable
    select count(*) into v_total
    from producto;
    select sum(precio) into v_suma_productos
    from producto;
    
    --En orden
    --select count(*), sum(precio) into v_total, v_suma_productos;
    DBMS_OUTPUT.PUT_LINE('Total de productos: ' || v_total);
    DBMS_OUTPUT.PUT_LINE('Total de productos: ' || v_suma_productos);
END;