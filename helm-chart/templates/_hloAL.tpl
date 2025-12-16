{{- define "hloAL.endpoints" -}}
{{- with .Values.krakend.config }}
{
          "endpoint": "/hlo_al/services/{service_id}",
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
              "url_pattern": "/hlo_al/services/{service_id}",
              "encoding": "no-op",
              "method": "POST",
              "host": [
                {{ .hloAllocatorUrl | quote }}
              ],
              "is_collection": true,
              "disable_host_sanitize": false
            }
          ],
          "input_headers": [
            "Authorization",
            "Content-Type"
          ]
        },
        {
          "endpoint": "/hlo_al/services/{service_id}/overlay",
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
              "url_pattern": "/hlo_al/services/{service_id}/overlay",
              "encoding": "no-op",
              "method": "DELETE",
              "host": [
                {{ .hloAllocatorUrl | quote }}
              ],
              "is_collection": true,
              "disable_host_sanitize": false
            }
          ],
          "input_headers": [
            "Authorization",
            "NGSILD-Tenant"
          ]
        },
        {
          "endpoint": "/hlo_al/services/{service_id}/service_components/{service_component_id}/",
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
              "url_pattern": "/hlo_al/services/{service_id}/service_components/{service_component_id}/",
              "encoding": "no-op",
              "method": "PUT",
              "host": [
                {{ .hloAllocatorUrl | quote }}
              ],
              "is_collection": true,
              "disable_host_sanitize": false
            }
          ],
          "input_headers": [
            "Authorization",
            "Content-Type"
          ]
        },
        {
          "endpoint": "/hlo_al/services/{service_id}/service_components/{service_component_id}/",
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
              "url_pattern": "/hlo_al/services/{service_id}/service_components/{service_component_id}/",
              "encoding": "no-op",
              "method": "GET",
              "host": [
                {{ .hloAllocatorUrl | quote }}
              ],
              "is_collection": true,
              "disable_host_sanitize": false
            }
          ],
          "input_headers": [
            "Authorization"
          ]
        },
        {
          "endpoint": "/hlo_al/services/{service_id}/service_components/{service_component_id}/",
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
              "url_pattern": "/hlo_al/services/{service_id}/service_components/{service_component_id}/",
              "encoding": "no-op",
              "method": "DELETE",
              "host": [
                {{ .hloAllocatorUrl | quote }}
              ],
              "is_collection": true,
              "disable_host_sanitize": false
            }
          ],
          "input_headers": [
            "Authorization"
          ]
        }
{{- end }}
{{- end }}