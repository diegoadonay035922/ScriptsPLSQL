--Exepciones
DECLARE
    v_codigo producto.codigo%TYPE := &codigo;
    v_producto producto%rowtype; --(producto contiene una fila entera)
BEGIN
    select * into v_producto
    from producto where codigo = v_codigo;
    
    DBMS_OUTPUT.put_line('Informacion del producto con codigo: ' || v_codigo);
    DBMS_OUTPUT.put_line('Nombre: ' || v_producto.nombre);
    DBMS_OUTPUT.put_line('Precio: ' || v_producto.precio);
    DBMS_OUTPUT.put_line('Codigo de fabricante: ' || v_producto.codigo_fabricante);
EXCEPTION
    --especifica
    when no_data_found then
        DBMS_OUTPUT.PUT_LINE('No existe el producto ' || v_codigo);
    --Otras excepciones
    when others then
        DBMS_OUTPUT.PUT_LINE('Error');       
END;