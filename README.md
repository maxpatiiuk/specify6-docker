# Specify 6 in Docker

A dockerized version of [Specify6](https://github.com/specify/specify6)

```
WARNING: Not for production use!
This container is more of a proof-of-concept rather than a working
example.
This container was not optimized for production nor tested for that use
case.
Though, you are welcome to improve in and open a pull request.
```

## Installation

- Install `Docker` and `Docker Compose`.
- Clone this repository.
- (Optional) Modify `docker-compose.yaml` if you need to change the public port
  or something else.
- (Optional) Put your database.sql file (as exported from SpBackupRestore) into
  `./data/database.sql`. If you don't do this, a demo database would be used.
- Run `docker-compose up`
- An Ubuntu container with Specify6 on it becomes available at
  [http://localhost:6080/](http://localhost:6080/). To access it, just open the
  terminal and execute `/opt/Specify/bin/Specify`. Other binaries are located in
  `/opt/Specify/bin` too. Keep in mind that you would have to type `db` into the
  `Server` field when starting up Specify 6 for the first time.

## See also

Check out the
[Specify 7 Docker build](https://github.com/specify/specify7-docker/)

Also, there is a production ready Specify 7 Docker container. It is available
for all members of the
[Specify Collections Consortium](http://specifysoftware.org/).
[Consider becoming a member](https://www.specifysoftware.org/members/)

## Advanced configuration

If you have an existing MySQL/MariaDB server, you can expose that port the
Specify 6 container by adding it to `docker-compose.yml`.
[See more info](https://stackoverflow.com/a/24326540/8584605).

Additionally, if you want Specify 6 to query your own versions of
`files.specifysoftware.org` and `update.specifysoftware.org`, there is an
`overwrite` branch that allows to do that. Normally these domains are accessed
by Specify 6 to query for updates and fetch additionally files, like
Geography/Taxon trees. Overwriting default servers may be useful for
testing/development purposes.
