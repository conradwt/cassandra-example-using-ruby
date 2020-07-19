#!/bin/sh
sed -i 's#127.0.0.1#my-cassandra#g' /app/config/cequel.yml
rails cequel:keyspace:create
rails cequel:migrate
rails s -b 0.0.0.0
