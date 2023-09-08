# Менеджер задач на ruby on rails 7
### а-ля Trello на минималках

## В проекте используется:
* Ruby 3.2.2
* Rails 7.0.4
* sqlite3 (для разработки)
* Node JS 16.19.0
* Yarn 1.22.19


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

4. Создать базу данных для проекта и накатить миграции

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
