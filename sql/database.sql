CREATE USER sample WITH PASSWORD 'Welcome123$';
CREATE DATABASE sample WITH OWNER revfa ENCODING 'UTF8' TEMPLATE template0;
GRANT ALL PRIVILEGES ON DATABASE sample TO sample;