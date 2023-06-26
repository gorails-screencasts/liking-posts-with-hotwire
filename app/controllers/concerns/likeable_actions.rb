module LikeableActions
  extend ActiveSupport::Concern

  included do
    include ActionView::RecordIdentifier

    before_action :authenticate_user!
    before_action :set_record
  end

  def update
    if @record.liked_by?(current_user)
      @record.unlike(current_user)
    else
      @record.like(current_user)
    end

    render partial: "shared/likes", locals: {record: @record}
  end

  def set_record
    name = controller_path.split("/").first.singularize
    klass = name.classify.constantize
    param_name = "#{name}_id"
    @record = klass.find(params[param_name])
  end
end