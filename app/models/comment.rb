class Comment < ApplicationRecord
  include Likeable

  belongs_to :user
  has_many :likes, as: :record
end
