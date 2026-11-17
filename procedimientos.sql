--Procedimientos almacenados
CREATE OR REPLACE PROCEDURE infoProducto(p_codigo producto.codigo%type) --parametro
AS
    --variables
    v_producto producto%rowtype;
BEGIN
    select * into v_producto
    from producto where codigo = p_codigo;
    
    DBMS_OUTPUT.put_line('Informacion del producto con codigo: ' || p_codigo);
    DBMS_OUTPUT.put_line('Nombre: ' || v_producto.nombre);
    DBMS_OUTPUT.put_line('Precio: ' || v_producto.precio);
    DBMS_OUTPUT.put_line('Codigo de fabricante: ' || v_producto.codigo_fabricante);

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
BEGIN
    infoProducto(v_codigo);
END;

--Llamar fuera de bloque anonimo
EXEC infoProducto(1)