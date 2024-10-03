class MainMenuController < ApplicationController
  before_action :authenticate_user!

  def index
    @patient = Patient.find_by(id: session[:selected_patient_id])
    @conditions = @patient ? @patient.conditions.order(input_day: :desc) : []
  end
end
