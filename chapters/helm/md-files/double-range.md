`values.yaml`
```yaml
nameOverride: ""
fullnameOverride: "observability-opensearch"

nodeGroups:
  - name: master
    replicas: 3
    zones:
      - name: ALL
        value: "ALL"
  - name: data
    replicas: 3
    zones:
      - name: INX
        value: az1
      - name: RDB
        value: az2
```

`_helpers.tpl`
```yaml
{{- define "observability-opensearch.fullName" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}

{{- define "observability-opensearch.groupName" -}}
{{- $fullName := (include "observability-opensearch.fullName" .root) -}}
{{- if ne .zoneName "ALL" -}}
{{- printf "%s-%s-%s" $fullName .groupName .zoneName -}}
{{- else -}}
{{- printf "%s-%s" $fullName .groupName -}}
{{- end -}}
{{- end -}}
```

`template.yaml`
```yaml
{{- range $group := .Values.nodeGroups }}
{{- range $zone := $group.zones }}
---
apiVersion: apps/v1
kind: StatefulSet
metadata:
  group: {{ $group.name }}
  name: {{ include "observability-opensearch.groupName"
           (dict "root" $ "groupName" $group.name "zoneName" $zone.value ) }}
{{- end }}
{{- end }}
```
