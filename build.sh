#!/bin/bash

echo "Getting dependencies"
bundle config build.nokogiri --use-system-libraries
bundle install

echo "Migrating the database"
bundle exec rake db:migrate:reset RAILS_ENV=test

echo "Linting ruby code"
bundle exec rubocop --format fuubar

echo "Running ruby specs"
bundle exec rake spec
