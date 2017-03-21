# Jungle

A mini e-commerce application built with Rails 4.2 for purposes of teaching Rails by example.

## Online Version
This is [Jungle Online Version](https://calm-chamber-47452.herokuapp.com).

## Contributes for this project
We worked with this application, and contribute to create an admin category section, create models to user and reviews and views as well. We created an signup page and login too. We formarted a mailer to order receipt.

## Instructions to test orders
For test order follow the strip instructions [Test Card] (https://stripe.com/docs/testing).

## Setup

1. Fork & Clone
2. Run `bundle install` to install dependencies
3. Create `config/database.yml` by copying `config/database.example.yml`
4. Create `config/secrets.yml` by copying `config/secrets.example.yml`
5. Run `bin/rake db:reset` to create, load and seed db
6. Create .env file based on .env.example
7. Sign up for a Stripe account
8. Put Stripe (test) keys into appropriate .env vars
9. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
