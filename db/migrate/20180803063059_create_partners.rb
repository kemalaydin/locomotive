class CreatePartners < ActiveRecord::Migration[5.2]
  def change
    create_table :partners do |t|
      t.string :title
      t.integer :partner_type

      t.timestamps
    end
  end
end
