--Atributo Type
DECLARE
    --setea el tipo de dato a la variable
    v_codigo producto.codigo%type := &codigo;
    v_nombre producto.nombre%type;
BEGIN
    select nombre into v_nombre from producto where codigo = v_codigo;
    
    DBMS_OUTPUT.PUT_LINE('Nombre del producto con codigo ' || v_codigo || ': ' || v_nombre);
END;
