```bash
ACCOUNT_NAME="XXXXX"
CONTAINER_NAME="XXXXX"
ACCOUNT_KEY="XXXXX"
START_DATE=`date +"%Y-%m-%d"`
END_DATE=$(date -d "`date +'%Y-%m-%d'` 1 month" +%Y-%m-%d)

SAS_TOKEN=$(az storage container generate-sas \
--name "${CONTAINER_NAME}" \
--account-name "${ACCOUNT_NAME}" \
--account-key "${ACCOUNT_KEY}" \
--start "${START_DATE}" \
--expiry "${END_DATE}" \
--permissions acdlrw \
--output tsv)

echo "${SAS_TOKEN}"
```

```bash
./azcopy copy NOTICE.txt "https://${ACCOUNT_NAME}.blob.core.windows.net/${CONTAINER_NAME}?${SAS_TOKEN}" \
  --blob-type=BlockBlob
```
