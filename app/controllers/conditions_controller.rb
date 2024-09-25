class ConditionsController < ApplicationController
  before_action :set_condition, only: [:edit, :update, :destroy]
  before_action :set_user, only: [:create]
  
  def index
    @conditions = Condition.all # すべての体調記録を取得
  end
  
  def new
    @condition = Condition.new
  end

  def create
    @condition = Condition.new(condition_params)
    @condition.user = @user # ユーザーを条件に関連付け
  
    if @condition.save
      if params[:condition][:images].present?
        params[:condition][:images].each do |image|
          @condition.images.attach(image)
        end
      end
      redirect_to main_menu_path, notice: '体調記録が正常に作成されました。'
    else
      render :new
    end
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
    redirect_to conditions_path, notice: '体調記録が削除されました。'
  end

  private

  def set_condition
    @condition = Condition.find(params[:id])
  end

  def set_user
    @user = User.find_by(id: params[:condition][:user_id])
    unless @user
      redirect_to main_menu_path, alert: '指定されたユーザーが見つかりませんでした。'
    end
  end
  
  def condition_params
    params.require(:condition).permit(:input_day, :temperature, :eat, :moisture, :puke, :memo, images: [])
  end
end  
