# Starting the Ayu(Hawa-rails / Angular-homeautomation)

## Setup Hawa-rails

* $ cd /root/Documents/Hawa-rails

* in the config/database.yml
```
development:
 adapter: postgresql
 encoding: unicode
 reconnect: false
 database: hawa_development
 pool: 5
 username: docker
 password: docker
 host: localhost
 port: 5432
 
test:
 adapter: postgresql
 encoding: unicode
 reconnect: false
 database: hawa_test
 pool: 5
 username: docker
 password: docker
 host: localhost
 port: 5432
```
* $ bundle install

* $ rake db:create

* $ rake db:migrate

* $ rake db:seed

* $ rails s -b 0.0.0.0 

## Setup Angular-homeautomation

* update the local path in app/scripts/config.js
```
angular.module('config', [])

.constant('ENV', { name: 'it', api_path: 'http://localhost:3000/' });
```

* $ cd /ayu/Documents/Angular-homeautomation

* $ npm install

* $ bower install

* $ gulp serve