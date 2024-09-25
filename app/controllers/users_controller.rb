class UsersController < ApplicationController
  def show
    @user = User.first  # 最初のユーザーを取得
    @conditions = @user.conditions  # ユーザーに関連する体調情報を取得
  end
end
