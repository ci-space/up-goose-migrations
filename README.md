# up-goose-migrations

Action for up migrations via [goose](https://github.com/pressly/goose).

Action based on [gomicro/goose](https://github.com/gomicro/docker-goose) Docker image.

Inputs:

| Input  | Description                                     | Required | Default      |
|--------|-------------------------------------------------|----------|--------------|
| dsn    | Data source name                                | true     | =            |
| driver | Database driver                                 | false    | postgres     |
| dir    | Relative path to directory with migration files | false    | ./migrations |

## Usage example

This example runs migrations and generate documentation via [db-exporter](https://github.com/ArtARTs36/db-exporter/)

```yaml
name: Generate documentation

permissions: write-all

on:
  workflow_call:

jobs:
  gen-md:
    services:
      postgres:
        image: postgres:12
        env:
          POSTGRES_USER: test
          POSTGRES_PASSWORD: test
          POSTGRES_DB: db
        ports:
          - 5432:5432
        options: >-
          --health-cmd pg_isready
          --health-interval 10s
          --health-timeout 5s
          --health-retries 5

    runs-on: ubuntu-latest
    steps:
      - name: Checkout Source
        uses: actions/checkout@v3

      - name: Run migrations
        uses: ci-space/up-goose-migrations@master
        with:
          dsn: "host=postgres user=test password=test dbname=db sslmode=disable"

      - name: Generate markdown docs
        uses: artarts36/db-exporter@master
        env:
          PG_DSN: "host=localhost port=5432 user=test password=test dbname=db sslmode=disable"
        with:
          tasks: ci-gen-docs
```
