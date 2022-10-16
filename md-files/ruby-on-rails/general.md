`API Only`
```bash
rails new terenowe-info \
    --database=postgresql --api --no-minimal \
    --skip-test --skip-system-test \
    --skip-javascript --skip-asset-pipeline --skip-hotwire \
    --skip-bootsnap --skip-jbuilder --skip-bundle \
    \
    --no-skip-git --no-skip-keeps \
    --no-skip-action-mailer --no-skip-action-mailbox \
    --no-skip-active-storage --no-skip-active-record \
    --no-skip-active-job --no-skip-action-text \
    --no-skip-action-cable \
    \
    --no-skip --no-quiet
```

```bash
gem update
```
