`values.yaml`
```yaml
nameOverride: ""
fullnameOverride: "opensearch"

nodeGroups:
  - name: master
    replicas: 3
    zones:
      - name: ALL
        value: "all"
  - name: data
    replicas: 3
    separatedZones: false
    zones:
      - name: FOO
        value: "az1"
      - name: BAR
        value: "az2"
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
{{- if ne .zoneName "all" -}}
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

## Result
```yaml
---
# Source: observability-opensearch/templates/statefulset.yaml
apiVersion: apps/v1
kind: StatefulSet
metadata:
  group: master
  name: observability-opensearch-master
---
# Source: observability-opensearch/templates/statefulset.yaml
apiVersion: apps/v1
kind: StatefulSet
metadata:
  group: data
  name: observability-opensearch-data-az1
---
# Source: observability-opensearch/templates/statefulset.yaml
apiVersion: apps/v1
kind: StatefulSet
metadata:
  group: data
  name: observability-opensearch-data-az2
```
