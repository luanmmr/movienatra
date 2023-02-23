### Movienatra

This app records movies name to a file called **movie.yml** which is in the root directory.


\- **Routes**
`GET` `/movies`
Show all recorded movies in the file

`GET` `/movies/new`
Page to fill the fields to record movie

`GET` `/movies/:id`
Show movie details

\- **Docker**
Run this app inside docker container without needing to install locally.

Execute:

1. `docker-compose up -d`



