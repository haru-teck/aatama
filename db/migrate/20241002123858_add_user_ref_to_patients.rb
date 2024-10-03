class AddUserRefToPatients < ActiveRecord::Migration[7.0]
  def change
    # user_id カラムが既に存在するため、何もしない
    # 必要に応じて、外部キー制約のみを追加
    unless foreign_key_exists?(:patients, :users)
      add_foreign_key :patients, :users
    end

    # インデックスが必要で、まだ存在しない場合は追加
    unless index_exists?(:patients, :user_id)
      add_index :patients, :user_id
    end
  end
end