# Website

A website built with ruby on rails to show group posts, analytics and other
group related content.

# Requirements

* Ruby 2.5.0
* SQlite3
* Nodejs
* npm
* Yarn

# Installation

* Install bundler

  ```shell
  gem install bundler
  ```
* Install dependencies

  ```shell
  bundle install
  yarn install
  ```
* import posts, it assumes `posts` project is cloned in the same directory as this project

  ```shell
  rails posts:import
  ```

# How it is generated

The following command was used to generate project files

```
rails new website --database=sqlite3 --skip-action-mailer --skip-spring --skip-action-cable --skip-coffee --skip-test
```
