class MainMenuController < ApplicationController
  def index
    @patient = current_user.patients.first
    @conditions = @patient.conditions.order(input_day: :desc) if @patient
  end
end