# Keycloak Integration

In order to start up the services (as deamon), please execute:

```
docker-compose up -d --force-recreate --remove-orphans
```

Afterwards, open the [Keycloak Administration Console](http://localhost:8080) in your browser.


## Keycloak

A dedicated realm [engineering](http://localhost:8080/auth/realms/engineering/) is available.

```
{
  "realm": "engineering",
  "public_key": "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAtgYIlXk1nhSY2A3g4ZgA21aF561UaphVzlzEQ91jOdMxkUWrrLpJMt9v/sXdmQ7Un8TrBonOWF1+lntbq+p8Hn+sVO6BGq1kI/HkKGjlf3PiN1Py+M0TfCiLWZTjz6Q0ex2Lb2Y8xLUV3Saig10CT89Z5WDjYisz0LlEf8TZwsKRXZGm8Rm1GJ1YRdhCujyIY3gOqtCXIW7XHIzOJvGkwv10BrLst4DdYW6h2HV2fiRD+GW7O0rX5ZJBhNKZ+DfsW5Zn6uEoXKvkrTotyqh7MoTpVa+zoyZO/rovkH0kQz5J9YUi/uGqZrIwxVQqLtfnwijxWLU1cdKRUGIckCDY2QIDAQAB",
  "token-service": "http://localhost:8080/auth/realms/engineering/protocol/openid-connect",
  "account-service": "http://localhost:8080/auth/realms/engineering/account",
  "tokens-not-before": 0
}
```

It has the following [OpenID configuration](http://localhost:8080/auth/realms/engineering/.well-known/openid-configuration).

```
{
  "issuer": "http://localhost:8080/auth/realms/engineering",
  "authorization_endpoint": "http://localhost:8080/auth/realms/engineering/protocol/openid-connect/auth",
  "token_endpoint": "http://localhost:8080/auth/realms/engineering/protocol/openid-connect/token",
  "token_introspection_endpoint": "http://localhost:8080/auth/realms/engineering/protocol/openid-connect/token/introspect",
  "userinfo_endpoint": "http://localhost:8080/auth/realms/engineering/protocol/openid-connect/userinfo",
  "end_session_endpoint": "http://localhost:8080/auth/realms/engineering/protocol/openid-connect/logout",
  "jwks_uri": "http://localhost:8080/auth/realms/engineering/protocol/openid-connect/certs",
  "check_session_iframe": "http://localhost:8080/auth/realms/engineering/protocol/openid-connect/login-status-iframe.html",
  "grant_types_supported": [
    "authorization_code",
    "implicit",
    "refresh_token",
    "password",
    "client_credentials"
  ],
  "response_types_supported": [
    "code",
    "none",
    "id_token",
    "token",
    "id_token token",
    "code id_token",
    "code token",
    "code id_token token"
  ],
  "subject_types_supported": [
    "public",
    "pairwise"
  ],
  "id_token_signing_alg_values_supported": [
    "PS384",
    "ES384",
    "RS384",
    "HS256",
    "HS512",
    "ES256",
    "RS256",
    "HS384",
    "ES512",
    "PS256",
    "PS512",
    "RS512"
  ],
  "userinfo_signing_alg_values_supported": [
    "PS384",
    "ES384",
    "RS384",
    "HS256",
    "HS512",
    "ES256",
    "RS256",
    "HS384",
    "ES512",
    "PS256",
    "PS512",
    "RS512",
    "none"
  ],
  "request_object_signing_alg_values_supported": [
    "PS384",
    "ES384",
    "RS384",
    "ES256",
    "RS256",
    "ES512",
    "PS256",
    "PS512",
    "RS512",
    "none"
  ],
  "response_modes_supported": [
    "query",
    "fragment",
    "form_post"
  ],
  "registration_endpoint": "http://localhost:8080/auth/realms/engineering/clients-registrations/openid-connect",
  "token_endpoint_auth_methods_supported": [
    "private_key_jwt",
    "client_secret_basic",
    "client_secret_post",
    "client_secret_jwt"
  ],
  "token_endpoint_auth_signing_alg_values_supported": [
    "RS256"
  ],
  "claims_supported": [
    "aud",
    "sub",
    "iss",
    "auth_time",
    "name",
    "given_name",
    "family_name",
    "preferred_username",
    "email"
  ],
  "claim_types_supported": [
    "normal"
  ],
  "claims_parameter_supported": false,
  "scopes_supported": [
    "openid",
    "unrestricted",
    "restricted",
    "microprofile-jwt",
    "web-origins",
    "roles",
    "phone",
    "address",
    "email",
    "profile",
    "offline_access"
  ],
  "request_parameter_supported": true,
  "request_uri_parameter_supported": true,
  "code_challenge_methods_supported": [
    "plain",
    "S256"
  ],
  "tls_client_certificate_bound_access_tokens": true,
  "introspection_endpoint": "http://localhost:8080/auth/realms/engineering/protocol/openid-connect/token/introspect"
}
```

Its [JSON web key set](http://localhost:8080/auth/realms/engineering/protocol/openid-connect/certs) is structured as follows.

```
{
  "keys": [
    {
      "kid": "67UXIesalg34mGqQslRcR9bqaY_knMguc2b7y30tIjg",
      "kty": "RSA",
      "alg": "RS256",
      "use": "sig",
      "n": "tgYIlXk1nhSY2A3g4ZgA21aF561UaphVzlzEQ91jOdMxkUWrrLpJMt9v_sXdmQ7Un8TrBonOWF1-lntbq-p8Hn-sVO6BGq1kI_HkKGjlf3PiN1Py-M0TfCiLWZTjz6Q0ex2Lb2Y8xLUV3Saig10CT89Z5WDjYisz0LlEf8TZwsKRXZGm8Rm1GJ1YRdhCujyIY3gOqtCXIW7XHIzOJvGkwv10BrLst4DdYW6h2HV2fiRD-GW7O0rX5ZJBhNKZ-DfsW5Zn6uEoXKvkrTotyqh7MoTpVa-zoyZO_rovkH0kQz5J9YUi_uGqZrIwxVQqLtfnwijxWLU1cdKRUGIckCDY2Q",
      "e": "AQAB",
      "x5c": [
        "MIIDZjCCAk4CCQCX9UE8miI32jANBgkqhkiG9w0BAQsFADB1MQswCQYDVQQGEwJERTESMBAGA1UECAwJU3R1dHRnYXJ0MRowGAYDVQQHDBFCYWRlbi1XdXJ0dGVtYmVyZzEiMCAGA1UECgwZRU5HSU5FRVJJTkcgU29mdHdhcmUgTGFiczESMBAGA1UEAwwJbG9jYWxob3N0MB4XDTE5MDUwOTExNDMxOFoXDTIwMDUwODExNDMxOFowdTELMAkGA1UEBhMCREUxEjAQBgNVBAgMCVN0dXR0Z2FydDEaMBgGA1UEBwwRQmFkZW4tV3VydHRlbWJlcmcxIjAgBgNVBAoMGUVOR0lORUVSSU5HIFNvZnR3YXJlIExhYnMxEjAQBgNVBAMMCWxvY2FsaG9zdDCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBALYGCJV5NZ4UmNgN4OGYANtWheetVGqYVc5cxEPdYznTMZFFq6y6STLfb/7F3ZkO1J/E6waJzlhdfpZ7W6vqfB5/rFTugRqtZCPx5Cho5X9z4jdT8vjNE3woi1mU48+kNHsdi29mPMS1Fd0mooNdAk/PWeVg42IrM9C5RH/E2cLCkV2RpvEZtRidWEXYQro8iGN4DqrQlyFu1xyMzibxpML9dAay7LeA3WFuodh1dn4kQ/hluztK1+WSQYTSmfg37FuWZ+rhKFyr5K06LcqoezKE6VWvs6MmTv66L5B9JEM+SfWFIv7hqmayMMVUKi7X58Io8Vi1NXHSkVBiHJAg2NkCAwEAATANBgkqhkiG9w0BAQsFAAOCAQEAUTpEkvK6HWpPVL3a6o8qOOb/cv3ovGd7l+iEyh00GiBMT4XyxGCPEcA3XkEudeguVC1ruzIHnVxZqUnyqdngSVtMFI1XSLz5NhJlFPutv6UjZS27t/aFL/GJvdCdBDX/flRxuQya21nKcq0JvkH/TjB4aROpoUHbSJnZpRE0tBb/xP4oFscLlETwPFTXq8JMLpjBwjUyR3iphsq+NmkuAEZJ0QOdzjCK1vmRo0nEwLNMBI7l80i5ffjIbKjhilJVIdcIeylWeJzHceX8VeoHOkj8SmQizpBDXrVlXu7aN/YpEdyovvVm/KQSE/NQgN9R6QIU9xDhxI0KwnowSQYzTg=="
      ],
      "x5t": "IrM8Btu5iZwoF2zgXR3Hvi8Io84",
      "x5t#S256": "eD9vDpiqi5bXaPhDgbU_ADSErAgNITeFT1A3mkWVUfU"
    },
    {
      "kid": "-2Ma8v8KhOjqT3vLvH2aQ6_tE1lqedtM_AciaHkUJyU",
      "kty": "RSA",
      "alg": "RS256",
      "use": "sig",
      "n": "pMVAv6YxHjRv917kzvNKyjHbXcs_9d1Va_VlAQfwRgvI3Q62FHOVB2vvNG352htOy6jmxLikKnP6uNzC6i1GeDXEB1A69dsHBiFcjc68Iisfrj8M9hcrdfkixUAjn0jFHIrTiKPasJ702CL_Iucn7fjxhQ2OYbzi1l1cJc_DugBqbBS_HePEJmVgsU984GLYEB_czs8DFa5vJKsH_kEileoHwTbn2SeKAUkLXl9SANGT60_DGcquEn60kPV98lRsm4An1kwNBN-jGwg55uH9d1YHRnCIJgo9durCQY8TPpznrIbBtJjIJbEAbKII8t0Mfl_m28uLdPdbQmR6W_Cwjw",
      "e": "AQAB",
      "x5c": [
        "MIICnzCCAYcCBgFqnJSNijANBgkqhkiG9w0BAQsFADATMREwDwYDVQQDDAhjb21wb3NlcjAeFw0xOTA1MDkxMjMwNDJaFw0yOTA1MDkxMjMyMjJaMBMxETAPBgNVBAMMCGNvbXBvc2VyMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEApMVAv6YxHjRv917kzvNKyjHbXcs/9d1Va/VlAQfwRgvI3Q62FHOVB2vvNG352htOy6jmxLikKnP6uNzC6i1GeDXEB1A69dsHBiFcjc68Iisfrj8M9hcrdfkixUAjn0jFHIrTiKPasJ702CL/Iucn7fjxhQ2OYbzi1l1cJc/DugBqbBS/HePEJmVgsU984GLYEB/czs8DFa5vJKsH/kEileoHwTbn2SeKAUkLXl9SANGT60/DGcquEn60kPV98lRsm4An1kwNBN+jGwg55uH9d1YHRnCIJgo9durCQY8TPpznrIbBtJjIJbEAbKII8t0Mfl/m28uLdPdbQmR6W/CwjwIDAQABMA0GCSqGSIb3DQEBCwUAA4IBAQBzo8QLMyoVXPnxINuaiXu8bYpeSAZMZPGUwS5MqpsDan1EMCskLeHtC1wKZpxLGPqIFkSry7SM3uQGsXPB5Ym2LRE7Q9wj6Ffj1jHgodZaGA1GAEYes3mQlXfocmFJp2bh3VFD0ntUWoJEIsJ9zIZIdMd0Vf4RdZ5uPvD/UDPo9CEcNF/heniMkW4gATy5KjfTT+WddrvCII2HOfvAIID127B7AMGOvc6RMP2ZcoZe+nlO9tFk+MgLAESN6g0tUtKcjBb3hMWNXMZw+avd4OzpF9SDz74xNl3PK8XoS3QXAKHL9j5UPu3Yo5krAmXesw0O+paaAbXNkbE1Td5IcH8X"
      ],
      "x5t": "rQS2RJ6Y5sBDzVVhbj6MtoCZ1GU",
      "x5t#S256": "L1lFhAIibhAQeP6Svhu0tzXvLWNrn9demPvwYru78Pc"
    }
  ]
}
```

### Exporting a Configuration

In order to export the current keycloak configuration for the `engineering`-realm please execute:

```
docker-compose -f docker-compose.keycloak-export.yml up
```
