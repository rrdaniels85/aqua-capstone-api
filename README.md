[![General Assembly Logo](https://camo.githubusercontent.com/1a91b05b8f4d44b5bbfb83abac2b0996d8e26c92/687474703a2f2f692e696d6775722e636f6d2f6b6538555354712e706e67)](https://generalassemb.ly/education/web-development-immersive)

# Aquarium Tracker API README

This application is targeted at aquarium enthusiasts. It allows them, after signing in, to create multiple tanks with attributes. The user can then keep an inventory of the animals that they keep in their tanks (ex. fish, snails, etc.). This allows them to keep their aquariums more organized.

## Application URL Section
-   [Client-side Repository](https://github.com/rrdaniels85/aqua-capstone-client)
-   [Deployed Client App](https://rrdaniels85.github.io/aqua-capstone-client/)
-   [Deployed API](https://still-castle-88480.herokuapp.com/)

## Aquarium Tracker Application ERD

Before: For my project, my main objectives include the user, tank, and animals relationships.
However, if time permits, I will add a note/log relationship as well to tanks as depicted in this ERD. This additional relationship is a stretch objective.

![alt text](http://i.imgur.com/fGAiYtm.jpg)

Follow Up: I was able to include the user, tank and animal relationships as I had planned. Due to time constraints, I was unable to meet the stretch objective and did not include the note/log relationship.

## Technologies Used

For this application, I built my API using Ruby on Rails as my back-end framework and postgresql for my database.

## General Approach

**Planning:**
Once I had decided on my main project theme and functionality, I created an ERD to reflect how I wanted to structure my back-end. In my initial planning, I included two non-user resources as my main goal and included on additional resource as a stretch goal. My resources were two has_many relationship. A user has many tanks and a tank has many animals.

**Execution:**
The first resource, tanks, was relatively straightforward. It was a direct has_many/belongs_to relationship. I had done this in the past. As a result, I was able to get this functionality working relatively quickly. I then tested the CRUD functionality with CURL requests.

The bigger challenge came when I added the second table to the API. I had never done a second has_many relationship before. As a result, it took additional effort and experimentation to develop
a controller that worked for my purposes for the animals resource. Once I was comfortable with my animals controller, I also tested this on the back end with CURL requests.

## Unsolved Problems

When I first began my project, I created a stretch goal of trying to create an additional resource of notes/maintenance logs that the user could keep for each tank. However, due to time constraints, I was unable to incorporate this. If given more time, I would like to add this additional resource because I think it would be of value to the end user. It was definitely a struggle figuring out the controller for the second has_many relationship (tank to animals) but now that I have it figured out I think I could use that same basic format for the notes/maintenance logs.

## Dependencies

Install with `bundle install`.

-   [`rails-api`](https://github.com/rails-api/rails-api)
-   [`rails`](https://github.com/rails/rails)
-   [`active_model_serializers`](https://github.com/rails-api/active_model_serializers)
-   [`ruby`](https://www.ruby-lang.org/en/)
-   [`postgres`](http://www.postgresql.org)

## API Routes

### TANKS

| Verb   | URI Pattern            | Controller#Action |
|--------|------------------------|-------------------|
| POST   | `/tanks`               | `tanks#create`    |
| GET    | `/tanks`               | `tanks#index`     |
| SHOW   | `/tanks/:id`           | `users#show`      |
| PATCH  | `/tanks/:id`           | `tanks#update`    |
| DELETE | `/tanks/:id`           | `tanks#destroy`   |

### ANIMALS

| Verb   | URI Pattern              | Controller#Action |
|--------|--------------------------|-------------------|
| POST   | `/tanks/:id/animals`     | `animals#create`  |
| GET    | `/tanks/:id/animals`     | `animals#index`   |
| PATCH  | `/tanks/:id/animals/:id` | `animals#update`  |
| DELETE | `/tanks/:id/animals/:id` | `animals#destroy` |

### Authentication

| Verb   | URI Pattern            | Controller#Action |
|--------|------------------------|-------------------|
| POST   | `/sign-up`             | `users#signup`    |
| POST   | `/sign-in`             | `users#signin`    |
| PATCH  | `/change-password/:id` | `users#changepw`  |
| DELETE | `/sign-out/:id`        | `users#signout`   |


#### POST /sign-up

Request:

```sh
curl http://localhost:4741/sign-up \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --data '{
    "credentials": {
      "email": "'"${EMAIL}"'",
      "password": "'"${PASSWORD}"'",
      "password_confirmation": "'"${PASSWORD}"'"
    }
  }'
```

```sh
EMAIL=ava@bob.com PASSWORD=hannah scripts/sign-up.sh
```

Response:

```md
HTTP/1.1 201 Created
Content-Type: application/json; charset=utf-8

{
  "user": {
    "id": 1,
    "email": "ava@bob.com"
  }
}
```

#### POST /sign-in

Request:

```sh
curl http://localhost:4741/sign-in \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --data '{
    "credentials": {
      "email": "'"${EMAIL}"'",
      "password": "'"${PASSWORD}"'"
    }
  }'
```

```sh
EMAIL=ava@bob.com PASSWORD=hannah scripts/sign-in.sh
```

Response:

```md
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

{
  "user": {
    "id": 1,
    "email": "ava@bob.com",
    "token": "BAhJIiVlZDIwZTMzMzQzODg5NTBmYjZlNjRlZDZlNzYxYzU2ZAY6BkVG--7e7f77f974edcf5e4887b56918f34cd9fe293b9f"
  }
}
```

#### PATCH /change-password/:id

Request:

```sh
curl --include --request PATCH "http://localhost:4741/change-password/$ID" \
  --header "Authorization: Token token=$TOKEN" \
  --header "Content-Type: application/json" \
  --data '{
    "passwords": {
      "old": "'"${OLDPW}"'",
      "new": "'"${NEWPW}"'"
    }
  }'
```

```sh
ID=1 OLDPW=hannah NEWPW=elle TOKEN=BAhJIiVlZDIwZTMzMzQzODg5NTBmYjZlNjRlZDZlNzYxYzU2ZAY6BkVG--7e7f77f974edcf5e4887b56918f34cd9fe293b9f scripts/change-password.sh
```

Response:

```md
HTTP/1.1 204 No Content
```

#### DELETE /sign-out/:id

Request:

```sh
curl http://localhost:4741/sign-out/$ID \
  --include \
  --request DELETE \
  --header "Authorization: Token token=$TOKEN"
```

```sh
ID=1 TOKEN=BAhJIiVlZDIwZTMzMzQzODg5NTBmYjZlNjRlZDZlNzYxYzU2ZAY6BkVG--7e7f77f974edcf5e4887b56918f34cd9fe293b9f scripts/sign-out.sh
```

Response:

```md
HTTP/1.1 204 No Content
```

### Users

| Verb | URI Pattern | Controller#Action |
|------|-------------|-------------------|
| GET  | `/users`    | `users#index`     |
| GET  | `/users/1`  | `users#show`      |

#### GET /users

Request:

```sh
curl http://localhost:4741/users \
  --include \
  --request GET \
  --header "Authorization: Token token=$TOKEN"
```

```sh
TOKEN=BAhJIiVlZDIwZTMzMzQzODg5NTBmYjZlNjRlZDZlNzYxYzU2ZAY6BkVG--7e7f77f974edcf5e4887b56918f34cd9fe293b9f scripts/users.sh
```

Response:

```md
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

{
  "users": [
    {
      "id": 2,
      "email": "bob@ava.com"
    },
    {
      "id": 1,
      "email": "ava@bob.com"
    }
  ]
}
```

#### GET /users/:id

Request:

```sh
curl --include --request GET http://localhost:4741/users/$ID \
  --header "Authorization: Token token=$TOKEN"
```

```sh
ID=2 TOKEN=BAhJIiVlZDIwZTMzMzQzODg5NTBmYjZlNjRlZDZlNzYxYzU2ZAY6BkVG--7e7f77f974edcf5e4887b56918f34cd9fe293b9f scripts/user.sh
```

Response:

```md
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

{
  "user": {
    "id": 2,
    "email": "bob@ava.com"
  }
}
```

### Reset Database without dropping

This is not a task developers should run often, but it is sometimes necessary.

**locally**

```sh
bin/rake db:migrate VERSION=0
bin/rake db:migrate db:seed db:examples
```

**heroku**

```sh
heroku run rake db:migrate VERSION=0
heroku run rake db:migrate db:seed db:examples
```

## [License](LICENSE)

1.  All content is licensed under a CC­BY­NC­SA 4.0 license.
1.  All software code is licensed under GNU GPLv3. For commercial use or
    alternative licensing, please contact legal@ga.co.
