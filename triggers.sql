--TRIGGERS (Se ejecutan al modificar la BDD)
CREATE OR REPLACE TRIGGER estado_operacion_before
--ANTES
BEFORE INSERT OR UPDATE OR DELETE on producto
begin
    
    if INSERTING then
        dbms_output.put_line('Insertando productos');
    elsif UPDATING THEN
        dbms_output.put_line('Actualizando productos');
    elsif DELETING THEN
        dbms_output.put_line('Borrando productos');
    END IF;
end;

/

CREATE OR REPLACE TRIGGER estado_operacion_after
--DESPUES
AFTER INSERT OR UPDATE OR DELETE on producto
begin
    
    if INSERTING then
        dbms_output.put_line('Producto/s insertado');
    elsif UPDATING THEN
        dbms_output.put_line('Producto/s actualizado');
    elsif DELETING THEN
        dbms_output.put_line('Producto/s eliminado');
    END IF;
end;

/

CREATE OR REPLACE TRIGGER validacion_producto
BEFORE INSERT OR UPDATE on producto FOR EACH ROW --(Para cada fila de entidad)

DECLARE
    v_num_fabricantes NUMBER(4);
BEGIN
    --(if :new) -> 'Si el nuevo registro de + columna'
    --(if :old) -> 'Si el anterior registro de + columna'
    if :new.precio < 0 then
        RAISE_APPLICATION_ERROR(-20001, 'El precio no puede ser negativo');
    end if;
    
    select count(*) into v_num_fabricantes
    from fabricante 
    where codigo = :new.codigo_fabricante;
    
    if v_num_fabricantes = 0 then
        RAISE_APPLICATION_ERROR(-20002, 'No existe fabricante');
    end if;
END;

--probar
INSERT INTO producto (codigo, nombre, precio, codigo_fabricante)
VALUES(12, 'Nuevo producto', 100, 1);

/ 

CREATE OR REPLACE TRIGGER cambio_fabricante
before update of codigo_fabricante on producto FOR EACH ROW

BEGIN
    --Cuando se hace foreach row no se debe tocar la tabla que se esta iterando
    --UPDATE producto set precio = precio + 10 where codigo = old.codigo
    if :new.codigo_fabricante <> :old.codigo_fabricante then
        :new.precio := :old.precio + 10; --modificar datos por comprobacion(arriesgado)
    end if;
END;

--probar
UPDATE producto set codigo_fabricante = 5 where codigo = 1;
DELETE FROM producto where codigo = 12;
select * from producto















