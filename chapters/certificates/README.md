#!/bin/bash

openssl req -nodes -x509 -days 3650 -newkey rsa:4096 -subj "/C=US/ST=Mazovia/L=Warsaw/O=Seems Cloud/OU=Root" \
  -keyout ca.key.pem -out .ca.crt.pem

openssl req -nodes -new -newkey rsa:2048 -subj "/C=US/ST=Mazovia/L=Warsaw/O=Seems Cloud/OU=Root/CN=client" \
  -keyout client.key.pem -out client.csr.pem

 openssl x509 -req -days 365 \
  -CA ca.crt.pem -CAkey ca.key.pem -CAcreateserial \
  -in client.csr.pem -out client.crt.pem
