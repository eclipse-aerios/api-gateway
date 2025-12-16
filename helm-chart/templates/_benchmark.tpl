{{- define "ie.benchmarking.endpoints" -}}
{{- range $index, $value := .Values.krakend.infrastructureElements -}}
{
  "endpoint": "/{{ $value.id }}/benchmark/v1/cpu",
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
      "url_pattern": "/benchmark/v1/cpu",
      "encoding": "no-op",
      "method": "POST",
      "host": [
        "http://{{ $value.internalIp }}:{{ $.Values.krakend.config.benchmarkPort }}"
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
  "endpoint": "/{{ $value.id }}/benchmark/v1/network",
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
      "url_pattern": "/benchmark/v1/network",
      "encoding": "no-op",
      "method": "POST",
      "host": [
        "http://{{ $value.internalIp }}:{{ $.Values.krakend.config.benchmarkPort }}"
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