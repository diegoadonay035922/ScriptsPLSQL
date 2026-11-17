--Procedimientos almacenados
CREATE OR REPLACE PROCEDURE infoProducto(p_codigo producto.codigo%type, p_producto OUT producto%rowtype) --parametro de salida
AS
BEGIN
    --Guardar resultado en parametro de salida
    select * into p_producto
    from producto where codigo = p_codigo;

EXCEPTION
    --especifica
    when no_data_found then
        DBMS_OUTPUT.PUT_LINE('No existe el producto ' || p_codigo);
            
    when others then
        DBMS_OUTPUT.PUT_LINE('Error');       
END;

--Llamar al SP
DECLARE
    v_codigo producto.codigo%type := &codigo;
    v_producto producto%rowtype;
BEGIN
    --pasar´parametro de salida
    infoProducto(v_codigo, v_producto);
    
    --utilizar el resultado obtenido en v_producto
    if v_producto.codigo is not null then
        DBMS_OUTPUT.put_line('Informacion del producto con codigo: ' || v_codigo);
        DBMS_OUTPUT.put_line('Nombre: ' || v_producto.nombre);
        DBMS_OUTPUT.put_line('Precio: ' || v_producto.precio);
        DBMS_OUTPUT.put_line('Codigo de fabricante: ' || v_producto.codigo_fabricante);
    end if;
    
END;

--Llamar fuera de bloque anonimo
EXEC infoProducto(1)