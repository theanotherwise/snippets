```yaml
{{- range $report := .Values.dashboardsReports.reports }}
apiVersion: batch/v1
kind: CronJob
metadata:
  name: {{ include "test.fullname" $ }}
  labels:
    {{- include "test.labels" $ | nindent 4 }}
spec:
  schedule: "{{ $report.schedule }}"
  jobTemplate:
    spec:
      template:
        spec:
          containers:
            - name: hello
              image: busybox:1.28
              imagePullPolicy: IfNotPresent
              env:
                - name: "DASHBOARD_URL"
                  value: "{{ $report.dashboards_url }}"
                - name: "RECIPIENTS"
                  value: "{{ join "," $report.recipients }}"
          restartPolicy: OnFailure
---
{{- end }}
```

```yaml
dashboardsReports:
  username: admin
  password: admin
  reports:
    - name: "Fetech data from database"
      dashboards_url: "http://observability-opensearch-dashboards/fdafdsfadsfadsdfsafdsa"
      schedule: "* * * * 1"
      format: "pdf"
      recipients:
        - foo@gmail.com
    - name: "Fetech data from database"
      dashboards_url: "http://observability-opensearch-dashboards/fdafdsfadsfadsdfsafdsa"
      schedule: "* * * * 2"
      format: pdf
      recipients:
        - foo@gmail.com
        - bar@gmail.com
        - baz@gmail.com
```
