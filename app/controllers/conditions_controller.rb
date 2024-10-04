class ConditionsController < ApplicationController
  before_action :set_condition, only: [:edit, :update, :destroy]
  before_action :set_patient, only: [:new, :create]

  def index
    @conditions = Condition.all # すべての体調記録を取得
  end

  def new
    @condition = @patient.conditions.build
  end

  def create
    @patient = Patient.find(params[:patient_id])
    @condition = @patient.conditions.build(condition_params)
    @condition.recorder = current_user  # ログインユーザーを記録者として設定
  
    if @condition.save
      redirect_to main_menu_path, notice: '体調情報が保存されました。'
    else
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