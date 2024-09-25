class ConditionsController < ApplicationController
  def new
    @condition = Condition.new
    @users = User.all  # ユーザーのリストを取得
  end

  def create
    @condition = Condition.new(condition_params)
    if @condition.save
      redirect_to users_path, notice: '体調情報が記録されました。'
    else
      @users = User.all  # エラー時にユーザーのリストを再取得
      render :new
    end
  end

  private

  def condition_params
    params.require(:condition).permit(:input_day, :temperature, :eat, :moisture, :puke, :memo, :user_id)
  end
end