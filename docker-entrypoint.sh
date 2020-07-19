#!/bin/sh
sed -i 's#127.0.0.1#my-cassandra#g' /app/config/cequel.yml
until nc -vz my-cassandra 9042 2>/dev/null; do
	  echo "Cassandra is not ready, sleeping."
	    sleep 1
    done
rails cequel:keyspace:create
rails cequel:migrate
rails s -b 0.0.0.0
