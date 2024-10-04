class AddFuriganaToPatients < ActiveRecord::Migration[7.0]
  def change
    add_column :patients, :furigana, :string
    add_index :patients, :furigana
  end
end
