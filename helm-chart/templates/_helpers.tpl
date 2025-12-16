{{/*
Expand the name of the chart.
*/}}
{{- define "application.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "application.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "application.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Name of the component krakend.
*/}}
{{- define "krakend.name" -}}
{{- printf "%s-krakend" (include "application.name" .) | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified component krakend name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "krakend.fullname" -}}
{{- printf "%s-krakend" (include "application.fullname" .) | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Component krakend labels.
*/}}
{{- define "krakend.labels" -}}
helm.sh/chart: {{ include "application.chart" . }}
{{ include "krakend.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Component krakend selector labels.
*/}}
{{- define "krakend.selectorLabels" -}}
app.kubernetes.io/name: {{ include "application.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/component: krakend
isMainInterface: "yes"
tier: {{ .Values.krakend.tier }}
{{- end }}

{{/*
Return the krakend configuration configmap.
*/}}
{{- define "krakend.configmapName" -}}
{{- if .Values.krakend.existingConfigmap -}}
    {{- printf "%s" (tpl .Values.krakend.existingConfigmap $) -}}
{{- else -}}
    {{- printf "%s-config" (include "krakend.fullname" .) -}}
{{- end }}
{{- end }}
