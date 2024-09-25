class CreateConditions < ActiveRecord::Migration[7.0]
  def change
    create_table :conditions do |t|
      t.date :input_day
      t.decimal :temperature, precision: 4, scale: 1 
      t.references :user, foreign_key: true
      t.string :eat
      t.string :moisture
      t.string :puke
      t.text :memo
      t.timestamps
    end
  end
end
