# Specify 6 in Docker

A simple Dockerfile and a docker-compose.yaml for running [Specify
6](https://github.com/specify/specify6)
inside of a Docker container.

```
WARNING: Not for production use!
This container is more of a proof-of-concept rather than a working
example.
This container was not optimized for production nor tested for that use
case.
Though, you are welcome to improve in and open a pull request.
```

## Installation

* Install `Docker`.
* Clone this repository.
* (Optional) Modify `docker-compose.yaml` if you need to change the
    public port or something else.
* (Optional) Put your database.sql file (as exported from
    SpBackupRestore) into `./data/database.sql`. If you don't do this,
    a demo database would be used.
* Run `docker-compose up`

## See also

Check out the [Specify 7 Docker
build](https://github.com/specify/specify7-docker/)

Also, there is a production ready Specify 7 Docker container. It is
available for all members of the [Specify Collections
Consortium](http://specifysoftware.org/). [Consider becomming a
member](https://www.specifysoftware.org/members/)
