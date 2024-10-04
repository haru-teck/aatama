class ConditionsController < ApplicationController
  before_action :set_condition, only: [:edit, :update, :destroy]
  before_action :set_patient, only: [:new, :create]
  
  def index
    @conditions = Condition.includes(:patient, :recorder).order(input_day: :desc)
  end

  def new
    @condition = @patient.conditions.build
  end

  def create
    Rails.logger.info "Condition params: #{params[:condition].inspect}"
    @condition = @patient.conditions.build(condition_params)
    @condition.recorder = current_user
  
    if @condition.save
      Rails.logger.info "Condition saved successfully: #{@condition.inspect}"
      redirect_to main_menu_path, notice: '体調情報が保存されました。'
    else
      Rails.logger.info "Condition save failed: #{@condition.errors.full_messages}"
      render :new
    end
  end

  def edit
  end

  def update
    if @condition.update(condition_params)
      redirect_to main_menu_path, notice: '体調記録が更新されました。'
    else
      render :edit
    end
  end

  def destroy
    @condition.destroy
    redirect_to main_menu_path, notice: '体調記録が削除されました。'
  end

  def set_condition
    @condition = Condition.find(params[:id])
  end

  def set_patient
    @patient = Patient.find(params[:patient_id]) if params[:patient_id]
  end

  def condition_params
    params.require(:condition).permit(:input_day, :temperature, :eat, :moisture, :puke, :memo, images: [])
  end

  private

  def set_condition
    @condition = Condition.find(params[:id])
  end

  def set_patient
    @patient = Patient.find(params[:patient_id])
  end

  def condition_params
    params.require(:condition).permit(:input_day, :temperature, :eat, :moisture, :puke, :memo, images: [])
  end
end