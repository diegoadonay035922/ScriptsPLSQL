--Cursores (Almacenar y recorrer un conjunto de datos)
DECLARE
    --nombre y declaracion de cursor + consulta
    cursor c_productos is
    select * from producto order by precio;
    
    --INNER JOIN ANSI 89
    cursor c_productos_fabricante is
    select 
        p.codigo,
        p.nombre,
        p.precio,
        f.nombre as nombre_fabricante
    from producto p, fabricante f
    where p.codigo_fabricante = f.codigo
    order by precio;
    
    v_producto producto%rowtype;
BEGIN
    --Recorrer cursor (Abrir, recorrer, cerrar)
    DBMS_OUTPUT.PUT_LINE('Cursor de productos');
    open c_productos;
    
    loop
        --Obtener y guardar iteraciones en la variable
        fetch c_productos into v_producto;
        --cuando no haya mas datos, salir
        exit when c_productos%notfound;
        
        DBMS_OUTPUT.PUT_LINE('Informacion producto con codigo ' || v_producto.codigo);
        DBMS_OUTPUT.PUT_LINE('Nombre: ' || v_producto.nombre);
        DBMS_OUTPUT.PUT_LINE('Precio: ' || v_producto.precio);
        DBMS_OUTPUT.PUT_LINE('Codigo de fabricante: ' || v_producto.codigo_fabricante);
        DBMS_OUTPUT.PUT_LINE('');
    end loop;
    
    close c_productos;
    
    DBMS_OUTPUT.PUT_LINE('Cursor c_productos_fabricante');
    
    for registry in c_productos_fabricante loop
        DBMS_OUTPUT.PUT_LINE('Informacion producto con codigo ' || registry.codigo);
        DBMS_OUTPUT.PUT_LINE('Nombre: ' || registry.nombre);
        DBMS_OUTPUT.PUT_LINE('Precio: ' || registry.precio);
        DBMS_OUTPUT.PUT_LINE('Nombre de fabricante: ' || registry.nombre_fabricante);
        DBMS_OUTPUT.PUT_LINE('');
    end loop;
END;

