{{- define "hloFE.endpoints" -}}
{{- with .Values.krakend.config }}
{
          "endpoint": "/hlo_fe/services/{service_id}",
          "method": "POST",
          "output_encoding": "no-op",
          "extra_config": {
            "auth/validator": {
              "alg": "RS256",
              "roles_key": "realm_access.roles",
              "roles_key_is_nested": true,
              "roles": [
                "Continuum administrator",
                "IoT service deployer",
                "HLO"
              ],
              "jwk_url": "{{ .keycloakUrl }}/auth/realms/{{ $.Values.krakend.config.keycloakRealm }}/protocol/openid-connect/certs",
              "disable_jwk_security": true
            }
          },
          "input_query_strings": [],
          "backend": [
            {
              "url_pattern": "/hlo_fe/services/{service_id}",
              "encoding": "no-op",
              "method": "POST",
              "host": [
                {{ .hloFeUrl | quote }}
              ],
              "is_collection": true,
              "disable_host_sanitize": false
            }
          ],
          "input_headers": [
            "Authorization",
            "Content-Type",
            "Link",
            "NGSILD-Tenant"
          ]
        },
        {
          "endpoint": "/hlo_fe/services/{service_id}",
          "method": "GET",
          "output_encoding": "no-op",
          "extra_config": {
            "auth/validator": {
              "alg": "RS256",
              "roles_key": "realm_access.roles",
              "roles_key_is_nested": true,
              "roles": [
                "Continuum administrator",
                "IoT service deployer",
                "HLO"
              ],
              "jwk_url": "{{ .keycloakUrl }}/auth/realms/{{ $.Values.krakend.config.keycloakRealm }}/protocol/openid-connect/certs",
              "disable_jwk_security": true
            }
          },
          "input_query_strings": [],
          "backend": [
            {
              "url_pattern": "/hlo_fe/services/{service_id}",
              "encoding": "no-op",
              "method": "GET",
              "host": [
                {{ .hloFeUrl | quote }}
              ],
              "is_collection": true,
              "disable_host_sanitize": false
            }
          ],
          "input_headers": [
            "Authorization",
            "Content-Type",
            "Link",
            "NGSILD-Tenant"
          ]
        },
        {
          "endpoint": "/hlo_fe/services/{service_id}",
          "method": "DELETE",
          "output_encoding": "no-op",
          "extra_config": {
            "auth/validator": {
              "alg": "RS256",
              "roles_key": "realm_access.roles",
              "roles_key_is_nested": true,
              "roles": [
                "Continuum administrator",
                "IoT service deployer",
                "HLO"
              ],
              "jwk_url": "{{ .keycloakUrl }}/auth/realms/{{ $.Values.krakend.config.keycloakRealm }}/protocol/openid-connect/certs",
              "disable_jwk_security": true
            }
          },
          "input_query_strings": [],
          "backend": [
            {
              "url_pattern": "/hlo_fe/services/{service_id}",
              "encoding": "no-op",
              "method": "DELETE",
              "host": [
                {{ .hloFeUrl | quote }}
              ],
              "is_collection": true,
              "disable_host_sanitize": false
            }
          ],
          "input_headers": [
            "Authorization",
            "Content-Type",
            "Link",
            "NGSILD-Tenant"
          ]
        },
        {
          "endpoint": "/hlo_fe/services/{service_id}/purge",
          "method": "DELETE",
          "output_encoding": "no-op",
          "extra_config": {
            "auth/validator": {
              "alg": "RS256",
              "roles_key": "realm_access.roles",
              "roles_key_is_nested": true,
              "roles": [
                "Continuum administrator",
                "IoT service deployer",
                "HLO"
              ],
              "jwk_url": "{{ .keycloakUrl }}/auth/realms/{{ $.Values.krakend.config.keycloakRealm }}/protocol/openid-connect/certs",
              "disable_jwk_security": true
            }
          },
          "input_query_strings": [],
          "backend": [
            {
              "url_pattern": "/hlo_fe/services/{service_id}/purge",
              "encoding": "no-op",
              "method": "DELETE",
              "host": [
                {{ .hloFeUrl | quote }}
              ],
              "is_collection": true,
              "disable_host_sanitize": false
            }
          ],
          "input_headers": [
            "Authorization",
            "Content-Type",
            "Link",
            "NGSILD-Tenant"
          ]
        },
        {
          "endpoint": "/hlo_fe/services/{service_id}",
          "method": "PUT",
          "output_encoding": "no-op",
          "extra_config": {
            "auth/validator": {
              "alg": "RS256",
              "roles_key": "realm_access.roles",
              "roles_key_is_nested": true,
              "roles": [
                "Continuum administrator",
                "IoT service deployer",
                "HLO"
              ],
              "jwk_url": "{{ .keycloakUrl }}/auth/realms/{{ $.Values.krakend.config.keycloakRealm }}/protocol/openid-connect/certs",
              "disable_jwk_security": true
            }
          },
          "input_query_strings": [],
          "backend": [
            {
              "url_pattern": "/hlo_fe/services/{service_id}",
              "encoding": "no-op",
              "method": "PUT",
              "host": [
                {{ .hloFeUrl | quote }}
              ],
              "is_collection": true,
              "disable_host_sanitize": false
            }
          ],
          "input_headers": [
            "Authorization",
            "Content-Type",
            "Link",
            "NGSILD-Tenant"
          ]
        }
{{- end }}
{{- end }}