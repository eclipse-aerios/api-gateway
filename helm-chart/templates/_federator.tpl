{{- define "federator.endpoints" -}}
{{- with .Values.krakend.config }}
{
          "endpoint": "/federator/health",
          "method": "GET",
          "output_encoding": "no-op",
          "extra_config": {
            "auth/validator": {
              "alg": "RS256",
              "roles_key": "realm_access.roles",
              "roles_key_is_nested": true,
              "roles": [
                "ContextBroker",
                "Domain administrator",
                "Continuum administrator"
              ],
              "jwk_url": "{{ .keycloakUrl }}/auth/realms/{{ $.Values.krakend.config.keycloakRealm }}/protocol/openid-connect/certs",
              "disable_jwk_security": true
            }
          },
          "input_query_strings": [],
          "backend": [
            {
              "url_pattern": "/health",
              "encoding": "no-op",
              "method": "GET",
              "host": [
                {{ .federatorUrl | quote }}
              ],
              "is_collection": true,
              "disable_host_sanitize": false
            }
          ],
          "input_headers": [
            "Accept",
            "Authorization",
            "Content-Type"
          ]
        },
        {
          "endpoint": "/federator/v1/domains",
          "method": "GET",
          "output_encoding": "no-op",
          "extra_config": {
            "auth/validator": {
              "alg": "RS256",
              "roles_key": "realm_access.roles",
              "roles_key_is_nested": true,
              "roles": [
                "ContextBroker",
                "Domain administrator",
                "Continuum administrator"
              ],
              "jwk_url": "{{ .keycloakUrl }}/auth/realms/{{ $.Values.krakend.config.keycloakRealm }}/protocol/openid-connect/certs",
              "disable_jwk_security": true
            }
          },
          "input_query_strings": [],
          "backend": [
            {
              "url_pattern": "/v1/domains",
              "encoding": "no-op",
              "method": "GET",
              "host": [
                {{ .federatorUrl | quote }}
              ],
              "is_collection": true,
              "disable_host_sanitize": false
            }
          ],
          "input_headers": [
            "Accept",
            "Authorization",
            "Content-Type"
          ]
        },
        {
          "endpoint": "/federator/v1/domains",
          "method": "POST",
          "output_encoding": "no-op",
          "extra_config": {
            "auth/validator": {
              "alg": "RS256",
              "roles_key": "realm_access.roles",
              "roles_key_is_nested": true,
              "roles": [
                "ContextBroker"
              ],
              "jwk_url": "{{ .keycloakUrl }}/auth/realms/{{ $.Values.krakend.config.keycloakRealm }}/protocol/openid-connect/certs",
              "disable_jwk_security": true
            }
          },
          "input_query_strings": [
            "spread"
          ],
          "backend": [
            {
              "url_pattern": "/v1/domains",
              "encoding": "no-op",
              "method": "POST",
              "host": [
                {{ .federatorUrl | quote }}
              ],
              "is_collection": true,
              "disable_host_sanitize": false
            }
          ],
          "input_headers": [
            "Accept",
            "Authorization",
            "Content-Type"
          ]
        },
        {
          "endpoint": "/federator/v1/domains/local",
          "method": "GET",
          "output_encoding": "no-op",
          "extra_config": {
            "auth/validator": {
              "alg": "RS256",
              "roles_key": "realm_access.roles",
              "roles_key_is_nested": true,
              "roles": [
                "ContextBroker",
                "Domain administrator",
                "Continuum administrator"
              ],
              "jwk_url": "{{ .keycloakUrl }}/auth/realms/{{ $.Values.krakend.config.keycloakRealm }}/protocol/openid-connect/certs",
              "disable_jwk_security": true
            }
          },
          "input_query_strings": [],
          "backend": [
            {
              "url_pattern": "/v1/domains/local",
              "encoding": "no-op",
              "method": "GET",
              "host": [
                {{ .federatorUrl | quote }}
              ],
              "is_collection": true,
              "disable_host_sanitize": false
            }
          ],
          "input_headers": [
            "Accept",
            "Authorization",
            "Content-Type"
          ]
        },
        {
          "endpoint": "/federator/v1/domains/local",
          "method": "DELETE",
          "output_encoding": "no-op",
          "extra_config": {
            "auth/validator": {
              "alg": "RS256",
              "roles_key": "realm_access.roles",
              "roles_key_is_nested": true,
              "roles": [
                "ContextBroker",
                "Domain administrator",
                "Continuum administrator"
              ],
              "jwk_url": "{{ .keycloakUrl }}/auth/realms/{{ $.Values.krakend.config.keycloakRealm }}/protocol/openid-connect/certs",
              "disable_jwk_security": true
            }
          },
          "input_query_strings": [],
          "backend": [
            {
              "url_pattern": "/v1/domains/local",
              "encoding": "no-op",
              "method": "DELETE",
              "host": [
                {{ .federatorUrl | quote }}
              ],
              "is_collection": true,
              "disable_host_sanitize": false
            }
          ],
          "input_headers": [
            "Accept",
            "Authorization",
            "Content-Type"
          ]
        },
        {
          "endpoint": "/federator/v1/domains/{domainName}",
          "method": "DELETE",
          "output_encoding": "no-op",
          "extra_config": {
            "auth/validator": {
              "alg": "RS256",
              "roles_key": "realm_access.roles",
              "roles_key_is_nested": true,
              "roles": [
                "ContextBroker"
              ],
              "jwk_url": "{{ .keycloakUrl }}/auth/realms/{{ $.Values.krakend.config.keycloakRealm }}/protocol/openid-connect/certs",
              "disable_jwk_security": true
            }
          },
          "input_query_strings": [],
          "backend": [
            {
              "url_pattern": "/v1/domains/{domainName}",
              "encoding": "no-op",
              "method": "DELETE",
              "host": [
                {{ .federatorUrl | quote }}
              ],
              "is_collection": true,
              "disable_host_sanitize": false
            }
          ],
          "input_headers": [
            "Accept",
            "Authorization",
            "Content-Type"
          ]
        }
{{- end }}
{{- end }}