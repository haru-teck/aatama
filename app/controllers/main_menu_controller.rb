class MainMenuController < ApplicationController
  def index
    @selected_patient = Patient.find_by(id: session[:selected_patient_id])
    @patients = current_user.patients
    @conditions = @selected_patient ? @selected_patient.conditions.order(input_day: :desc) : []
  end

  def route_not_found
    render file: Rails.public_path.join('404.html'), status: :not_found, layout: false
  end
end