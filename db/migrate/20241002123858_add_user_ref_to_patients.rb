class AddUserRefToPatients < ActiveRecord::Migration[7.0]
  def change
    unless column_exists?(:patients, :user_id)
      add_reference :patients, :user, null: false, foreign_key: true
    end
  end
end