```bash
STORE_NAME=""
CONTAINER_NAME=""
ACCOUNT_NAME=""
ACCOUNT_KEY=""
START_DATE=`date +"%Y-%m-%d"`
END_DATE=$(date -d "`date +'%Y-%m-%d'` 1 month" +%Y-%m-%d)

echo "${START_DATE}"
echo "${END_DATE}"

SAS_TOKEN=$(az storage container generate-sas \
--name "${CONTAINER_NAME}" \
--account-name "${ACCOUNT_NAME}" \
--account-key "${ACCOUNT_KEY}" \
--start "${START_DATE}" \
--expiry "${END_DATE}" \
--permissions acdlrw \
--output tsv)

echo "${SAS_TOKEN}"

azcopy copy filt.txt "https://${STORE_NAME}.blob.core.windows.net/${CONTAINER_NAME}?${SAS_TOKEN}"
```
