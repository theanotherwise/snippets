# PostgreSQL

## `psql`

```bash
psql -d dbname -h 127.0.0.1 -p 5432
```

```sql
\db+          # Tablespaces
\l+           # Databases
\dn+          # Schemas
\dt+          # Tables
\di+          # Indexes
\ds+          # Sequences     

\du+          # Users
\dg+          # Roles
\dp+          # Access Privileges

\dv+          # Viewes
\dy+          # Triggers

\dl+          # Large Objects
\dD+          # Domains

\dT+          # Data Types
\do+          # Operators
\dC+          # Casts
\dc+          # Conversions
\da+          # Aggregate Functions
```

## Dump

```bash
pg_dumpall --clean --if-exists --file dump.sql
```
