# README

https://www.linkedin.com/in/jordan-f-beck/

- Ruby and Rails version 

Ruby 2.5.3

Rails 5.2.5

- System dependencies

Active Record
Active_designer
Ruby on Rails
RSpec
Factory Bot
Simplecov
Faker

- Configuration

git fork and clone form here https://github.com/jordanfbeck0528/rails_engine

download this - https://raw.githubusercontent.com/turingschool/backend-curriculum-site/gh-pages/module3/projects/rails_engine/rails-engine-development.pgdump

bundle install
rails db:drop
rails db:create
rails db:migrate
rails db:seed

- How to run the test suite

bundle exec rspec

- Services (job queues, cache servers, search engines, etc.)

Search for one merchant by name, or many items by name or price(low and/or high)

- check it out

rails s

in the browser

http://localhost:3000/api/v1/items

http://localhost:3000/api/v1/merchants

http://localhost:3000/api/v1/items/find_all?min_price=201&max_price=599

http://localhost:3000/api/v1/merchants/find?name=thisshouldnotexit


Here is a screenshot of my relationships in active_designer.

![Screen Shot 2021-04-08 at 5 37 18 PM](https://user-images.githubusercontent.com/68141454/114122938-88b18980-98ae-11eb-92ba-93c2a8a16789.png)
