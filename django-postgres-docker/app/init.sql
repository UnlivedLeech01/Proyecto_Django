-- 1. Crear la base de datos con collation para soporte Unicode completo
CREATE DATABASE IF NOT EXISTS djangodb 
CHARACTER SET utf8mb4 
COLLATE utf8mb4_unicode_ci;

-- 2. Crear usuario específico para Django con todos los privilegios
CREATE USER 'django_user'@'%' IDENTIFIED BY 'DjangoPass123!';

-- 3. Otorgar privilegios completos sobre la base de datos
GRANT ALL PRIVILEGES ON djangodb.* TO 'django_user'@'%';

-- 4. Aplicar cambios de privilegios
FLUSH PRIVILEGES;

-- 5. Usar la base de datos recién creada
USE djangodb;

-- 6. Crear tabla de usuarios (esto normalmente lo hace Django con migraciones)
-- Este es solo un ejemplo de referencia, NO EJECUTAR manualmente
/*
CREATE TABLE IF NOT EXISTS auth_user (
    id INT AUTO_INCREMENT PRIMARY KEY,
    password VARCHAR(128) NOT NULL,
    last_login DATETIME(6) NULL,
    is_superuser TINYINT(1) NOT NULL,
    username VARCHAR(150) NOT NULL UNIQUE,
    first_name VARCHAR(150) NOT NULL,
    last_name VARCHAR(150) NOT NULL,
    email VARCHAR(254) NOT NULL,
    is_staff TINYINT(1) NOT NULL,
    is_active TINYINT(1) NOT NULL,
    date_joined DATETIME(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
*/

-- 7. Crear tabla de sesiones (referencia)
/*
CREATE TABLE IF NOT EXISTS django_session (
    session_key VARCHAR(40) NOT NULL PRIMARY KEY,
    session_data TEXT NOT NULL,
    expire_date DATETIME(6) NOT NULL,
    INDEX django_session_expire_date (expire_date)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
*/

-- 8. Verificación final
SHOW DATABASES LIKE 'djangodb';
SELECT user, host FROM mysql.user WHERE user = 'django_user';
SHOW GRANTS FOR 'django_user'@'%';