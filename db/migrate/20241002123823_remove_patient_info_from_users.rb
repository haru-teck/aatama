class RemovePatientInfoFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :name, :string
    remove_column :users, :birthday, :date
    remove_column :users, :gender, :string
  end
end
