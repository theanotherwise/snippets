```yaml
apiVersion: v1
kind: ServiceAccount
metadata:
  name: nginx
automountServiceAccountToken: true
---
apiVersion: v1
kind: Pod
metadata:
  name: openldap
  labels:
    app: openldap
spec:
  serviceAccountName: openldap
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
    - protocol: TCP
      port: 1389
      targetPort: 1389
```
