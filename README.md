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

- We added rspec tests to models and to the users controller and arrays numbers controller

```bash
docker-compose run web rspec spec
```
o para ver informacion de los tests
```bash
docker-compose run web rspec spec --format documentation
```

# API info

- We added ArraysNumber, User, Permission and Role models. User model is used to store the information of the entities that interact with the api. Role model are associated with User and Permission models. Permissions are used to determine which endpoints a user can access

- To access a protected endpoint, the user must first make a request to the login endpoint, and pass an email and a password as inputs

```bash
Endpoint: POST localhost:3000/auth/login
Body
{
    "email": "rodfagui@gmail.com",
    "password": "123456"
}
```

- The response from the above is the authorization token with the expiration date of the token. This token is used to make all other requests of the protected endpoints

- Once the token is obtained, it must be added in the Authorization header, to make the other requests of the protected endpoints

- The ArraysNumber model saves the information of the created arrays with random numbers. To create a new arrays_number, a POST request must be made to the /arrays_numbers route and the num_of_elements of the new array must be sent

```bash
Endpoint: POST localhost:3000/arrays_numbers
Body
{
    "arrays_number": {
        "num_of_elements": 10
    }
}
```

This endpoint responds with the new instance of arrays_number created

```bash
{
    "id": 1,
    "array": "[22,6,23,1,24,18,14,21,0,9]",
    "created_at": "2022-11-09T05:07:54.929Z",
    "updated_at": "2022-11-09T05:07:54.929Z"
}
```

- TO get the longest range of an arrays_number instance, we must be a GET request to the /arrays_numbers/:id route. :id is the id of the arrays_number instance which we want to get the longest range

```bash
Endpoint: GET localhost:3000/arrays_numbers/1
```

This endpoint responds with the longest range of the arrays_number instance

```bash
{
    "longest_range": [
        21,
        24
    ]
}
```