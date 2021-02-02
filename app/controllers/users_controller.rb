class UsersController < ApplicationController
  # @q = Person.ransack(params[:q])
  # @people = @q.result(distinct: true)
  def index
    # @users = User.all.order(created_at: :desc)
    @q = User.ransack(params[:q])
    @users = @q.result(distinct: true)
  end
end