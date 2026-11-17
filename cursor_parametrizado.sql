--Cursor parametrizado
DECLARE
    cursor c_productos_fabricante(p_cod_fab NUMBER) is 
    select * from producto where codigo_fabricante = p_cod_fab
    order by precio;
    
    v_producto producto%rowtype;
    v_codigo_fabricante fabricante.codigo%type := &codigo;
BEGIN
    --abrir el cursor con el parametro
    open c_productos_fabricante(v_codigo_fabricante);
    
    loop
        fetch c_productos_fabricante into v_producto;
        exit when c_productos_fabricante%notfound;
        
        DBMS_OUTPUT.PUT_LINE('Informacion del producto con codigo ' || v_producto.codigo);
        DBMS_OUTPUT.PUT_LINE('Nombre ' || v_producto.nombre);
        DBMS_OUTPUT.PUT_LINE('Precio ' || v_producto.precio);
        DBMS_OUTPUT.PUT_LINE('');
    end loop;
    
    close c_productos_fabricante;
    
END;