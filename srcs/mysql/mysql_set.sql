FLUSH PRIVILEGES;
CREATE DATABASE IF NOT EXISTS wordpress;
GRANT ALL ON wordpress.* TO 'root'@'%' IDENTIFIED BY 'a1234';
GRANT ALL ON wordpress.* TO 'root'@'localhost' IDENTIFIED BY 'a1234';
GRANT ALL ON wordpress.* TO 'root'@'127.0.0.1' IDENTIFIED BY 'a1234';
GRANT ALL ON wordpress.* TO 'root'@'wp-mysql' IDENTIFIED BY 'a1234';
FLUSH PRIVILEGES;
