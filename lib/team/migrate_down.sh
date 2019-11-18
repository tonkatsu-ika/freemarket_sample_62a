#!/bin/bash

# item_conditions
bundle exec rails db:migrate:down VERSION=20191116093954

# item
bundle exec rails db:migrate:down VERSION=20191116093819
