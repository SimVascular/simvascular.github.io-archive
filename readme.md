### Simvascular Website Project

Fist, you need to install the following components:

```
$ sudo apt-get install ruby ruby-dev
$ sudo apt-get install nodejs
$ gem install bundler (may prompt for password for sudo access)
$ bundle install (get dependencies)
```

To start a webserver and see the site in developer mode through any web browser type:

```
$ bundle exec middleman server (for development)
```

To generate the production website type:

```
$ bundle exec middleman build (build for deployment)
```

To view the site through the webserver:

```
http://0.0.0.0:4567/ - view the website
```
