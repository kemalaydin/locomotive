class CreateReferenceTexts < ActiveRecord::Migration[5.2]
  def change
    create_table :reference_texts do |t|
      t.references :user, foreign_key: true
      t.references :reference_code, foreign_key: true
      t.text :text

      t.timestamps
    end
  end
end
