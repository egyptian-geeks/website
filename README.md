# Website

A website built with ruby on rails to show group posts, analytics and other
group related content.

![ScreenShot](app/assets/images/screenshot.png?raw=true "ScreenShot")

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
  rails db:setup posts:import
  ```

# How it is generated

The following command was used to generate project files

```
rails new website --database=sqlite3 --skip-action-mailer --skip-spring --skip-action-cable --skip-coffee --skip-test
```

# Deployment

With every push to github master branch a docker hub will build an image
[egygeeks/website](https://hub.docker.com/r/egygeeks/website/)

## Prerequisite

* Generate a secret to use it for rails encryption


  ```shell
  rails secret
  ```

* Export the generated secret to your local machine shell, add the following to
  `~/.bashrc` or `~/.bash_profile`

  ```shell
  export EGYGEEKS_SECRET_KEY_BASE=<generated secret>
  ```

* Make sure your variable is defined, the following command should print the secret

  ```shell
  echo $EGYGEEKS_SECRET_KEY_BASE
  ```

## Deployment

* `bin/deploy` can pull, stop container then run new docker image, you need to
  pass your server IP to it

  ```shell
  bin/deploy user@server-ip
  ```

* `deploy` is 3 lines lines script:
  * pulls the image
  * stop old container
  * start new container forwarding port 3000 from inside the container to port
    10001
* the container port 10001 is listening to local requests so it's not exposed to
  the internet
* You have to configure your http server to forward requests to that port.
