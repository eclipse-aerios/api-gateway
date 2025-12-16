{{- define "iota_api.endpoints" -}}
{{- with .Values.krakend.config }}
{
          "endpoint": "/iota_api",
          "method": "POST",
          "output_encoding": "no-op",
          "extra_config": {
            "auth/validator": {
              "alg": "RS256",
              "roles_key": "realm_access.roles",
              "roles_key_is_nested": true,
              "roles": [
                "Domain administrator",
                "Continuum administrator",
                "ContextBroker"
              ],
              "jwk_url": "{{ .keycloakUrl }}/auth/realms/{{ $.Values.krakend.config.keycloakRealm }}/protocol/openid-connect/certs",
              "disable_jwk_security": true
            }
          },
          "input_query_strings": [
            "node"
          ],
          "backend": [
            {
              "url_pattern": "/upload",
              "encoding": "no-op",
              "method": "POST",
              "host": [
                {{ .iotaAPIUrl | quote }}
              ],
              "is_collection": true,
              "disable_host_sanitize": false
            }
          ],
          "input_headers": [
            "aerOS",
            "Authorization",
            "Content-Type",
            "Link",
            "NGSILD-Tenant"
          ]
        }
{{- end }}
{{- end }}