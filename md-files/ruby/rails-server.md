```bash
rails db:migrate RAILS_ENV="production"

rails server \
    --using puma \
    --environment production \
    --binding 0.0.0.0 \
    --port 3000
```
