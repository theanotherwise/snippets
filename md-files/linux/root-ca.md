### CA Certificate

```bash
openssl req -nodes -x509 -days 3650 -newkey rsa:2048 -subj "/C=US/ST=Mazovia/L=Warsaw/O=Seems Cloud/OU=Root/CN=Root CA" \
  -keyout ca.key.pem -out ca.crt.pem
```

```bash
openssl x509 -text -noout -in ca.crt.pem 

openssl x509 -noout -modulus -in ca.crt.pem | openssl md5
openssl rsa -noout -modulus -in ca.key.pem | openssl md5
```

### Leaf Certificate

```bash
openssl req -nodes -new -newkey rsa:2048 -subj "/C=US/ST=Mazovia/L=Warsaw/O=Seems Cloud/OU=Root/CN=Leaf" \
  -keyout tls.key.pem -out tls.csr.pem

openssl x509 -req -days 730 \
  -CA ca.crt.pem -CAkey ca.key.pem -CAcreateserial \
  -in tls.csr.pem -out tls.crt.pem
  
rm -f tls.csr.pem
```

```bash
openssl x509 -text -noout -in tls.crt.pem 

openssl x509 -noout -modulus -in tls.crt.pem | openssl md5
openssl rsa -noout -modulus -in tls.key.pem | openssl md5
```
