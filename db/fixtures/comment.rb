require 'faker'

Comment.seed_once(:id,
  { id: 1, user_id: 5, item_id: 1, comment: Faker::Lorem.sentences },
  { id: 2, user_id: 1, item_id: 1, comment: Faker::Lorem.sentence }
)

