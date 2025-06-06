CREATE DATABASE IF NOT EXISTS tienda;
USE tienda;

CREATE TABLE IF NOT EXISTS productos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    precio DECIMAL(10, 2),
    stock INT
);

INSERT INTO productos (nombre, precio, stock) VALUES 
('Teclado Mecánico', 59.99, 30),('Mouse Inalámbrico', 29.99, 50),('Monitor 24 pulgadas', 189.99, 15),
('Laptop Lenovo', 799.99, 10),('Impresora HP', 99.99, 20),('Auriculares Bluetooth', 49.99, 60),
('Webcam HD', 39.99, 25),('Disco Duro Externo 1TB', 79.99, 40),('Cable HDMI', 5.99, 150),
('Tablet Samsung', 199.99, 12),('Silla ergonómica', 149.99, 8),('Router Wi-Fi', 69.99, 18),
('Smartwatch Xiaomi', 99.99, 22),('Cámara de seguridad', 129.99, 16),('Teclado Gamer RGB', 89.99, 14),
('Mousepad XL', 12.99, 55),('Micrófono condensador', 109.99, 9),('Panel LED de luz', 44.99, 30),
('Controlador MIDI', 159.99, 6);

-- Procedimiento para insertar producto
DELIMITER $$

CREATE PROCEDURE insertar_producto (
    IN p_nombre VARCHAR(100),
    IN p_precio DECIMAL(10,2),
    IN p_stock INT
)
BEGIN
    INSERT INTO productos (nombre, precio, stock)
    VALUES (p_nombre, p_precio, p_stock);
END$$

DELIMITER ;

-- Procedimiento para actualizar producto
DELIMITER $$

CREATE PROCEDURE actualizar_producto (
    IN p_id INT,
    IN p_nombre VARCHAR(100),
    IN p_precio DECIMAL(10,2),
    IN p_stock INT
)
BEGIN
    UPDATE productos
    SET nombre = p_nombre,
        precio = p_precio,
        stock = p_stock
    WHERE id = p_id;
END$$

DELIMITER ;

-- Procedimiento para consultar productos
DELIMITER $$

CREATE PROCEDURE consultar_productos (
    IN p_id INT
)
BEGIN
    IF p_id IS NULL OR p_id = 0 THEN
        SELECT * FROM productos;
    ELSE
        SELECT * FROM productos WHERE id = p_id;
    END IF;
END$$

DELIMITER ;

-- Procedimiento para eliminar producto
DELIMITER $$

CREATE PROCEDURE eliminar_producto (
    IN p_id INT
)
BEGIN
    DELETE FROM productos WHERE id = p_id;
END$$

DELIMITER ;

select * from productos

-- 7. Ejemplos de uso de los procedimientos
-- Insertar un nuevo producto
/*CALL insertar_producto('Teclado Mecánico', 59.99, 30);

-- Actualizar producto con ID 1
CALL actualizar_producto(1, 'Teclado RGB', 65.99, 40);

-- Consultar todos los productos
CALL consultar_productos(0);

-- Consultar producto específico (ID 1)
CALL consultar_productos(1);

-- Eliminar producto con ID 1
CALL eliminar_producto(1);*/