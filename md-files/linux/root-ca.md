```bash
openssl x509 -subject -nameopt RFC2253 -noout -in tls.crt.pem
openssl x509 -text -noout -in tls.crt.pem 

openssl x509 -noout -modulus -in tls.crt.pem | openssl md5
openssl rsa -noout -modulus -in tls.key.pem | openssl md5
```

```
openssl req -nodes -x509 -days 3650 -newkey rsa:2048 -subj "/C=US/ST=Mazovia/L=Warsaw/O=Seems Cloud/OU=Root" \
  -keyout ca.key.pem -out ca.crt.pem

openssl req -nodes -new -newkey rsa:2048 -subj "/C=US/ST=Mazovia/L=Warsaw/O=Seems Cloud/OU=Root/CN=*.localhost" \
  -keyout tls.key.pem -out tls.csr.pem

openssl x509 -req -days 730 \
  -CA ca.crt.pem -CAkey ca.key.pem -CAcreateserial \
  -in tls.csr.pem -out tls.crt.pem
  
rm -f tls.csr.pem
```

```
kubectl create secret tls application-tls \
  --key=tls.key.pem \
  --cert=tls.crt.pem
```
