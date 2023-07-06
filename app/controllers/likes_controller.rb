class LikesController < ApplicationController
  include ActionView::RecordIdentifier

  before_action :authenticate_user!
  before_action :set_record

  def update
    if @record.liked_by?(current_user)
      @record.unlike(current_user)
    else
      @record.like(current_user)
    end

    render partial: "shared/likes", locals: {record: @record}
  end

  private

  def set_record
    name = params.dig(:resource).singularize
    klass = name.classify.constantize
    param_name = "#{name}_id"
    @record = klass.find(params[param_name])
  end
end
