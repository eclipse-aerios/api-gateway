{{- define "dataFabric.endpoints" -}}
{{- with .Values.krakend.config }}
{
          "endpoint": "/dataProducts",
          "method": "POST",
          "output_encoding": "no-op",
          "extra_config": {
            "auth/validator": {
              "alg": "RS256",
              "roles_key": "realm_access.roles",
              "roles_key_is_nested": true,
              "roles": [
                "Continuum administrator",
                "Data product owner"
              ],
              "jwk_url": "{{ .keycloakUrl }}/auth/realms/{{ $.Values.krakend.config.keycloakRealm }}/protocol/openid-connect/certs",
              "disable_jwk_security": true
            }
          },
          "input_query_strings": [],
          "backend": [
            {
              "url_pattern": "/dataProducts",
              "encoding": "no-op",
              "method": "POST",
              "host": [
                {{ .dataProductManagerUrl | quote }}
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
          "endpoint": "/dataCatalog",
          "method": "POST",
          "output_encoding": "no-op",
          "extra_config": {
            "auth/validator": {
              "alg": "RS256",
              "roles_key": "realm_access.roles",
              "roles_key_is_nested": true,
              "roles": [
                "Continuum administrator",
                "Data product owner"
              ],
              "jwk_url": "{{ .keycloakUrl }}/auth/realms/{{ $.Values.krakend.config.keycloakRealm }}/protocol/openid-connect/certs",
              "disable_jwk_security": true
            }
          },
          "input_query_strings": [],
          "backend": [
            {
              "url_pattern": "/dataProducts",
              "encoding": "no-op",
              "method": "POST",
              "host": [
                {{ .dataCatalogManagerUrl | quote }}
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
          "endpoint": "/dataCatalog/{dataProductId}",
          "method": "DELETE",
          "output_encoding": "no-op",
          "extra_config": {
            "auth/validator": {
              "alg": "RS256",
              "roles_key": "realm_access.roles",
              "roles_key_is_nested": true,
              "roles": [
                "Continuum administrator",
                "Data product owner"
              ],
              "jwk_url": "{{ .keycloakUrl }}/auth/realms/{{ $.Values.krakend.config.keycloakRealm }}/protocol/openid-connect/certs",
              "disable_jwk_security": true
            }
          },
          "input_query_strings": [],
          "backend": [
            {
              "url_pattern": "/dataProducts/{dataProductId}",
              "encoding": "no-op",
              "method": "DELETE",
              "host": [
                {{ .dataCatalogManagerUrl | quote }}
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
          "endpoint": "/dataProducts",
          "method": "GET",
          "output_encoding": "no-op",
          "extra_config": {
            "auth/validator": {
              "alg": "RS256",
              "roles_key": "realm_access.roles",
              "roles_key_is_nested": true,
              "roles": [
                "Continuum administrator",
                "Data product owner",
                "Data consumer"
              ],
              "jwk_url": "{{ .keycloakUrl }}/auth/realms/{{ $.Values.krakend.config.keycloakRealm }}/protocol/openid-connect/certs",
              "disable_jwk_security": true
            }
          },
          "input_query_strings": [],
          "backend": [
            {
              "url_pattern": "/dataProducts",
              "encoding": "no-op",
              "method": "GET",
              "host": [
                {{ .dataProductManagerUrl | quote }}
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
          "endpoint": "/dataProducts/{data_product_id}",
          "method": "GET",
          "output_encoding": "no-op",
          "extra_config": {
            "auth/validator": {
              "alg": "RS256",
              "roles_key": "realm_access.roles",
              "roles_key_is_nested": true,
              "roles": [
                "Continuum administrator",
                "Data product owner",
                "Data consumer"
              ],
              "jwk_url": "{{ .keycloakUrl }}/auth/realms/{{ $.Values.krakend.config.keycloakRealm }}/protocol/openid-connect/certs",
              "disable_jwk_security": true
            }
          },
          "input_query_strings": [],
          "backend": [
            {
              "url_pattern": "/dataProducts/{data_product_id}",
              "encoding": "no-op",
              "method": "GET",
              "host": [
                {{ .dataProductManagerUrl | quote }}
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
          "endpoint": "/dataProducts",
          "method": "DELETE",
          "output_encoding": "no-op",
          "extra_config": {
            "auth/validator": {
              "alg": "RS256",
              "roles_key": "realm_access.roles",
              "roles_key_is_nested": true,
              "roles": [
                "Continuum administrator",
                "Data product owner"
              ],
              "jwk_url": "{{ .keycloakUrl }}/auth/realms/{{ $.Values.krakend.config.keycloakRealm }}/protocol/openid-connect/certs",
              "disable_jwk_security": true
            }
          },
          "input_query_strings": [],
          "backend": [
            {
              "url_pattern": "/dataProducts",
              "encoding": "no-op",
              "method": "DELETE",
              "host": [
                {{ .dataProductManagerUrl | quote }}
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
          "endpoint": "/dataProducts/{data_product_id}",
          "method": "DELETE",
          "output_encoding": "no-op",
          "extra_config": {
            "auth/validator": {
              "alg": "RS256",
              "roles_key": "realm_access.roles",
              "roles_key_is_nested": true,
              "roles": [
                "Continuum administrator",
                "Data product owner"
              ],
              "jwk_url": "{{ .keycloakUrl }}/auth/realms/{{ $.Values.krakend.config.keycloakRealm }}/protocol/openid-connect/certs",
              "disable_jwk_security": true
            }
          },
          "input_query_strings": [],
          "backend": [
            {
              "url_pattern": "/dataProducts/{data_product_id}",
              "encoding": "no-op",
              "method": "DELETE",
              "host": [
                {{ .dataProductManagerUrl | quote }}
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