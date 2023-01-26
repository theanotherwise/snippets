```yaml
annotations:
  vault.hashicorp.com/role: 'ns-vault_system-sa-nginx'
  vault.hashicorp.com/agent-inject: 'true'
  vault.hashicorp.com/agent-inject-secret-config: 'kv-foo/data/credentials/apps/foo'
  vault.hashicorp.com/agent-inject-template-config: |
    {{ with secret "kv-foo/data/credentials/apps/foo" -}}
    USERNAME="{{ .Data.data.USERNAME}}"
    PASSWORD="{{ .Data.data.PASSWORD }}"
    {{- end }}
```

```bash
kubectl exec -ti vault-0 -- vault login -method=token

# Auth Methods
kubectl exec -ti vault-0 -- vault auth list
kubectl exec -ti vault-0 -- vault auth list -detailed

# Auth Methods (Username/Password)
kubectl exec -ti vault-0 -- vault auth enable userpass

kubectl exec -ti vault-0 -- vault write /auth/userpass/users/test password="test"

# Auth Methods (Kubernetes)
kubectl exec -ti vault-0 -- vault auth enable kubernetes
kubectl exec -ti vault-0 -- vault write /auth/kubernetes/config \
  kubernetes_host="https://127.0.0.1:443"

kubectl exec -ti vault-0 -- vault write /auth/kubernetes/role/reader \
  bound_service_account_names="debug" \
  bound_service_account_namespaces="cert-manager" \
  policies="root"

# Groups
kubectl exec -it vault-0 -- vault list -detailed identity/group/id

kubectl exec -ti vault-0 -- vault write identity/group \
  name="test" \
  policies="test" \
  type="internal" \
  metadata="Organization=Seems Cloud" \
  metadata="Domain=Development" \
  metadata="Team=Pricing"

kubectl exec -ti vault-0 -- vault write identity/group-alias name="test" \
"auth_userpass_dc1a9a7e" \
"4ba0d82f-3be4-ce5c-4e41-0be82ccb4f34"

# List Peers
kubectl exec -ti vault-0 -- vault operator raft list-peers

# Policies
kubectl exec -ti vault-0 -- vault policy list

# Tokens
kubectl exec -ti vault-0 -- vault list /auth/token/accessors
kubectl exec -ti vault-0 -- vault token lookup
kubectl exec -ti vault-0 -- vault token create -policy=root

# Secrets
kubectl exec -ti vault-0 -- vault secrets list
kubectl exec -ti vault-0 -- vault secrets enable -path=kv -version=10 kv-v2
kubectl exec -ti vault-0 -- vault secrets enable -path=pki pki
kubectl exec -ti vault-0 -- vault secrets disable secret

# Operations on Secrets
kubectl exec -ti vault-0 -- vault kv list kv

kubectl exec -ti vault-0 -- vault kv put -mount=kv credentials/apps/foo USERNAME="hello" PASSWORD="world"
kubectl exec -ti vault-0 -- vault kv put -mount=kv credentials/apps/foo USERNAME="hello1" PASSWORD="world"
kubectl exec -ti vault-0 -- vault kv put -mount=kv credentials/apps/foo USERNAME="hello" PASSWORD="world1"
kubectl exec -ti vault-0 -- vault kv put -mount=kv credentials/apps/bar USERNAME="hello" PASSWORD="world"
kubectl exec -ti vault-0 -- vault kv put -mount=kv credentials/apps/bar USERNAME="hello1" PASSWORD="world"
kubectl exec -ti vault-0 -- vault kv put -mount=kv credentials/apps/bar USERNAME="hello" PASSWORD="world1"

kubectl exec -ti vault-0 -- vault kv get -mount=kv credentials/apps/foo
kubectl exec -ti vault-0 -- vault kv get -mount=kv -version=1 credentials/apps/foo

kubectl exec -ti vault-0 -- vault kv get -mount=kv credentials/apps/bar
kubectl exec -ti vault-0 -- vault kv get -mount=kv -version=1 credentials/apps/bar

kubectl exec -ti vault-0 -- vault kv rollback -mount=kv -version=3 credentials/apps/foo

# Operations on PKI
kubectl exec -ti vault-0 -- vault secrets tune -max-lease-ttl=87600h pki

# Policy
kubectl exec -ti vault-0 -- vault policy write test - <<EndOfMessage
path "kv/*" {
  capabilities = ["list"]
}

path "kv/data/credentials/apps/foo" {
  capabilities = ["read"]
}
EndOfMessage
```
