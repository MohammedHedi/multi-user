$ cd multi-user
$ docker build -t auth:test .                                                                 
$ docker run -d --rm -p 3600:3600 -p 3000:3000 --name auth-test -v .:/app -v /app/node_modules -v /app/client/node_modules auth:test
launch your brower at http://localhost:3000/login
