#!/bin/bash

# Start the Docker Compose setup
docker-compose up -d

# Wait for the services to be up and running
sleep 60

# Check if the tables are created in the database
docker exec -it mysql_container mysql -umyuser -pmypassword -e "SHOW TABLES IN mydatabase;"

# Stop the Docker Compose setup
docker-compose down
