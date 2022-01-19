== README==

create new file in config with name "database.yml"
Copy contents from database.example.yml to database.yml

create .env from .env.example

to run db migratation scripts
bin/rake db:migrate

to reset Db, run 
bin/rake db:reset

Install dependencies  by running following command
bundle install

To run the project-> 
bin/rails server -b 0.0.0.0


This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
    2.3.5


* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


Please feel free to use a different markup language if you do not plan to run
<tt>rake doc:app</tt>.
