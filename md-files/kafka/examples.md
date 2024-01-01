```bash
# MD5 (0) Benchmark
hashcat -b -m 0
```

```bash
# mask
hashcat -m 0 -a 3 615af8e453b4bee217e7727cffb1739d -1 ?l?d?u ?1?1?1?1?1?1?1?1

# wordlist + mask
hashcat -m 0 d2bfcff1fc4cd2782cb4a32f7fe001c2 -a 6 wordlist.txt -1 ?l?d?u ?1?1?1?1

# mask + worklist
hashcat -m 0 855548ab91ca29030eab87bf4bbc80bd -a 7 -1 ?l?d?u ?1?1?1?1 wordlist.dict
```

```bash
./mp64.bin -1 ?d?u?l ?1?1?1?1?1?1
```
