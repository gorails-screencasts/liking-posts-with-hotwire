class Post < ApplicationRecord
  include Likeable

  has_many :likes, as: :record
end
