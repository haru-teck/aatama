class MainMenuController < ApplicationController
  def index
    @user = User.find_by(id: session[:selected_user_id]) || User.first
    @conditions = @user.conditions.order(input_day: :desc) if @user
  end
end
