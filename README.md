# USAGE

## Preparing

The base image exists on [Docker Hub](https://hub.docker.com/r/ryz310/rails-on-docker/), so you can omit this procedure.
If you want to create base image on local, run following command.

```
$ docker build -t ryz310/rails-on-docker - < base/Dockerfile
```

## Building

1. Run following command

```
$ docker-compose run --rm web rails new . --force --database=mysql --skip-bundle
```

2. Modify Gemfile to uncomment `gem 'mini_racer', platforms: :ruby`

3. Run `$ docker-compose run --rm web bundle install` or `$ docker-compose build`
  A former is not rebuild docker image but faster

4. Modify `config/database.yml` as following

```yml
default: &default
  adapter: mysql2
  encoding: utf8
  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
  username: root
  password:
  host: <%= ENV.fetch("DB_HOST", "localhost") %> # <- Modify here.
```

5. Run `$ docker-compose up -d`

6. Run `$ docker-compose exec spring spring rake db:create`

7. Open http://localhost:3000/

See http://docs.docker.jp/compose/rails.html

## Destruction

If you want to remove built environments, run following command

```
$ docker-compose down --volumes --remove-orphans
```
