**Register new company**

- url: /companies
- http method: POST
- headers: Content-Type: application/json
- request body:
```javascript
{
  "company": {
    "email": "callum@polly.io",
    "password": 12345678,
    "password_confirmation": 12345678,
    "name": "Polly"
  }
}
```

Person who registed company is set to admin user and has
a users account created for them automatically.

****

**Add users to company**

- url: /team_members
- http method: POST
- headers:
		- Content-Type: application/json
		- Authorization: token of admin user
- request body:
```JSON
{
 	"team_member": {
    "email": "joe@polly.io",
    "admin_user": true
  }
}
```

`"admin_user: true"` is optional, by default it's false.
Users added to company can then create accounts (sign up)

---------------------------------------

**Sign up**

- url: /users
- http method: POST
- headers: Content-Type: application/json
- request body:
```JSON
{
  "user": {
    "email": "joe@polly.io",
    "password": 12345678,
    "password_confirmation": 12345678
  }
}
```

---------------------------------------

**Sign in**

- url: /sessions
- http method: POST
- headers: Content-Type: application/json
- request body:
```JSON
{
  "session": {
    "email": "joe@polly.io",
    "password": 12345678
  }
}
```

The `auth_token` for the session is returned in the response

---------------------------------------

**Sign out**

- url: /sessions/:user_id
- http method: DELETE
- headers: Content-Type: application/json
- request body:
```JSON
{
  "auth_token": "q-uQCjosTJ9eAnoKwmex"
}
```

---------------------------------------

**Create a project**

- url: /projects
- http method: POST
- headers:
		- Content-Type: application/json
		- Authorization: token of admin user
- request body:
```JSON
{
  "project" :{
     "title": "Some title"
  }
}
```

---------------------------------------

**Edit a project**

- url: /projects/:project_id
- http method: PUT
- headers:
		- Content-Type: application/json
		- Authorization: token of admin user
- request body:
```JSON
{
  "project" :{
     "title": "Edited title"
  }
}
```

---------------------------------------

**Delete a project**

- url: /projects/:project_id
- http method: DELETE
- headers:
		- Content-Type: application/json
		- Authorization: token of admin user

---------------------------------------
