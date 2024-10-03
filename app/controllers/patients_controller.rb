class PatientsController < ApplicationController
  before_action :set_patient, only: [:edit, :update, :destroy, :select]
  
  def index
    @patients = Patient.all
    @patient = Patient.new
  end

  def new
    @patient = Patient.new
  end

  def create
    @patient = current_user.patients.build(patient_params)
    if @patient.save
      redirect_to patients_path, notice: '患者を登録しました。'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @patient.update(patient_params)
      redirect_to patients_path, notice: '患者情報が更新されました'
    else
      render :edit
    end
  end

  def destroy
    @patient.destroy
    redirect_to patients_path, notice: '患者情報が削除されました'
  end

  def select
    session[:selected_patient_id] = @patient.id
    redirect_to root_path, notice: '患者を選択しました'
  end

  private

  def set_patient
    @patient = Patient.find(params[:id])
  end

  def patient_params
    params.require(:patient).permit(:name, :birthday, :gender)
  end
end