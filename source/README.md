# Development Setup

Install and switch to ruby version `2.6.6`

Run following commands on terminal
* `cd source && bundle install`
* `bundle exec rake db:create db:migrate db:seed`
* `bundle exec rails s`

App can be browsed on http://localhost:3000
* Charges -> http://localhost:3000/charges
* Customers -> http://localhost:3000/customers
* Transactions -> http://localhost:3000/transactions

The tests specified in rails challenge can be run with
* `bundle exec rspec spec/views/charges/index.html.erb_spec.rb`
