```yaml
dashboardsReports:
  username: admin
  password: admin
  reports:
    - shortName: "meta-bar"
      reportName: "Fetch data from Foo"
      dashboards_url: "http://observability-opensearch-dashboards/fdafdsfadsfadsdfsafdsa"
      schedule: "* * * * 1"
      format: "pdf"
      recipients:
        - foo@gmail.com
    - shortName: "crypto-act"
      reportName: "Fetch data from Foo"
      dashboards_url: "http://observability-opensearch-dashboards/fdafdsfadsfadsdfsafdsa"
      schedule: "* * * * 2"
      format: pdf
      recipients:
        - foo@gmail.com
        - bar@gmail.com
        - baz@gmail.com
```

```yaml
{{- range $report := .Values.dashboardsReports.reports }}
apiVersion: batch/v1
kind: CronJob
metadata:
  name: {{ include "observability-opensearch.fullname" $ }}-report-{{ $report.shortName }}
  labels:
    {{- include "observability-opensearch.labels" $ | nindent 4 }}
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
                - name: "REPORT_NAME"
                  value: "{{ $report.reportName }}"
                - name: "DASHBOARD_URL"
                  value: "{{ $report.dashboards_url }}"
                - name: "RECIPIENTS"
                  value: "{{ join "," $report.recipients }}"
                - name: "OUTPUT_FORMAT"
                  value: "{{ $report.format }}"
          restartPolicy: OnFailure
---
{{- end }}
```
