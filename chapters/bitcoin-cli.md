```bash
watch -n 1 'echo `bitcoin-cli getblockchaininfo | grep -Po "headers\": \K[0-9]*"`-`bitcoin-cli getblockcount`| bc'
```
