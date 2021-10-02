FROM ubuntu
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update
RUN apt-get install apache2 -y
RUN apt-get install apache2-utils -y
RUN apt-get install mysql-server -y
RUN apt-get install php libapache2-mod-php php-mysql -y
RUN mysql -h data.cq6owmwjzo29.ap-south-1.rds.amazonaws.com -u admin -p 12345678
RUN use ravi;
RUN CREATE TABLE user ( id int(11) auto_increment, name VARCHAR(255), email VARCHAR(255), contnum VARCHAR(10), primary key (id) );
ADD . /var/www/html
RUN apt-get clean
EXPOSE 80
CMD ["apache2ctl","-D","FOREGROUND"]
