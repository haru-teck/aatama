class MainMenuController < ApplicationController
  def index
    @patients = current_user.patients
    @patient = @patients.first # または適切な方法で選択された患者を取得
    @conditions = @patient.conditions.order(input_day: :desc) if @patient
  end
end