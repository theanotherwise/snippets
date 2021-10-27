* ### [Columns Formating](md-files/columns-formating.md)


```bash
cat file.txt | sort | uniq
cat file.txt | sort | uniq -c 
```

```bash
cat /etc/passwd | tail -n +3                      # without first two line

cat /etc/passwd  | head -n -2                     # without last two line
```

```bash

```

```bash
echo "Seems Cloud" | sed "s/Seems/sEEMS/g"
echo "Seems Cloud" | sed "s|Seems|sEEMS|g"
```

```bash
alias urlencode='python2 -c "import urllib, sys; print urllib.quote(sys.argv[1] if len(sys.argv) > 1 else sys.stdin.read()[0:-1])"'
alias urldecode='python2 -c "import urllib, sys; print urllib.unquote(sys.argv[1] if len(sys.argv) > 1 else sys.stdin.read()[0:-1])"'
```

```bash
alias urlencode='python3 -c "from urllib import parse; import sys; print(parse.quote(sys.argv[1] if len(sys.argv) > 1 else sys.stdin.read()[0:-1]))"'
alias urldecode='python3 -c "from urllib import parse; import sys; print(parse.unquote(sys.argv[1] if len(sys.argv) > 1 else sys.stdin.read()[0:-1]))"'
```
