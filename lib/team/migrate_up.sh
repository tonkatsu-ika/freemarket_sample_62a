#!/bin/bash

# item_conditions
bundle exec rails db:migrate:up VERSION=20191116093954

# items 
bundle exec rails db:migrate:up VERSION=20191116093819
