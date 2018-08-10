class CreatePeople < ActiveRecord::Migration[5.2]
  def change
    create_table :people do |t|
      t.string :name
      t.string :surname
      t.string :phone
      t.integer :job
      t.integer :gender
      t.integer :age

      t.timestamps
    end
  end
end
