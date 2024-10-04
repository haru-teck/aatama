class AddRecorderIdToConditions < ActiveRecord::Migration[7.0]
  def change
    add_column :conditions, :recorder_id, :integer
  end
end
