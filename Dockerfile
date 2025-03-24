# Use the official MySQL image from the Docker Hub
FROM mysql:latest

# Set environment variables for MySQL
ENV MYSQL_ROOT_PASSWORD=rootpassword
ENV MYSQL_DATABASE=mydatabase
ENV MYSQL_USER=myuser
ENV MYSQL_PASSWORD=mypassword

# Expose the default MySQL port
EXPOSE 3306

# Install Liquibase
RUN apt-get update && apt-get install -y wget
RUN wget https://github.com/liquibase/liquibase/releases/download/v4.4.3/liquibase-4.4.3.tar.gz
RUN tar -xvzf liquibase-4.4.3.tar.gz
RUN mv liquibase /usr/local/bin/liquibase

# Copy the changelog file into the container
COPY changelog.xml /docker-entrypoint-initdb.d/
