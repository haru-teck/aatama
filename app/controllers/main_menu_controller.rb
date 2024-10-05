class MainMenuController < ApplicationController
  def index
    if params[:patient_id]
      session[:selected_patient_id] = params[:patient_id]
    end
    @selected_patient = Patient.find_by(id: session[:selected_patient_id])
    @patients = current_user.patients
    @conditions = @selected_patient ? @selected_patient.conditions.order(input_day: :desc) : []
    
    # 患者が選択されている場合、その患者の情報をビューに渡す
    if @selected_patient
      @patient_info = {
        name: @selected_patient.name,
        furigana: @selected_patient.furigana,
        birthday: @selected_patient.birthday,
        gender: @selected_patient.gender
      }
    end
  end

  def route_not_found
    render file: Rails.public_path.join('404.html'), status: :not_found, layout: false
  end
end