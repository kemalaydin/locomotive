class CreateReferenceCodes < ActiveRecord::Migration[5.2]
  def change
    create_table :reference_codes do |t|
      t.references :issuer, foreign_key: {to_table: :users}
      t.string :email
      t.string :reference_code
      t.integer :status

      t.timestamps
    end
  end
end
