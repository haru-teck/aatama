class MainMenuController < ApplicationController
  def index
    @users = User.all  # 全ユーザーを取得
    @user = @users.first  # 最初のユーザーを取得
    @conditions = @user ? @user.conditions.order(created_at: :desc) : []  # ユーザーに関連する体調記録を取得し、作成日時の降順で並べ替え
  end
end
