class CreateActivities < ActiveRecord::Migration[5.2]
  def change
    create_table :activities do |t|
      t.references :card, foreign_key: true
      t.string :activity_code
      t.integer :activity_type

      t.timestamps
    end
  end
end
