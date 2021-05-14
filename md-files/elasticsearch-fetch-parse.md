```bash
#!/bin/bash
 
export DATE_START="2021-05-06T00:15:00Z"
export DATE_END="2021-05-06T02:30:00Z"
 
export DATE_ITER="${DATE_START}"
export DATE_OFFSET="5"
 
STOP_CONDITION="CONTINUE"
 
FILE_TEMPLATE="fetch-template"
 
echo > "${FILE_TEMPLATE}.parsed"
 
while [[ "${STOP_CONDITION}" != "STOP" ]] ; do
  LOOP_BEGIN="${DATE_ITER}"
  DATE_ITER="`python3 -c 'import datetime, os; print((datetime.datetime.strptime(os.getenv("DATE_ITER"), "%Y-%m-%dT%H:%M:%SZ") + datetime.timedelta(minutes = int(os.getenv("DATE_OFFSET")))).strftime("%Y-%m-%dT%H:%M:%SZ"))'`"
  LOOP_END="${DATE_ITER}"
   
  echo "${LOOP_BEGIN} ${LOOP_END}"
   
  ##############################################
  # END SCRIPT
  #################
   
  cat "${FILE_TEMPLATE}.sh.sed" | sed "s/DATE_START/${LOOP_BEGIN}/g" | sed "s/DATE_END/${LOOP_END}/g" > "${FILE_TEMPLATE}.sh"
   
  /bin/bash "${FILE_TEMPLATE}.sh" | grep -Po "example_field\":\"\K[a-zA-Z0-9_\-]*" >> "${FILE_TEMPLATE}"
   
  rm -f "${FILE_TEMPLATE}.sh"
   
  #################
  # START SCRIPT
  ##############################################
   
  STOP_CONDITION="`python3 -c 'import datetime, os; print("STOP") if datetime.datetime.strptime(os.getenv("DATE_ITER"), "%Y-%m-%dT%H:%M:%SZ").strftime("%Y-%m-%dT%H:%M:%SZ") >= datetime.datetime.strptime(os.getenv("DATE_END"), "%Y-%m-%dT%H:%M:%SZ").strftime("%Y-%m-%dT%H:%M:%SZ") else print("CONTINUE")'`"
done
```

````bash
#!/bin/bash

curl 'https://elasticsearch:9200/example-indice-*/_search' \
-H 'content-type: application/json' \
-d $'{
  "size": 10000,
  "query": {
    "bool": {
      "filter": [{
          "bool": {
            "should": [{
                "match_phrase": {
                  "msg": "messsssssssage"}}]}},{
          "range": {
            "@timestamp": {
              "gte": "DATE_START",
              "lte": "DATE_END"}}}]}},
  "timeout": "60000ms"
}' --silent
```

```bash
#!/bin/bash
 
FILE_TEMPLATE="parse-template"
 
echo > "${FILE_TEMPLATE}.parsed"
 
INC=0
 
while mapfile -t -n 6 ary && ((${#ary[@]})); do
  echo -e "----\nSearching next $INC\n"
 
  ##############################################
  # END SCRIPT
  #################
   
  cat parse-template.sh.sed | sed "s/ELEM01/${ary[0]}/g" | sed "s/ELEM02/${ary[1]}/g" | sed "s/ELEM03/${ary[2]}/g" | sed "s/ELEM04/${ary[3]}/g" | sed "s/ELEM05/${ary[4]}/g" | sed "s/ELEM06/${ary[5]}/g" > "${FILE_TEMPLATE}.sh"
   
  /bin/bash "${FILE_TEMPLATE}.sh" | grep -Po "duid\":\"\K[a-zA-Z0-9\-\_]*" >> "${FILE_TEMPLATE}.parsed"
   
  rm -f "${FILE_TEMPLATE}.sh"
   
  #################
  # START SCRIPT
  ##############################################
   
  ((INC=INC+6))
done < fetch-template.parse
```

```bash
#!/bin/bash

curl 'https://elasticsearch:9200/logstash-access-*/_search' \
-H 'content-type: application/json' \
-d $'{
  "size": 10000,
  "query": {
    "bool": {
      "filter": [{
          "bool": {
            "should": [{
                "bool": {
                  "should": [{
                      "match_phrase": {
                        "message": "ELEM01"}}]}},{
                "bool": {
                  "should": [{
                      "match_phrase": {
                        "message": "ELEM02"}}]}},{
                "bool": {
                  "should": [{
                      "match_phrase": {
                        "message": "ELEM03"}}]}},{
                "bool": {
                  "should": [{
                      "match_phrase": {
                        "message": "ELEM04"}}]}},{
                "bool": {
                  "should": [{
                      "match_phrase": {
                        "message": "ELEM05"}}]}},{
                "bool": {
                  "should": [{
                      "match_phrase": {
                        "message": "ELEM06"}}]}}]}},{
          "range": {
            "@timestamp": {
              "gte": "2021-05-06T00:00:00.000Z",
              "lte": "2021-05-06T02:30:00.000Z"}}}]}},
  "timeout": "60000ms"
}' --silent
```
