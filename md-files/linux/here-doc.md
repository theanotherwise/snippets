```bash
cat > textfile << EndOfMessage
Lorem Ipsum
EndOfMessage
```

```bash
cat << EndOfMessage > textfile
The variable will not be interpreted.
EndOfMessage
```
