class MainMenuController < ApplicationController
  def index
    @users = User.all  # 全ユーザーを取得
    @user = @users.first  # 最初のユーザーを取得
    @conditions = @user ? @user.conditions : []  # ユーザーに関連する体調記録を取得
  end
  
end
