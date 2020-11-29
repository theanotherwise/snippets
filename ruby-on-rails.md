# Ruby on Rails

```yml
default: &default
  adapter: postgresql
  encoding: utf-8
  port: 5432
  database: rails
  schema_search_path: public
  username: rails
  password: <%= ENV.fetch("RAILS_DB_PASSWORD") { 'rails' } %>
  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>

development:
  <<: *default
  host: 172.18.0.11

production:
  <<: *default
  host: 172.18.0.10
```
