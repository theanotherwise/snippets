```bash
# Raw Hex Dump
xxd -p file

# 2 Bytes per Row
xxd -c 2 file

# Print First 2 Bytes
xxd -l 2 file

# Start from 5 Byte
xxd -s 4 file
```

```bash
AAA_FILE="aaa.bin"
BBB_FILE="bbb.bin"
CCC_FILE="ccc.bin"
DDD_FILE="ddd.bin"

echo "111222333" > "${AAA_FILE}"
echo "444555666777888999" > "${BBB_FILE}"

AAA_LEN="$(wc -c < ${AAA_FILE})"
BBB_LEN="$(wc -c < ${BBB_FILE})"

echo "'${AAA_FILE}' -> '${AAA_LEN}'"
echo "'${BBB_FILE}' -> '${BBB_LEN}'"

cat "${AAA_FILE}" >> "${CCC_FILE}"
cat "${BBB_FILE}" >> "${CCC_FILE}"

dd if="${CCC_FILE}" of="${DDD_FILE}" bs=1 count="${BBB_LEN}" skip=${AAA_LEN}

diff "${DDD_FILE}" "${BBB_FILE}"

echo "${?}"
```
