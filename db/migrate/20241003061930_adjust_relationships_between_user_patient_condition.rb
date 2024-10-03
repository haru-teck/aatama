class AdjustRelationshipsBetweenUserPatientCondition < ActiveRecord::Migration[6.1]
  def up
    # user_id カラムの削除を試みるが、存在しない場合はスキップ
    if column_exists?(:conditions, :user_id)
      remove_reference :conditions, :user, foreign_key: true
    end

    # patient_id カラムを追加（まだ存在しない場合のみ）
    unless column_exists?(:conditions, :patient_id)
      add_reference :conditions, :patient, foreign_key: true, null: true
    end

    # 既存の Condition レコードに Patient を関連付ける
    execute <<-SQL
      UPDATE conditions c
      SET c.patient_id = (SELECT id FROM patients LIMIT 1)
      WHERE c.patient_id IS NULL
    SQL

    # patient_id を null: false に変更
    change_column_null :conditions, :patient_id, false
  end

  def down
    remove_reference :conditions, :patient, foreign_key: true
    add_reference :conditions, :user, foreign_key: true
  end
end