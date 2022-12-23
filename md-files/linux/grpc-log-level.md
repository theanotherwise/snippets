```bash
export GRPC_GO_LOG_VERBOSITY_LEVEL=99
export GRPC_GO_LOG_SEVERITY_LEVEL=info
```

```bash
grpcurl -plaintext -d '{\"name\":\"World\", \"message\": \"Hello\"}' localhost:80 helloworld.Greeter/SayHello
```
