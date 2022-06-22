# Docker compose setup

## Getting started

- Make sure to have the 'tests' directory as root

- Build the containers

```bash
docker-compose up --build
```

- Once detached from the container CLI, run the following commands in the root directory to create the environments databases, run migrations and run seeds

```bash
docker-compose run web rake db:create
docker-compose run web rake db:migrate
docker-compose run web rake db:seed
```
