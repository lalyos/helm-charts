{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "chart-12factor.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "fleet-cluster" }}
{{- with .Values.global }}
{{- with .fleet }}
{{- with .clusterLabels }}
{{- with index . "management.cattle.io/cluster-display-name"  }}
{{- . }}
{{- end }}
{{- end }}
{{- end }}
{{- end }}
{{- end }}

{{- define "fleet-color" }}
{{- with .Values.global }}
{{- with .fleet }}
{{- with .clusterLabels }}
{{- with .color  }}
{{- . }}
{{- end }}
{{- end }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "chart-12factor.fullname" -}}
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
{{- define "chart-12factor.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "chart-12factor.labels" -}}
helm.sh/chart: {{ include "chart-12factor.chart" . }}
{{ include "chart-12factor.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "chart-12factor.selectorLabels" -}}
app.kubernetes.io/name: {{ include "chart-12factor.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
