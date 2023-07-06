module Likeable
  extend ActiveSupport::Concern

  included do
    has_many :likes, as: :record
  end

  def liked_by?(user)
    likes.where(user: user).any?
  end

  def like(user)
    likes.where(user: user).first_or_create
  end

  def unlike(user)
    likes.where(user: user).destroy_all
  end
end
