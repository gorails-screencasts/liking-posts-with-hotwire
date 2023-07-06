class Comment < ApplicationRecord
  include Likeable

  belongs_to :user
end
