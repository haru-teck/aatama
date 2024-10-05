class AddUserRefToPatients < ActiveRecord::Migration[7.0]
  def up
    add_reference :patients, :user, null: true, foreign_key: true

    # 既存のレコードにデフォルトのuser_idを設定（例：最初のユーザー）
    User.first_or_create!(email: 'default@example.com', password: 'password', password_confirmation: 'password')
    execute <<-SQL
      UPDATE patients
      SET user_id = (SELECT id FROM users ORDER BY id LIMIT 1)
      WHERE user_id IS NULL;
    SQL

    # NULLを許可しない制約を追加
    change_column_null :patients, :user_id, false
  end

  def down
    remove_reference :patients, :user
  end
end