API Documentation:

* https://gist.github.com/hartsick/6f03d95e3d0aed17547a


Create a user from the command line:

curl -i -X POST -H "Content-Type:application/json" -d '{ "user": { "username": "username", "name": "this is my name", "email": "email@email.com", "password": "password1234", "password_confirmation": "password1234"}}' http://107.170.214.225/users