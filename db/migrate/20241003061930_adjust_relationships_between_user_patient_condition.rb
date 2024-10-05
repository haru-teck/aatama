class AdjustRelationshipsBetweenUserPatientCondition < ActiveRecord::Migration[7.0]
  def up
    unless column_exists?(:conditions, :user_id)
      remove_reference :conditions, :user, foreign_key: true
    end

    unless column_exists?(:conditions, :patient_id)
      add_reference :conditions, :patient, foreign_key: true, null: true
    end

    execute <<-SQL
      UPDATE conditions
      SET patient_id = (SELECT id FROM patients LIMIT 1)
      WHERE patient_id IS NULL
    SQL

    change_column_null :conditions, :patient_id, false
  end

  def down
    add_reference :conditions, :user, foreign_key: true
    remove_reference :conditions, :patient, foreign_key: true
  end
end