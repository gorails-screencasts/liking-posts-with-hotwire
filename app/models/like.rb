class Like < ApplicationRecord
  belongs_to :user
  belongs_to :record, polymorphic: true, counter_cache: true
end
