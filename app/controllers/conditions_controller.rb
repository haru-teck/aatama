# app/controllers/conditions_controller.rb
class ConditionsController < ApplicationController
  def new
    @condition = Condition.new
  end

  def create
    @condition = Condition.new(condition_params)
    if @condition.save
      redirect_to conditions_path, notice: '条件が作成されました。'
    else
      render :new
    end
  end

  private

  def condition_params
    params.require(:condition).permit(:input_day, :temperature, :eat, :moisture, :puke, :memo, images: [])
  end
end
