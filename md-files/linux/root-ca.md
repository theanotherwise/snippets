```bash
openssl x509 -subject -nameopt RFC2253 -noout -in client.crt.pem

openssl x509 -text -noout -in client.crt.pem 
```

```bash
openssl req -nodes -x509 -days 3650 -newkey rsa:4096 -subj "/C=US/ST=Mazovia/L=Warsaw/O=Seems Cloud/OU=Root" \
  -keyout ca.key.pem -out ca.crt.pem

openssl req -nodes -new -newkey rsa:4096 -subj "/C=US/ST=Mazovia/L=Warsaw/O=Seems Cloud/OU=Root/CN=*.localhost" \
  -keyout client.key.pem -out client.csr.pem

 openssl x509 -req -days 730 \
  -CA ca.crt.pem -CAkey ca.key.pem -CAcreateserial \
  -in client.csr.pem -out client.crt.pem
```

```bash
kubectl create secret tls application-tls \
  --key=client.key.pem \
  --cert=client.crt.pem
```
