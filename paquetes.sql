--Paquetes

--Crear funcion y procedimiento en un paquete
CREATE OR REPLACE PACKAGE productos as
    PROCEDURE infoProducto(p_codigo producto.codigo%type);
    FUNCTION obtenerProducto(p_codigo producto.codigo%type) RETURN producto%rowtype;
end;

--Crear cuerpo del paquete(Logica de procedimiento y funcion)
CREATE OR REPLACE PACKAGE BODY productos as

    PROCEDURE infoProducto(p_codigo producto.codigo%type)
    AS
        v_producto producto%rowtype;
    BEGIN
        --Guardar resultado en parametro de salida
        select * into v_producto
        from producto where codigo = p_codigo;
    
        DBMS_OUTPUT.PUT_LINE('Informacion del producto con codigo ' || p_codigo);
        DBMS_OUTPUT.PUT_LINE('Nombre: ' || v_producto.nombre);
        DBMS_OUTPUT.PUT_LINE('Precio: ' || v_producto.precio);
        DBMS_OUTPUT.PUT_LINE('Codigo de fabricante: ' || v_producto.codigo_fabricante);
        
    EXCEPTION
        --especifica
        when no_data_found then
            DBMS_OUTPUT.PUT_LINE('No existe el producto ' || p_codigo);
                
        when others then
            DBMS_OUTPUT.PUT_LINE('Error');       
    END;
    
    FUNCTION obtenerProducto(p_codigo producto.codigo%type) --parametro
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
END;

--Probar
DECLARE
    v_codigo producto.codigo%type := &codigo;
    v_producto producto%rowtype;
BEGIN
    DBMS_OUTPUT.PUT_LINE('PROCEDIMIENTO');
    productos.infoproducto(v_codigo);
    
    DBMS_OUTPUT.PUT_LINE('FUNCION');
    v_producto := productos.obtenerproducto(v_codigo);
    
    if v_producto.codigo is not null then
        DBMS_OUTPUT.put_line('Informacion del producto con codigo: ' || v_codigo);
        DBMS_OUTPUT.put_line('Nombre: ' || v_producto.nombre);
        DBMS_OUTPUT.put_line('Precio: ' || v_producto.precio);
        DBMS_OUTPUT.put_line('Codigo de fabricante: ' || v_producto.codigo_fabricante);
    end if;
END;
