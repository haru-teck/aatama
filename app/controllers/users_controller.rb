class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :destroy]
  
  def show
    @user = User.first  # 最初のユーザーを取得
    @conditions = @user.conditions  # ユーザーに関連する体調情報を取得
  end

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

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_path, notice: '新しいユーザーが作成されました。'
    else
      @users = User.all
      render :index
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :birthday)
  end
end
