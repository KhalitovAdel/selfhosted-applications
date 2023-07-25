## Related doc
vvvvvv https://developer.hashicorp.com/vault/tutorials/auth-methods/oidc-auth
https://d-heinrich.medium.com/hashicorp-vault-with-oidc-using-keycloak-95d8feee269
https://docs-bigbang.dso.mil/2.0.1/packages/vault/docs/keycloak/
vvv https://faun.pub/integrate-keycloak-with-hashicorp-vault-5264a873dd2f

## How to map roles

https://discuss.hashicorp.com/t/manage-groups-for-oidc-authentication/29215

`vault login`

`vault auth enable oidc`

```
vault write auth/oidc/config \
    oidc_discovery_url="http://auth.${DOMAIN}/realms/${REALM}" \
    oidc_client_id="${CLIENT_ID}" \
    oidc_client_secret="${CLIENT_SECRET}" \
    default_role=vault
```

```
  reset && \
  vault delete auth/oidc/role/vault && \
  vault write auth/oidc/role/vault \
    bound_audiences="${CLIENT_ID}" \
    allowed_redirect_uris="http://vault.${DOMAIN}/oidc/callback" \
    allowed_redirect_uris="http://vault.${DOMAIN}/ui/vault/auth/oidc/oidc/callback" \
    user_claim="sub" \
    policies="vault" \
    role_type="oidc" \
    groups_claim="/resource_access/applications/roles" && \
  vault read auth/oidc/role/vault
```

vault.policy
```
path "cubbyhole" {
    capabilities = []
}

path "kv/data/{{identity.entity.aliases.auth_oidc_54c0aa44.name}}/*" {
    capabilities = [ "create", "update", "read", "delete", "list" ]
}

path "kv/metadata/{{identity.entity.aliases.auth_oidc_54c0aa44.name}}/*" {
    capabilities = [ "list" ]
}

```