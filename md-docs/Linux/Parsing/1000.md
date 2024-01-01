```bash
cat > textfile << EndOfMessage
Lorem Ipsum
EndOfMessage

cat << EndOfMessage > textfile
Lorem Ipsum
EndOfMessage

tee textfile << EndOfMessage
Lorem Ipsum
EndOfMessage

cat << EndOfMessage | tee textfile
Lorem Ipsum
EndOfMessage
```
