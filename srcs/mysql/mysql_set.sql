FLUSH PRIVILEGES;
CREATE DATABASE IF NOT EXISTS wordpress;
set password for 'root'@'localhost' = PASSWORD('a1234');
GRANT ALL ON *.* TO 'root'@'localhost' IDENTIFIED BY 'a1234';
GRANT ALL ON *.* TO 'root'@'%' IDENTIFIED BY 'a1234';
GRANT ALL ON *.* TO 'jinkim'@'%' IDENTIFIED BY 'a1234';
FLUSH PRIVILEGES;
