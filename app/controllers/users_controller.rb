class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :destroy]
  
 

  # ユーザー一覧表示
  def index
    @users = User.all
    @user = User.new
  end

  def edit
    # ユーザー編集フォームの表示
  end

  def update
    if @user.update(user_params)
      redirect_to users_path, notice: 'ユーザー情報が更新されました'
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path, notice: 'ユーザーが削除されました'
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_path, notice: 'ユーザーが正常に作成されました。'
    else
      render :new
    end
  end

  def select
    session[:selected_user_id] = params[:id]
    redirect_to root_path, notice: 'ユーザーを切り替えました'
  end

  private

  def set_user
    @user = User.find_by(id: params[:id])
    unless @user
      redirect_to users_path, alert: '指定されたユーザーが見つかりませんでした。'
    end
  end
  

  def user_params
    params.require(:user).permit(:name, :birthday, :gender)
  end
end
