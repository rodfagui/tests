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

# Run tests

- We added rspec tests to models and to the client controller

```bash
docker-compose run web rspec spec
```
o para ver informacion de los tests
```bash
docker-compose run web rspec spec --format documentation
```

# API info

- We added Client, User, Permission and Role models. User model is used to store the information of the entities that interact with the api. Role model are associated with User and Permission models. Permissions are used to determine which endpoints a user can access

- To access an endpoint, the user must first make a request to the login endpoint, and pass an email and a password as inputs

```bash
Endpoint: POST localhost:3000/auth/login
Body
{
    "email": "rodfagui@gmail.com",
    "password": "123456"
}
```

- The response from the above is the authorization token with the expiration date of the token. This token is used to make all other requests

- Once the token is obtained, it must be added in the Authorization header, to make the other requests

- The Client model saves the information of the clients, names and phone numbers. To get all list of clientes a GET request must be made to the /clients route

```bash
Endpoint: GET localhost:3000/clients
Headers
  Authorization: "dadada912321jasdj"
```

- To access the clients create endpoint, a POST request must be made to the /clients route and the name and telephone number of the client must be sent. The name must always exist and the phone number must also be present and be a 10-digit numeric field

```bash
Endpoint: POST localhost:3000/clients
Body
{
    "name": "Rodman Aguirre",
    "phone_number": "1234567890"
}
Headers
  Authorization: "dadada912321jasdj"
```
