class ChangeInputDayToDatetimeInConditions < ActiveRecord::Migration[7.0]
  def up
    change_column :conditions, :input_day, :datetime
  end

  def down
    change_column :conditions, :input_day, :date
  end
end