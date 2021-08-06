```bash
curl -X GET -k -I \
	-u "nrsup:11ec02bc8e93ebcf9417567ccfda32a780" \
	"https://jenkins/job/alerts-manager/buildWithParameters?token=9GQ2A7JX24KCZ7W6&delay=0"

curl -X POST -k \
	-u "nrsup:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXX" \
	"https://jenkins/job/alerts-manager/api/xml" \
	-F "tree=name,builds[result,queueId]" -F "xpath=//build[queueId=438]"
```
