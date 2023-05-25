# keda-sns-replicator

```
kind version
kind v0.18.0 go1.20.2 linux/amd64

kubectl version --short
Flag --short has been deprecated, and will be removed in the future. The --short output will become the default.
Client Version: v1.25.6
Kustomize Version: v4.5.7
Server Version: v1.26.3
```

Put aws credentials in:

- config/trigger-authentication.yaml
- config/values.yaml

Put aws account id in:

- config/values.yaml

Put queue and topic names in:

- config/queues.txt

Run the numbered scripts:

```
./01-first
...
./91-last
```
