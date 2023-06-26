module LikesHelper
  def like_button_text(record)
    record.liked_by?(current_user) ? t("unlike") : t("like")
  end
end