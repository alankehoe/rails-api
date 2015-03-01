Rails API
=========

[![Build Status](https://travis-ci.org/alankehoe/rails-api.svg?branch=master)](https://travis-ci.org/alankehoe/rails-api)
[![Dependency Status](https://gemnasium.com/alankehoe/rails-api.svg)](https://gemnasium.com/alankehoe/rails-api)

# Getting started

## 1. System setup
   
    # Install package dependencies
    brew install imagemagick

## 2. Ruby

    # Install rvm & ruby
    \curl -sSL https://get.rvm.io | bash -s stable
    rvm install ruby-2.0.0-p481

## 3. Application Setup

### Postgres
    # Install postgresql
    brew install postgresql
    
    # Init the postgres instance
    initdb /usr/local/var/postgres -E utf8
    
    # Start postgres at login
    ln -sfv /usr/local/opt/postgresql/*.plist ~/Library/LaunchAgents
    
    # Login to PostgreSQL
    psql -d template1
    
    # Create a user for the Application.
    template1=# CREATE USER application CREATEDB;
    
    # Give the user superuser privileges.
    template1=# ALTER USER application WITH SUPERUSER;
    
    # Create the development & test databases & grant all privileges
    template1=# CREATE DATABASE application_development OWNER application;
    template1=# CREATE DATABASE application_test OWNER application;
    
    # Quit the database session
    template1=# \q
    
    # Try connecting to the new database with the new user
    psql -d application_development
    
## 4. Redis
    
    # Install redis server
    brew install redis
    
    # Start redis at login
    ln -sfv /usr/local/opt/redis/*.plist ~/Library/LaunchAgents

## 5. Contributing

    # Install gems
    bundle install
    
    # Migrate the database
    bundle exec rake db:migrate RAILS_ENV=development
    
    # Seed the database
    bundle exec rake db:seed_fu

## 6. Run specs

    # Migrate the test database
    bundle exec rake db:migrate RAILS_ENV=test
    
    # ruby specs
    bundle exec rspec

## 7. Run the application

    # Start the rails server
    foreman start