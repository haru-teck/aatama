class AllowNullRecorderIdInConditions < ActiveRecord::Migration[7.0]
  def up
    change_column_null :conditions, :recorder_id, true
  end

  def down
    change_column_null :conditions, :recorder_id, false
  end
end
