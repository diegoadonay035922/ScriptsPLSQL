--Excepciones a nivel de aplicacion
DECLARE
    v_codigo producto.codigo%TYPE := &codigo;
    v_producto producto%rowtype; --(producto contiene una fila entera)
    
    --personalizada
    limite_precio exception;
    --Asociar codigo de excepcion de aplicacion con excepcion personalizada
    pragma EXCEPTION_INIT (limite_precio, -20999);
BEGIN
    select * into v_producto
    from producto where codigo = v_codigo;
    
    if v_producto.precio >= 100 then
        --lanzar excepcion
        --raise limite_precio;
        RAISE_APPLICATION_ERROR(-20999, 'El pruducto vale mas de 100$.'); -- (-20999 = codigo de la excepcion)
    end if;
    
    DBMS_OUTPUT.put_line('Informacion del producto con codigo: ' || v_codigo);
    DBMS_OUTPUT.put_line('Nombre: ' || v_producto.nombre);
    DBMS_OUTPUT.put_line('Precio: ' || v_producto.precio);
    DBMS_OUTPUT.put_line('Codigo de fabricante: ' || v_producto.codigo_fabricante);
EXCEPTION
    --especifica
    when no_data_found then
        DBMS_OUTPUT.PUT_LINE('No existe el producto ' || v_codigo);
        
    --controlar excepcion personalizada
    when limite_precio then
        --DBMS_OUTPUT.PUT_LINE('Se ha superado el limite');
        DBMS_OUTPUT.PUT_LINE(sqlcode); --capturar el codigo
        DBMS_OUTPUT.PUT_LINE(sqlerrm); --captura el mensaje del RAISE_APPLICATION
    
    --Otras excepciones
    --when others then
        --DBMS_OUTPUT.PUT_LINE('Error');       
END;