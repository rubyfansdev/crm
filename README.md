# Менеджер задач на ruby on rails 7

### а-ля Trello на минималках

## В проекте используется:

- Ruby 3.2.2
- Rails 7.0.4
- PostgreSQL 16
- Node JS 16.19.0
- Yarn 1.22.19
- Docker compose v2

### Разработка ведётся по методологии [git-flow](http://danielkummer.github.io/git-flow-cheatsheet/index.ru_RU.html)

- feature branch делать от develop

## Запуск проекта по классике

1. Настроить локальное окружение (Ruby etc.)
2. Скачать или склонировать репозиторий
3. Запустить bundler и yarn для установки нужных гемов и зависимостей

```sh
bundle
```

```sh
yarn
```

4. Создать `.env` файл по примеру `.env.example`

```sh
cp .env-example .env
```

5. Запустить сервисы с помощью `docker`

```sh
docker compose -f docker-compose-services.yml up
```

6. Создать базу данных для проекта и накатить миграции

```sh
rails db:create
```

```sh
rails db:migrate
```

5. Запустить рельсу и вотчеры

```sh
bin/dev
```
