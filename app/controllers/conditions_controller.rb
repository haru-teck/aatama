class ConditionsController < ApplicationController
  before_action :set_user, only: [:create, :edit, :update] 

  def new
    @condition = Condition.new
  end

  def create
    @condition = Condition.new(condition_params)
    @condition.user = @user # ユーザーを条件に関連付け

    if @condition.save
      redirect_to main_menu_path, notice: '体調記録が作成されました。'
    else
      flash.now[:alert] = '体調記録の作成に失敗しました。'
      render :new
    end
  end

  def edit
    @condition = Condition.find(params[:id])
  end

  def update
    @condition = Condition.find(params[:id])
  
    if @condition.update(condition_params)
      redirect_to user_path(@condition.user), notice: '体調記録が更新されました。'
    else
      render :edit
    end
  end

  def destroy
    @condition = Condition.find(params[:id])
    @user = @condition.user
    @condition.destroy
    redirect_to user_path(@user), notice: '体調記録が削除されました。'
  end

  private

  def set_user
    if params[:condition][:user_id].present? # ここを変更
      @user = User.find_by(id: params[:condition][:user_id]) # 隠しフィールドから取得
      unless @user
        redirect_to users_path, alert: '指定されたユーザーが見つかりませんでした。'
      end
    else
      redirect_to users_path, alert: 'ユーザーIDが指定されていません。'
    end
  end

  def condition_params
    params.require(:condition).permit(:input_day, :temperature, :eat, :moisture, :puke, :memo, images: [])
  end
end
