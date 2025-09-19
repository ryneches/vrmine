#!/bin/bash
set -e

# This script will wait for the postgres database to be ready and then start Tomcat.
# The host 'postgres' is the service name from the docker-compose.yml file.
# Port 5432 is the default PostgreSQL port.

host="postgres"
port="5432"

wait="2"

echo "Waiting for PostgreSQL database to be ready at $host:$port..."

# Use a loop to check for the database connection
while ! nc -z $host $port; do
  echo "Database not ready yet. Retrying in $wait seconds..."
  sleep $wait
done

echo "Database is ready. Starting Tomcat..."

# Now that the database is ready, execute the original Tomcat entrypoint command
exec catalina.sh run
