{{- define "ie.selfapi.endpoints" -}}
{{- range $index, $value := .Values.krakend.infrastructureElements -}}
{
  "endpoint": "/{{ $value.id }}/security/events",
  "method": "GET",
  "output_encoding": "no-op",
  "extra_config": {
    "auth/validator": {
      "cache": true,
      "cache_duration": {{ $.Values.krakend.config.orionCacheDuration }},
      "alg": "RS256",
      "roles_key": "realm_access.roles",
      "roles_key_is_nested": true,
      "roles": [
        "Continuum administrator"
      ],
      "jwk_url": "{{ $.Values.krakend.config.keycloakUrl }}/auth/realms/{{ $.Values.krakend.config.keycloakRealm }}/protocol/openid-connect/certs",
      "disable_jwk_security": true
    }
  },
  "input_query_strings": [
    "test"
  ],
  "backend": [
    {
      "url_pattern": "/security/events",
      "encoding": "no-op",
      "method": "GET",
      "host": [
        "http://{{ $value.internalIp }}:{{ $.Values.krakend.config.selfApiPort }}"
      ],
      "is_collection": false,
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
  "endpoint": "/{{ $value.id }}/orchestrator/rules",
  "method": "GET",
  "output_encoding": "no-op",
  "extra_config": {
    "auth/validator": {
      "cache": true,
      "cache_duration": {{ $.Values.krakend.config.orionCacheDuration }},
      "alg": "RS256",
      "roles_key": "realm_access.roles",
      "roles_key_is_nested": true,
      "roles": [
        "Continuum administrator"
      ],
      "jwk_url": "{{ $.Values.krakend.config.keycloakUrl }}/auth/realms/{{ $.Values.krakend.config.keycloakRealm }}/protocol/openid-connect/certs",
      "disable_jwk_security": true
    }
  },
  "input_query_strings": [
    "test"
  ],
  "backend": [
    {
      "url_pattern": "/orchestrator/rules",
      "encoding": "no-op",
      "method": "GET",
      "host": [
        "http://{{ $value.internalIp }}:{{ $.Values.krakend.config.selfApiPort }}"
      ],
      "is_collection": false,
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
  "endpoint": "/{{ $value.id }}/orchestrator/rules",
  "method": "POST",
  "output_encoding": "no-op",
  "extra_config": {
    "auth/validator": {
      "cache": true,
      "cache_duration": {{ $.Values.krakend.config.orionCacheDuration }},
      "alg": "RS256",
      "roles_key": "realm_access.roles",
      "roles_key_is_nested": true,
      "roles": [
        "Continuum administrator"
      ],
      "jwk_url": "{{ $.Values.krakend.config.keycloakUrl }}/auth/realms/{{ $.Values.krakend.config.keycloakRealm }}/protocol/openid-connect/certs",
      "disable_jwk_security": true
    }
  },
  "input_query_strings": [
    "test"
  ],
  "backend": [
    {
      "url_pattern": "/orchestrator/rules",
      "encoding": "no-op",
      "method": "POST",
      "host": [
        "http://{{ $value.internalIp }}:{{ $.Values.krakend.config.selfApiPort }}"
      ],
      "is_collection": false,
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
  "endpoint": "/{{ $value.id }}/orchestrator/rules",
  "method": "DELETE",
  "output_encoding": "no-op",
  "extra_config": {
    "auth/validator": {
      "cache": true,
      "cache_duration": {{ $.Values.krakend.config.orionCacheDuration }},
      "alg": "RS256",
      "roles_key": "realm_access.roles",
      "roles_key_is_nested": true,
      "roles": [
        "Continuum administrator"
      ],
      "jwk_url": "{{ $.Values.krakend.config.keycloakUrl }}/auth/realms/{{ $.Values.krakend.config.keycloakRealm }}/protocol/openid-connect/certs",
      "disable_jwk_security": true
    }
  },
  "input_query_strings": [
    "test"
  ],
  "backend": [
    {
      "url_pattern": "/orchestrator/rules",
      "encoding": "no-op",
      "method": "DELETE",
      "host": [
        "http://{{ $value.internalIp }}:{{ $.Values.krakend.config.selfApiPort }}"
      ],
      "is_collection": false,
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
  "endpoint": "/{{ $value.id }}/orchestrator/rule",
  "method": "GET",
  "output_encoding": "no-op",
  "extra_config": {
    "auth/validator": {
      "cache": true,
      "cache_duration": {{ $.Values.krakend.config.orionCacheDuration }},
      "alg": "RS256",
      "roles_key": "realm_access.roles",
      "roles_key_is_nested": true,
      "roles": [
        "Continuum administrator"
      ],
      "jwk_url": "{{ $.Values.krakend.config.keycloakUrl }}/auth/realms/{{ $.Values.krakend.config.keycloakRealm }}/protocol/openid-connect/certs",
      "disable_jwk_security": true
    }
  },
  "input_query_strings": [
    "test"
  ],
  "backend": [
    {
      "url_pattern": "/orchestrator/rule",
      "encoding": "no-op",
      "method": "GET",
      "host": [
        "http://{{ $value.internalIp }}:{{ $.Values.krakend.config.selfApiPort }}"
      ],
      "is_collection": false,
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
  "endpoint": "/{{ $value.id }}/orchestrator/rule",
  "method": "PUT",
  "output_encoding": "no-op",
  "extra_config": {
    "auth/validator": {
      "cache": true,
      "cache_duration": {{ $.Values.krakend.config.orionCacheDuration }},
      "alg": "RS256",
      "roles_key": "realm_access.roles",
      "roles_key_is_nested": true,
      "roles": [
        "Continuum administrator"
      ],
      "jwk_url": "{{ $.Values.krakend.config.keycloakUrl }}/auth/realms/{{ $.Values.krakend.config.keycloakRealm }}/protocol/openid-connect/certs",
      "disable_jwk_security": true
    }
  },
  "input_query_strings": [
    "test"
  ],
  "backend": [
    {
      "url_pattern": "/orchestrator/rule",
      "encoding": "no-op",
      "method": "PUT",
      "host": [
        "http://{{ $value.internalIp }}:{{ $.Values.krakend.config.selfApiPort }}"
      ],
      "is_collection": false,
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
  "endpoint": "/{{ $value.id }}/orchestrator/rule",
  "method": "DELETE",
  "output_encoding": "no-op",
  "extra_config": {
    "auth/validator": {
      "cache": true,
      "cache_duration": {{ $.Values.krakend.config.orionCacheDuration }},
      "alg": "RS256",
      "roles_key": "realm_access.roles",
      "roles_key_is_nested": true,
      "roles": [
        "Continuum administrator"
      ],
      "jwk_url": "{{ $.Values.krakend.config.keycloakUrl }}/auth/realms/{{ $.Values.krakend.config.keycloakRealm }}/protocol/openid-connect/certs",
      "disable_jwk_security": true
    }
  },
  "input_query_strings": [
    "test"
  ],
  "backend": [
    {
      "url_pattern": "/orchestrator/rule",
      "encoding": "no-op",
      "method": "DELETE",
      "host": [
        "http://{{ $value.internalIp }}:{{ $.Values.krakend.config.selfApiPort }}"
      ],
      "is_collection": false,
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
  "endpoint": "/{{ $value.id }}/optimization/optimize",
  "method": "POST",
  "output_encoding": "no-op",
  "extra_config": {
    "auth/validator": {
      "cache": true,
      "cache_duration": {{ $.Values.krakend.config.orionCacheDuration }},
      "alg": "RS256",
      "roles_key": "realm_access.roles",
      "roles_key_is_nested": true,
      "roles": [
        "Continuum administrator"
      ],
      "jwk_url": "{{ $.Values.krakend.config.keycloakUrl }}/auth/realms/{{ $.Values.krakend.config.keycloakRealm }}/protocol/openid-connect/certs",
      "disable_jwk_security": true
    }
  },
  "input_query_strings": [
    "test"
  ],
  "backend": [
    {
      "url_pattern": "/optimization/optimize",
      "encoding": "no-op",
      "method": "POST",
      "host": [
        "http://{{ $value.internalIp }}:{{ $.Values.krakend.config.selfApiPort }}"
      ],
      "is_collection": false,
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
  "endpoint": "/{{ $value.id }}/optimization/optimize/powerconsumption",
  "method": "POST",
  "output_encoding": "no-op",
  "extra_config": {
    "auth/validator": {
      "cache": true,
      "cache_duration": {{ $.Values.krakend.config.orionCacheDuration }},
      "alg": "RS256",
      "roles_key": "realm_access.roles",
      "roles_key_is_nested": true,
      "roles": [
        "Continuum administrator"
      ],
      "jwk_url": "{{ $.Values.krakend.config.keycloakUrl }}/auth/realms/{{ $.Values.krakend.config.keycloakRealm }}/protocol/openid-connect/certs",
      "disable_jwk_security": true
    }
  },
  "input_query_strings": [
    "test"
  ],
  "backend": [
    {
      "url_pattern": "/optimization/optimize/powerconsumption",
      "encoding": "no-op",
      "method": "POST",
      "host": [
        "http://{{ $value.internalIp }}:{{ $.Values.krakend.config.selfApiPort }}"
      ],
      "is_collection": false,
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
  "endpoint": "/{{ $value.id }}/optimization/sampling/parameters/{type}",
  "method": "GET",
  "output_encoding": "no-op",
  "extra_config": {
    "auth/validator": {
      "cache": true,
      "cache_duration": {{ $.Values.krakend.config.orionCacheDuration }},
      "alg": "RS256",
      "roles_key": "realm_access.roles",
      "roles_key_is_nested": true,
      "roles": [
        "Continuum administrator"
      ],
      "jwk_url": "{{ $.Values.krakend.config.keycloakUrl }}/auth/realms/{{ $.Values.krakend.config.keycloakRealm }}/protocol/openid-connect/certs",
      "disable_jwk_security": true
    }
  },
  "input_query_strings": [
    "test"
  ],
  "backend": [
    {
      "url_pattern": "/optimization/sampling/parameters/{type}",
      "encoding": "no-op",
      "method": "GET",
      "host": [
        "http://{{ $value.internalIp }}:{{ $.Values.krakend.config.selfApiPort }}"
      ],
      "is_collection": false,
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
  "endpoint": "/{{ $value.id }}/optimization/sampling/parameters/{type}",
  "method": "PUT",
  "output_encoding": "no-op",
  "extra_config": {
    "auth/validator": {
      "cache": true,
      "cache_duration": {{ $.Values.krakend.config.orionCacheDuration }},
      "alg": "RS256",
      "roles_key": "realm_access.roles",
      "roles_key_is_nested": true,
      "roles": [
        "Continuum administrator"
      ],
      "jwk_url": "{{ $.Values.krakend.config.keycloakUrl }}/auth/realms/{{ $.Values.krakend.config.keycloakRealm }}/protocol/openid-connect/certs",
      "disable_jwk_security": true
    }
  },
  "input_query_strings": [
    "test"
  ],
  "backend": [
    {
      "url_pattern": "/optimization/sampling/parameters/{type}",
      "encoding": "no-op",
      "method": "PUT",
      "host": [
        "http://{{ $value.internalIp }}:{{ $.Values.krakend.config.selfApiPort }}"
      ],
      "is_collection": false,
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
  "endpoint": "/{{ $value.id }}/optimization/anomaly/models",
  "method": "GET",
  "output_encoding": "no-op",
  "extra_config": {
    "auth/validator": {
      "cache": true,
      "cache_duration": {{ $.Values.krakend.config.orionCacheDuration }},
      "alg": "RS256",
      "roles_key": "realm_access.roles",
      "roles_key_is_nested": true,
      "roles": [
        "Continuum administrator"
      ],
      "jwk_url": "{{ $.Values.krakend.config.keycloakUrl }}/auth/realms/{{ $.Values.krakend.config.keycloakRealm }}/protocol/openid-connect/certs",
      "disable_jwk_security": true
    }
  },
  "input_query_strings": [
    "test"
  ],
  "backend": [
    {
      "url_pattern": "/optimization/anomaly/models",
      "encoding": "no-op",
      "method": "GET",
      "host": [
        "http://{{ $value.internalIp }}:{{ $.Values.krakend.config.selfApiPort }}"
      ],
      "is_collection": false,
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
  "endpoint": "/{{ $value.id }}/optimization/sampling/models",
  "method": "GET",
  "output_encoding": "no-op",
  "extra_config": {
    "auth/validator": {
      "cache": true,
      "cache_duration": {{ $.Values.krakend.config.orionCacheDuration }},
      "alg": "RS256",
      "roles_key": "realm_access.roles",
      "roles_key_is_nested": true,
      "roles": [
        "Continuum administrator"
      ],
      "jwk_url": "{{ $.Values.krakend.config.keycloakUrl }}/auth/realms/{{ $.Values.krakend.config.keycloakRealm }}/protocol/openid-connect/certs",
      "disable_jwk_security": true
    }
  },
  "input_query_strings": [
    "test"
  ],
  "backend": [
    {
      "url_pattern": "/optimization/sampling/models",
      "encoding": "no-op",
      "method": "GET",
      "host": [
        "http://{{ $value.internalIp }}:{{ $.Values.krakend.config.selfApiPort }}"
      ],
      "is_collection": false,
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
  "endpoint": "/{{ $value.id }}/optimization/anomaly/parameters/{type}",
  "method": "GET",
  "output_encoding": "no-op",
  "extra_config": {
    "auth/validator": {
      "cache": true,
      "cache_duration": {{ $.Values.krakend.config.orionCacheDuration }},
      "alg": "RS256",
      "roles_key": "realm_access.roles",
      "roles_key_is_nested": true,
      "roles": [
        "Continuum administrator"
      ],
      "jwk_url": "{{ $.Values.krakend.config.keycloakUrl }}/auth/realms/{{ $.Values.krakend.config.keycloakRealm }}/protocol/openid-connect/certs",
      "disable_jwk_security": true
    }
  },
  "input_query_strings": [
    "test"
  ],
  "backend": [
    {
      "url_pattern": "/optimization/anomaly/parameters/{type}",
      "encoding": "no-op",
      "method": "GET",
      "host": [
        "http://{{ $value.internalIp }}:{{ $.Values.krakend.config.selfApiPort }}"
      ],
      "is_collection": false,
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
  "endpoint": "/{{ $value.id }}/optimization/anomaly/parameters/{type}",
  "method": "PUT",
  "output_encoding": "no-op",
  "extra_config": {
    "auth/validator": {
      "cache": true,
      "cache_duration": {{ $.Values.krakend.config.orionCacheDuration }},
      "alg": "RS256",
      "roles_key": "realm_access.roles",
      "roles_key_is_nested": true,
      "roles": [
        "Continuum administrator"
      ],
      "jwk_url": "{{ $.Values.krakend.config.keycloakUrl }}/auth/realms/{{ $.Values.krakend.config.keycloakRealm }}/protocol/openid-connect/certs",
      "disable_jwk_security": true
    }
  },
  "input_query_strings": [
    "test"
  ],
  "backend": [
    {
      "url_pattern": "/optimization/anomaly/parameters/{type}",
      "encoding": "no-op",
      "method": "PUT",
      "host": [
        "http://{{ $value.internalIp }}:{{ $.Values.krakend.config.selfApiPort }}"
      ],
      "is_collection": false,
      "disable_host_sanitize": false
    }
  ],
  "input_headers": [
    "Accept",
    "Authorization",
    "Content-Type"
  ]
}
{{- if not (eq (add1 $index) (len $.Values.krakend.infrastructureElements)) -}},{{- end -}}
{{- end }}
{{- end }}