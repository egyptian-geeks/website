# Website

A website built with ruby on rails to show group posts, analytics and other
group related content.

# Requirements

* Ruby 2.6.6
* Postgresql
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

# Deployment

`bin/deploy` script will connect to your server with ssh and execute commands on
it that pulls the repository and uses docker-compose to pull/build/stop/start
the service, usage is as follows:

```
bin/deploy user@server web
```

copy `.env.sample` file to your server and fill in the values, docker compose
file will use the path `/root/env/egygeeks` to load the file, if the env file is
not in this path feel free to change the file locally, no need to commit the
change as the script runs from your machine.
