{{- define "orion.endpoints" -}}
{{- with .Values.krakend.config }}
{
          "endpoint": "/orionld/ngsi-ld/v1/entities/{entityId}/attrs/{attrId}",
          "method": "PATCH",
          "output_encoding": "no-op",
          "extra_config": {
            "auth/validator": {
              "cache": true,
              "cache_duration": {{ .orionCacheDuration }},
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
            "attrs",
            "count",
            "coordinates",
            "csf",
            "format",
            "geoproperty",
            "geometry",
            "geometryProperty",
            "georel",
            "id",
            "idPattern",
            "lang",
            "local",
            "limit",
            "offset",
            "onlyIds",
            "options",
            "q",
            "scopeQ",
            "type",
            "pick"
          ],
          "backend": [
            {
              "url_pattern": "/ngsi-ld/v1/entities/{entityId}/attrs/{attrId}",
              "encoding": "no-op",
              "method": "PATCH",
              "host": [
                {{ .orionUrl | quote }}
              ],
              "is_collection": false,
              "disable_host_sanitize": false
            }
          ],
          "input_headers": [
            "aerOS",
            "Accept",
            "Authorization",
            "Content-Type",
            "Link",
            "NGSILD-Tenant",
            "Via"
          ]
        },
        {
          "endpoint": "/orionld/ngsi-ld/v1/entities/{entityId}",
          "method": "PATCH",
          "output_encoding": "no-op",
          "extra_config": {
            "auth/validator": {
              "cache": true,
              "cache_duration": {{ .orionCacheDuration }},
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
            "attrs",
            "count",
            "coordinates",
            "csf",
            "format",
            "geoproperty",
            "geometry",
            "geometryProperty",
            "georel",
            "id",
            "idPattern",
            "lang",
            "local",
            "limit",
            "offset",
            "onlyIds",
            "options",
            "q",
            "scopeQ",
            "type",
            "pick"
          ],
          "backend": [
            {
              "url_pattern": "/ngsi-ld/v1/entities/{entityId}",
              "encoding": "no-op",
              "method": "PATCH",
              "host": [
                {{ .orionUrl | quote }}
              ],
              "is_collection": false,
              "disable_host_sanitize": false
            }
          ],
          "input_headers": [
            "aerOS",
            "Accept",
            "Authorization",
            "Content-Type",
            "Link",
            "NGSILD-Tenant",
            "Via"
          ]
        },
        {
          "endpoint": "/orionld/ngsi-ld/v1/entities",
          "method": "GET",
          "output_encoding": "no-op",
          "extra_config": {
            "auth/validator": {
              "cache": true,
              "cache_duration": {{ .orionCacheDuration }},
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
            "attrs",
            "count",
            "coordinates",
            "csf",
            "format",
            "geoproperty",
            "geometry",
            "geometryProperty",
            "georel",
            "id",
            "idPattern",
            "lang",
            "local",
            "limit",
            "offset",
            "onlyIds",
            "options",
            "q",
            "scopeQ",
            "type",
            "pick"
          ],
          "backend": [
            {
              "url_pattern": "/ngsi-ld/v1/entities",
              "encoding": "no-op",
              "method": "GET",
              "host": [
                {{ .orionUrl | quote }}
              ],
              "is_collection": false,
              "disable_host_sanitize": false
            }
          ],
          "input_headers": [
            "aerOS",
            "Accept",
            "Authorization",
            "Content-Type",
            "Link",
            "NGSILD-Tenant",
            "Via",
            "X-Forwarded-For",
            "X-Forwarded-Host"
          ]
        },
        {
          "endpoint": "/orionld/ngsi-ld/v1/entities/{entityId}",
          "method": "GET",
          "output_encoding": "no-op",
          "extra_config": {
            "auth/validator": {
              "cache": true,
              "cache_duration": {{ .orionCacheDuration }},
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
            "attrs",
            "format",
            "geometryProperty",
            "lang",
            "local",
            "options",
            "type"
          ],
          "backend": [
            {
              "url_pattern": "/ngsi-ld/v1/entities/{entityId}",
              "encoding": "no-op",
              "method": "GET",
              "host": [
                {{ .orionUrl | quote }}
              ],
              "is_collection": true,
              "disable_host_sanitize": false
            }
          ],
          "input_headers": [
            "aerOS",
            "Accept",
            "Authorization",
            "Content-Type",
            "Link",
            "NGSILD-Tenant",
            "Via",
            "X-Forwarded-For",
            "X-Forwarded-Host"
          ]
        },
        {
          "endpoint": "/orionld/ngsi-ld/v1/entities/{entityId}",
          "method": "DELETE",
          "output_encoding": "no-op",
          "extra_config": {
            "auth/validator": {
              "cache": true,
              "cache_duration": {{ .orionCacheDuration }},
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
            "local",
            "type"
          ],
          "backend": [
            {
              "url_pattern": "/ngsi-ld/v1/entities/{entityId}",
              "encoding": "no-op",
              "method": "DELETE",
              "host": [
                {{ .orionUrl | quote}}
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
            "NGSILD-Tenant",
            "Via",
            "X-Forwarded-For",
            "X-Forwarded-Host"
          ]
        },
        {
          "endpoint": "/orionld/ngsi-ld/v1/entities/{entityId}/attrs/{attrId}",
          "method": "DELETE",
          "output_encoding": "no-op",
          "extra_config": {
            "auth/validator": {
              "cache": true,
              "cache_duration": {{ .orionCacheDuration }},
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
            "local",
            "type"
          ],
          "backend": [
            {
              "url_pattern": "/ngsi-ld/v1/entities/{entityId}/attrs/{attrId}",
              "encoding": "no-op",
              "method": "DELETE",
              "host": [
                {{ .orionUrl | quote}}
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
            "NGSILD-Tenant",
            "Via",
            "X-Forwarded-For",
            "X-Forwarded-Host"
          ]
        },
        {
          "endpoint": "/orionld/ngsi-ld/v1/subscriptions/{subscriptionId}",
          "method": "DELETE",
          "output_encoding": "no-op",
          "extra_config": {
            "auth/validator": {
              "cache": true,
              "cache_duration": {{ .orionCacheDuration }},
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
            "local"
          ],
          "backend": [
            {
              "url_pattern": "/ngsi-ld/v1/subscriptions/{subscriptionId}",
              "encoding": "no-op",
              "method": "DELETE",
              "host": [
                {{ .orionUrl | quote }}
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
            "NGSILD-Tenant",
            "Via",
            "X-Forwarded-For",
            "X-Forwarded-Host"
          ]
        },
        {
          "endpoint": "/entities",
          "method": "GET",
          "output_encoding": "no-op",
          "extra_config": {
            "auth/validator": {
              "cache": true,
              "cache_duration": {{ .orionCacheDuration }},
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
            "attrs",
            "count",
            "coordinates",
            "csf",
            "format",
            "geoproperty",
            "geometry",
            "geometryProperty",
            "georel",
            "id",
            "idPattern",
            "lang",
            "local",
            "limit",
            "offset",
            "onlyIds",
            "options",
            "q",
            "scopeQ",
            "type",
            "pick"
          ],
          "backend": [
            {
              "url_pattern": "/ngsi-ld/v1/entities",
              "encoding": "no-op",
              "method": "GET",
              "host": [
                {{ .orionUrl | quote }}
              ],
              "is_collection": false,
              "disable_host_sanitize": false
            }
          ],
          "input_headers": [
            "aerOS",
            "Accept",
            "Authorization",
            "Content-Type",
            "Link",
            "NGSILD-Tenant",
            "Via",
            "X-Forwarded-For",
            "X-Forwarded-Host"
          ]
        },
        {
          "endpoint": "/entityOperations/create",
          "method": "POST",
          "output_encoding": "no-op",
          "extra_config": {
            "auth/validator": {
              "alg": "RS256",
              "roles_key": "realm_access.roles",
              "roles_key_is_nested": true,
              "roles": [
                "Domain administrator",
                "Continuum administrator"
              ],
              "jwk_url": "{{ .keycloakUrl }}/auth/realms/{{ $.Values.krakend.config.keycloakRealm }}/protocol/openid-connect/certs",
              "disable_jwk_security": true
            }
          },
          "input_query_strings": [
            "local"
          ],
          "backend": [
            {
              "url_pattern": "/ngsi-ld/v1/entityOperations/create",
              "encoding": "no-op",
              "method": "POST",
              "host": [
                {{ .orionUrl | quote }}
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
          "endpoint": "/entityOperations/merge",
          "method": "POST",
          "output_encoding": "no-op",
          "extra_config": {
            "auth/validator": {
              "alg": "RS256",
              "roles_key": "realm_access.roles",
              "roles_key_is_nested": true,
              "roles": [
                "Domain administrator",
                "Continuum administrator"
              ],
              "jwk_url": "{{ .keycloakUrl }}/auth/realms/{{ $.Values.krakend.config.keycloakRealm }}/protocol/openid-connect/certs",
              "disable_jwk_security": true
            }
          },
          "input_query_strings": [
            "local"
          ],
          "backend": [
            {
              "url_pattern": "/ngsi-ld/v1/entityOperations/merge",
              "encoding": "no-op",
              "method": "POST",
              "host": [
                {{ .orionUrl | quote }}
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
          "endpoint": "/jsonldContexts",
          "method": "GET",
          "output_encoding": "no-op",
          "extra_config": {
            "auth/validator": {
              "alg": "RS256",
              "roles_key": "realm_access.roles",
              "roles_key_is_nested": true,
              "roles": [
                "Domain administrator",
                "Continuum administrator"
              ],
              "jwk_url": "{{ .keycloakUrl }}/auth/realms/{{ $.Values.krakend.config.keycloakRealm }}/protocol/openid-connect/certs",
              "disable_jwk_security": true
            }
          },
          "input_query_strings": [
            "details",
            "kind",
            "local"
          ],
          "backend": [
            {
              "url_pattern": "/ngsi-ld/v1/jsonldContexts",
              "encoding": "no-op",
              "method": "GET",
              "host": [
                {{ .orionUrl | quote }}
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
          "endpoint": "/jsonldContexts",
          "method": "POST",
          "output_encoding": "no-op",
          "extra_config": {
            "auth/validator": {
              "alg": "RS256",
              "roles_key": "realm_access.roles",
              "roles_key_is_nested": true,
              "roles": [
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
              "url_pattern": "/ngsi-ld/v1/jsonldContexts",
              "encoding": "no-op",
              "method": "POST",
              "host": [
                {{ .orionUrl | quote }}
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
          "endpoint": "/entities/{entityId}/attrs/{attrId}",
          "method": "DELETE",
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
            "deleteAll",
            "datasetId",
            "local",
            "type"
          ],
          "backend": [
            {
              "url_pattern": "/ngsi-ld/v1/entities/{entityId}/attrs/{attrId}",
              "encoding": "no-op",
              "method": "DELETE",
              "host": [
                {{ .orionUrl | quote }}
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
        },
        {
          "endpoint": "/entities/{entityId}/attrs/{attrId}",
          "method": "PATCH",
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
            "local",
            "type"
          ],
          "backend": [
            {
              "url_pattern": "/ngsi-ld/v1/entities/{entityId}/attrs/{attrId}",
              "encoding": "no-op",
              "method": "PATCH",
              "host": [
                {{ .orionUrl | quote }}
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
        },
        {
          "endpoint": "/entities/{entityId}/attrs/{attrId}",
          "method": "PUT",
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
            "local",
            "type"
          ],
          "backend": [
            {
              "url_pattern": "/ngsi-ld/v1/entities/{entityId}/attrs/{attrId}",
              "encoding": "no-op",
              "method": "PUT",
              "host": [
                {{ .orionUrl | quote }}
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
        },
        {
          "endpoint": "/csourceSubscriptions",
          "method": "GET",
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
            "options",
            "limit",
            "count",
            "local",
            "format"
          ],
          "backend": [
            {
              "url_pattern": "/ngsi-ld/v1/csourceSubscriptions",
              "encoding": "no-op",
              "method": "GET",
              "host": [
                {{ .orionUrl | quote }}
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
        },
        {
          "endpoint": "/csourceSubscriptions",
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
            "local"
          ],
          "backend": [
            {
              "url_pattern": "/ngsi-ld/v1/csourceSubscriptions",
              "encoding": "no-op",
              "method": "POST",
              "host": [
                {{ .orionUrl | quote }}
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
        },
        {
          "endpoint": "/entityOperations/upsert",
          "method": "POST",
          "output_encoding": "no-op",
          "extra_config": {
            "auth/validator": {
              "alg": "RS256",
              "roles_key": "realm_access.roles",
              "roles_key_is_nested": true,
              "roles": [
                "Domain administrator",
                "Continuum administrator"
              ],
              "jwk_url": "{{ .keycloakUrl }}/auth/realms/{{ $.Values.krakend.config.keycloakRealm }}/protocol/openid-connect/certs",
              "disable_jwk_security": true
            }
          },
          "input_query_strings": [
            "options",
            "local"
          ],
          "backend": [
            {
              "url_pattern": "/ngsi-ld/v1/entityOperations/upsert",
              "encoding": "no-op",
              "method": "POST",
              "host": [
                {{ .orionUrl | quote }}
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
        },
        {
          "endpoint": "/types/{type}",
          "method": "GET",
          "output_encoding": "no-op",
          "extra_config": {
            "auth/validator": {
              "alg": "RS256",
              "roles_key": "realm_access.roles",
              "roles_key_is_nested": true,
              "roles": [
                "Domain administrator",
                "Continuum administrator"
              ],
              "jwk_url": "{{ .keycloakUrl }}/auth/realms/{{ $.Values.krakend.config.keycloakRealm }}/protocol/openid-connect/certs",
              "disable_jwk_security": true
            }
          },
          "input_query_strings": [
            "local"
          ],
          "backend": [
            {
              "url_pattern": "/ngsi-ld/v1/types/{type}",
              "encoding": "no-op",
              "method": "GET",
              "host": [
                {{ .orionUrl | quote }}
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
        },
        {
          "endpoint": "/entityOperations/query",
          "method": "POST",
          "output_encoding": "no-op",
          "extra_config": {
            "auth/validator": {
              "alg": "RS256",
              "roles_key": "realm_access.roles",
              "roles_key_is_nested": true,
              "roles": [
                "Domain administrator",
                "Continuum administrator"
              ],
              "jwk_url": "{{ .keycloakUrl }}/auth/realms/{{ $.Values.krakend.config.keycloakRealm }}/protocol/openid-connect/certs",
              "disable_jwk_security": true
            }
          },
          "input_query_strings": [
            "local"
          ],
          "backend": [
            {
              "url_pattern": "/ngsi-ld/v1/entityOperations/query",
              "encoding": "no-op",
              "method": "POST",
              "host": [
                {{ .orionUrl | quote }}
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
        },
        {
          "endpoint": "/csourceSubscriptions/{subscriptionId}",
          "method": "DELETE",
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
            "local"
          ],
          "backend": [
            {
              "url_pattern": "/ngsi-ld/v1/csourceSubscriptions/{subscriptionId}",
              "encoding": "no-op",
              "method": "DELETE",
              "host": [
                {{ .orionUrl | quote }}
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
        },
        {
          "endpoint": "/csourceSubscriptions/{subscriptionId}",
          "method": "GET",
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
            "local"
          ],
          "backend": [
            {
              "url_pattern": "/ngsi-ld/v1/csourceSubscriptions/{subscriptionId}",
              "encoding": "no-op",
              "method": "GET",
              "host": [
                {{ .orionUrl | quote }}
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
        },
        {
          "endpoint": "/csourceSubscriptions/{subscriptionId}",
          "method": "PATCH",
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
            "local"
          ],
          "backend": [
            {
              "url_pattern": "/ngsi-ld/v1/csourceSubscriptions/{subscriptionId}",
              "encoding": "no-op",
              "method": "PATCH",
              "host": [
                {{ .orionUrl | quote }}
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
        },
        {
          "endpoint": "/entityOperations/delete",
          "method": "POST",
          "output_encoding": "no-op",
          "extra_config": {
            "auth/validator": {
              "alg": "RS256",
              "roles_key": "realm_access.roles",
              "roles_key_is_nested": true,
              "roles": [
                "Domain administrator",
                "Continuum administrator"
              ],
              "jwk_url": "{{ .keycloakUrl }}/auth/realms/{{ $.Values.krakend.config.keycloakRealm }}/protocol/openid-connect/certs",
              "disable_jwk_security": true
            }
          },
          "input_query_strings": [
            "local"
          ],
          "backend": [
            {
              "url_pattern": "/ngsi-ld/v1/entityOperations/delete",
              "encoding": "no-op",
              "method": "POST",
              "host": [
                {{ .orionUrl | quote }}
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
        },
        {
          "endpoint": "/entityOperations/update",
          "method": "POST",
          "output_encoding": "no-op",
          "extra_config": {
            "auth/validator": {
              "alg": "RS256",
              "roles_key": "realm_access.roles",
              "roles_key_is_nested": true,
              "roles": [
                "Domain administrator",
                "Continuum administrator"
              ],
              "jwk_url": "{{ .keycloakUrl }}/auth/realms/{{ $.Values.krakend.config.keycloakRealm }}/protocol/openid-connect/certs",
              "disable_jwk_security": true
            }
          },
          "input_query_strings": [
            "options",
            "local"
          ],
          "backend": [
            {
              "url_pattern": "/ngsi-ld/v1/entityOperations/update",
              "encoding": "no-op",
              "method": "POST",
              "host": [
                {{ .orionUrl | quote }}
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
        },
        {
          "endpoint": "/jsonldContexts/{contextId}",
          "method": "DELETE",
          "output_encoding": "no-op",
          "extra_config": {
            "auth/validator": {
              "alg": "RS256",
              "roles_key": "realm_access.roles",
              "roles_key_is_nested": true,
              "roles": [
                "Domain administrator",
                "Continuum administrator"
              ],
              "jwk_url": "{{ .keycloakUrl }}/auth/realms/{{ $.Values.krakend.config.keycloakRealm }}/protocol/openid-connect/certs",
              "disable_jwk_security": true
            }
          },
          "input_query_strings": [
            "reload",
            "local"
          ],
          "backend": [
            {
              "url_pattern": "/ngsi-ld/v1/jsonldContexts/{contextId}",
              "encoding": "no-op",
              "method": "DELETE",
              "host": [
                {{ .orionUrl | quote }}
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
        },
        {
          "endpoint": "/jsonldContexts/{contextId}",
          "method": "GET",
          "output_encoding": "no-op",
          "extra_config": {
            "auth/validator": {
              "alg": "RS256",
              "roles_key": "realm_access.roles",
              "roles_key_is_nested": true,
              "roles": [
                "Domain administrator",
                "Continuum administrator"
              ],
              "jwk_url": "{{ .keycloakUrl }}/auth/realms/{{ $.Values.krakend.config.keycloakRealm }}/protocol/openid-connect/certs",
              "disable_jwk_security": true
            }
          },
          "input_query_strings": [
            "details",
            "local"
          ],
          "backend": [
            {
              "url_pattern": "/ngsi-ld/v1/jsonldContexts/{contextId}",
              "encoding": "no-op",
              "method": "GET",
              "host": [
                {{ .orionUrl | quote }}
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
        },
        {
          "endpoint": "/subscriptions",
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
            "local"
          ],
          "backend": [
            {
              "url_pattern": "/ngsi-ld/v1/subscriptions",
              "encoding": "no-op",
              "method": "POST",
              "host": [
                {{ .orionUrl | quote }}
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
        },
        {
          "endpoint": "/subscriptions",
          "method": "GET",
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
          "backend": [
            {
              "url_pattern": "/ngsi-ld/v1/subscriptions",
              "encoding": "no-op",
              "extra_config": null,
              "method": "GET",
              "host": [
                {{ .orionUrl | quote }}
              ],
              "is_collection": false,
              "disable_host_sanitize": false
            }
          ],
          "input_query_strings": [
            "*"
          ],
          "input_headers": [
            "aerOS",
            "Accept",
            "Authorization",
            "Content-Type",
            "Link",
            "NGSILD-Tenant",
            "Via"
          ]
        },
        {
          "endpoint": "/csourceRegistrations",
          "method": "GET",
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
            "id",
            "type",
            "idPattern",
            "attrs",
            "q",
            "csf",
            "geometry",
            "georel",
            "coordinates",
            "geoproperty",
            "timeproperty",
            "timerel",
            "timeAt",
            "endTimeAt",
            "geometryProperty",
            "lang",
            "scopeQ",
            "options",
            "limit",
            "count",
            "local",
            "format"
          ],
          "backend": [
            {
              "url_pattern": "/ngsi-ld/v1/csourceRegistrations",
              "encoding": "no-op",
              "method": "GET",
              "host": [
                {{ .orionUrl | quote }}
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
        },
        {
          "endpoint": "/csourceRegistrations",
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
            "local"
          ],
          "backend": [
            {
              "url_pattern": "/ngsi-ld/v1/csourceRegistrations",
              "encoding": "no-op",
              "method": "POST",
              "host": [
                {{ .orionUrl | quote }}
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
        },
        {
          "endpoint": "/subscriptions/{subscriptionId}",
          "method": "DELETE",
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
            "local"
          ],
          "backend": [
            {
              "url_pattern": "/ngsi-ld/v1/subscriptions/{subscriptionId}",
              "encoding": "no-op",
              "method": "DELETE",
              "host": [
                {{ .orionUrl | quote }}
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
        },
        {
          "endpoint": "/subscriptions/{subscriptionId}",
          "method": "GET",
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
            "local"
          ],
          "backend": [
            {
              "url_pattern": "/ngsi-ld/v1/subscriptions/{subscriptionId}",
              "encoding": "no-op",
              "method": "GET",
              "host": [
                {{ .orionUrl | quote }}
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
        },
        {
          "endpoint": "/subscriptions/{subscriptionId}",
          "method": "PATCH",
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
            "local"
          ],
          "backend": [
            {
              "url_pattern": "/ngsi-ld/v1/subscriptions/{subscriptionId}",
              "encoding": "no-op",
              "method": "PATCH",
              "host": [
                {{ .orionUrl | quote }}
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
        },
        {
          "endpoint": "/attributes/{attrId}",
          "method": "GET",
          "output_encoding": "no-op",
          "extra_config": {
            "auth/validator": {
              "alg": "RS256",
              "roles_key": "realm_access.roles",
              "roles_key_is_nested": true,
              "roles": [
                "Domain administrator",
                "Continuum administrator"
              ],
              "jwk_url": "{{ .keycloakUrl }}/auth/realms/{{ $.Values.krakend.config.keycloakRealm }}/protocol/openid-connect/certs",
              "disable_jwk_security": true
            }
          },
          "input_query_strings": [
            "local"
          ],
          "backend": [
            {
              "url_pattern": "/ngsi-ld/v1/attributes/{attrId}",
              "encoding": "no-op",
              "method": "GET",
              "host": [
                {{ .orionUrl | quote }}
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
        },
        {
          "endpoint": "/entities",
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
            "local"
          ],
          "backend": [
            {
              "url_pattern": "/ngsi-ld/v1/entities",
              "encoding": "no-op",
              "method": "POST",
              "host": [
                {{ .orionUrl | quote }}
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
        },
        {
          "endpoint": "/entities/{entityId}",
          "method": "PATCH",
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
            "lang",
            "local",
            "observedAt",
            "options",
            "type"
          ],
          "backend": [
            {
              "url_pattern": "/ngsi-ld/v1/entities/{entityId}",
              "encoding": "no-op",
              "method": "PATCH",
              "host": [
                {{ .orionUrl | quote }}
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
        },
        {
          "endpoint": "/entities/{entityId}",
          "method": "PUT",
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
            "local",
            "type"
          ],
          "backend": [
            {
              "url_pattern": "/ngsi-ld/v1/entities/{entityId}",
              "encoding": "no-op",
              "method": "PUT",
              "host": [
                {{ .orionUrl | quote }}
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
        },
        {
          "endpoint": "/entities",
          "method": "DELETE",
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
            "local",
            "type"
          ],
          "backend": [
            {
              "url_pattern": "/ngsi-ld/v1/entities",
              "encoding": "no-op",
              "method": "DELETE",
              "host": [
                {{ .orionUrl | quote }}
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
        },
        {
          "endpoint": "/entities/{entityId}",
          "method": "DELETE",
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
            "local",
            "type"
          ],
          "backend": [
            {
              "url_pattern": "/ngsi-ld/v1/entities/{entityId}",
              "encoding": "no-op",
              "method": "DELETE",
              "host": [
                {{ .orionUrl | quote }}
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
        },
        {
          "endpoint": "/entities/{entityId}",
          "method": "GET",
          "output_encoding": "no-op",
          "extra_config": {
            "auth/validator": {
              "cache": true,
              "cache_duration": {{ .orionCacheDuration }},
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
            "attrs",
            "format",
            "geometryProperty",
            "lang",
            "local",
            "options",
            "type"
          ],
          "backend": [
            {
              "url_pattern": "/ngsi-ld/v1/entities/{entityId}",
              "encoding": "no-op",
              "method": "GET",
              "host": [
                {{ .orionUrl | quote }}
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
        },
        {
          "endpoint": "/entities/{entityId}/attrs",
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
            "options",
            "local",
            "type"
          ],
          "backend": [
            {
              "url_pattern": "/ngsi-ld/v1/entities/{entityId}/attrs",
              "encoding": "no-op",
              "method": "POST",
              "host": [
                {{ .orionUrl | quote }}
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
        },
        {
          "endpoint": "/attributes",
          "method": "GET",
          "output_encoding": "no-op",
          "extra_config": {
            "auth/validator": {
              "alg": "RS256",
              "roles_key": "realm_access.roles",
              "roles_key_is_nested": true,
              "roles": [
                "Domain administrator",
                "Continuum administrator"
              ],
              "jwk_url": "{{ .keycloakUrl }}/auth/realms/{{ $.Values.krakend.config.keycloakRealm }}/protocol/openid-connect/certs",
              "disable_jwk_security": true
            }
          },
          "input_query_strings": [
            "details",
            "local"
          ],
          "backend": [
            {
              "url_pattern": "/ngsi-ld/v1/attributes",
              "encoding": "no-op",
              "method": "GET",
              "host": [
                {{ .orionUrl | quote }}
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
        },
        {
          "endpoint": "/types",
          "method": "GET",
          "output_encoding": "no-op",
          "extra_config": {
            "auth/validator": {
              "alg": "RS256",
              "roles_key": "realm_access.roles",
              "roles_key_is_nested": true,
              "roles": [
                "Domain administrator",
                "Continuum administrator"
              ],
              "jwk_url": "{{ .keycloakUrl }}/auth/realms/{{ $.Values.krakend.config.keycloakRealm }}/protocol/openid-connect/certs",
              "disable_jwk_security": true
            }
          },
          "input_query_strings": [
            "details",
            "local"
          ],
          "backend": [
            {
              "url_pattern": "/ngsi-ld/v1/types",
              "encoding": "no-op",
              "method": "GET",
              "host": [
                {{ .orionUrl | quote }}
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
        },
        {
          "endpoint": "/csourceRegistrations/{registrationId}",
          "method": "DELETE",
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
            "local"
          ],
          "backend": [
            {
              "url_pattern": "/ngsi-ld/v1/csourceRegistrations/{registrationId}",
              "encoding": "no-op",
              "method": "DELETE",
              "host": [
                {{ .orionUrl | quote }}
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
        },
        {
          "endpoint": "/csourceRegistrations/{registrationId}",
          "method": "GET",
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
            "local"
          ],
          "backend": [
            {
              "url_pattern": "/ngsi-ld/v1/csourceRegistrations/{registrationId}",
              "encoding": "no-op",
              "method": "GET",
              "host": [
                {{ .orionUrl | quote }}
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
        },
        {
          "endpoint": "/csourceRegistrations/{registrationId}",
          "method": "PATCH",
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
            "local"
          ],
          "backend": [
            {
              "url_pattern": "/ngsi-ld/v1/csourceRegistrations/{registrationId}",
              "encoding": "no-op",
              "method": "PATCH",
              "host": [
                {{ .orionUrl | quote }}
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
        },
        {
          "endpoint": "/orionld/ex/v1/notify",
          "method": "POST",
          "output_encoding": "no-op",
          "extra_config": {
            "auth/validator": {
              "cache": true,
              "cache_duration": {{ .orionCacheDuration }},
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
          "input_query_strings": [],
          "backend": [
            {
              "url_pattern": "/ngsi-ld/ex/v1/notify",
              "encoding": "no-op",
              "method": "POST",
              "host": [
                {{ .orionUrl | quote }}
              ],
              "is_collection": false,
              "disable_host_sanitize": false
            }
          ],
          "input_headers": [
            "aerOS",
            "Accept",
            "Authorization",
            "Content-Type",
            "Link",
            "NGSILD-Tenant",
            "Via",
            "X-Forwarded-For",
            "X-Forwarded-Host"
          ]
        },
        {
          "endpoint": "/orionld/ex/v1/notify/notifications/{subscriptionId}",
          "method": "POST",
          "output_encoding": "no-op",
          "extra_config": {
            "auth/validator": {
              "cache": true,
              "cache_duration": {{ .orionCacheDuration }},
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
          "input_query_strings": [],
          "backend": [
            {
              "url_pattern": "/ngsi-ld/ex/v1/notify/notifications/{subscriptionId}",
              "encoding": "no-op",
              "method": "POST",
              "host": [
                {{ .orionUrl | quote }}
              ],
              "is_collection": false,
              "disable_host_sanitize": false
            }
          ],
          "input_headers": [
            "aerOS",
            "Accept",
            "Authorization",
            "Content-Type",
            "Link",
            "NGSILD-Tenant",
            "Via",
            "X-Forwarded-For",
            "X-Forwarded-Host"
          ]
        }
{{- end }}
{{- end }}