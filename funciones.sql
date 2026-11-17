--Funcion (Retorna un valor)
CREATE OR REPLACE FUNCTION obtenerProducto(p_codigo producto.codigo%type) --parametro
RETURN producto%rowtype
AS
    --variables
    v_producto producto%rowtype;
BEGIN
    select * into v_producto
    from producto where codigo = p_codigo;
    
    return v_producto;
    
EXCEPTION
    --especifica
    when no_data_found then
        DBMS_OUTPUT.PUT_LINE('No existe el producto ' || p_codigo);
        return null;
            
    when others then
        DBMS_OUTPUT.PUT_LINE('Error');  
        return null;        
END;

/

DECLARE
    v_codigo producto.codigo%type := &codigo;
    v_producto producto%rowtype;
BEGIN
    v_producto := obtenerProducto(v_codigo);
    
    if v_producto.codigo is not null then
        DBMS_OUTPUT.put_line('Informacion del producto con codigo: ' || v_codigo);
        DBMS_OUTPUT.put_line('Nombre: ' || v_producto.nombre);
        DBMS_OUTPUT.put_line('Precio: ' || v_producto.precio);
        DBMS_OUTPUT.put_line('Codigo de fabricante: ' || v_producto.codigo_fabricante);
    end if;
END;
