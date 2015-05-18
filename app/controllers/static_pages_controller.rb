class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @activities = current_user.activities.order created_at: :desc
    end
  end
end
