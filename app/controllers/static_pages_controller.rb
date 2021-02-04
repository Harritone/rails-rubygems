class StaticPagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:landing_page]
  def landing_page
    @courses_pop = Course.limit(3)
    @courses_top = Course.limit(3)
    @courses_latest = Course.all.order(created_at: :desc).limit(3)
  end

  def privacy_policy
  end

  def activity
    @activities = PublicActivity::Activity.all
  end
end
