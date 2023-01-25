```yaml
apiVersion: v1
kind: ServiceAccount
metadata:
  name: nginx
automountServiceAccountToken: true
---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: openldap
  labels:
    app: openldap
spec:
  selector:
    matchLabels:
      app: openldap
  replicas: 1
  template:
    metadata:
      labels:
        app: openldap
    spec:
      serviceAccountName: nginx
      automountServiceAccountToken: true
      containers:
        - name: openldap
          image: docker.io/bitnami/openldap:latest
          imagePullPolicy: "Always"
          env:
            - name: BITNAMI_DEBUG
              value: "true"
            - name: LDAP_LOGLEVEL
              value: "4"
            - name: LDAP_ADMIN_USERNAME
              value: "admin"
            - name: LDAP_ADMIN_PASSWORD
              value: "admin"
            - name: LDAP_CONFIG_ADMIN_ENABLED
              value: "yes"
            - name: LDAP_USER_DC
              value: "users"
            - name: LDAP_GROUP
              value: "groups"
            - name: LDAP_ROOT
              value: "dc=seems,dc=cloud"
            - name: LDAP_ADD_SCHEMAS
              value: "yes"
---
apiVersion: v1
kind: Service
metadata:
  name: openldap
  labels:
    app: openldap
spec:
  selector:
    app: openldap
  type: ClusterIP
  ports:
    - name: ldap
      protocol: TCP
      port: 1389
      targetPort: 1389
```
