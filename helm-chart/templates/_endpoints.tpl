{{- define "krakend.endpoints" -}}
{{- range $index, $value := .Values.krakend.additionalEndpoints -}}
{
  "endpoint": {{ .endpoint | quote}},
  "method": {{ .method | quote}},
  "output_encoding": "no-op",
  "extra_config": {
    "auth/validator": {
      "cache": true,
      "cache_duration": {{ $.Values.krakend.config.orionCacheDuration }},
      "alg": "RS256",
      "roles_key": "realm_access.roles",
      "roles_key_is_nested": true,
      "roles": [
        {{- if not (eq (len .roles) 0) }}
        {{ .roles | join "\", \"" | printf "\"%s\"" }}
        {{- end }}
      ],
      "jwk_url": "{{ $.Values.krakend.config.keycloakUrl }}/auth/realms/{{ $.Values.krakend.config.keycloakRealm }}/protocol/openid-connect/certs",
      "disable_jwk_security": true
    }
  },
  "input_query_strings": [
    {{- if not (eq (len .queryStrings) 0) }}
    {{ .queryStrings | join "\", \"" | printf "\"%s\"" }}
    {{- end }}
  ],
  "backend": [
    {
      {{- with .backend }}
      "url_pattern": {{ .url | quote }},
      "encoding": "no-op",
      "method": {{ .method | quote}},
      "host": [
        "{{ .host }}"
      ],
      "is_collection": false,
      "disable_host_sanitize": false
      {{- end }}
    }
  ],
  "input_headers": [
    {{- if not (eq (len .inputHeaders) 0) }}
    {{ .inputHeaders | join "\", \"" | printf "\"%s\"" }}
    {{- end }}
  ]
}
{{- if not (eq (add1 $index) (len $.Values.krakend.additionalEndpoints)) -}},{{- end -}}
{{- end }}
{{- end }}