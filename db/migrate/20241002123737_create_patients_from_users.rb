class CreatePatientsFromUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :patients do |t|
      t.string :name
      t.date :birthday
      t.string :gender
      t.timestamps
    end

    # 既存のユーザーデータを患者テーブルにコピー
    execute <<-SQL
      INSERT INTO patients (name, birthday, gender, created_at, updated_at)
      SELECT name, birthday, gender, created_at, updated_at FROM users;
    SQL
  end
end
