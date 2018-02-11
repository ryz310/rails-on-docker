# USAGE

1. Run following command

```
$ docker-compose run web rails new . --force --database=mysql --skip-bundle --skip-git
```

2. Modify Gemfile to uncomment `gem 'mini_racer', platforms: :ruby`

3. Run `$ docker-compose build`

4. Modify `config/database.yml` as following

```yml
default: &default
  adapter: mysql2
  encoding: utf8
  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
  username: root
  password: xxxxxx # <- Modify here.
  host: db # <- Modify here.
```

5. Run `$ docker-compose up`

6. Run `$ docker-compose exec spring spring rake db:create`

7. Open http://localhost:3000/

See http://docs.docker.jp/compose/rails.html
