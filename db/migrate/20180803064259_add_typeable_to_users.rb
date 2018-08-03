class AddTypeableToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :type_id, :integer
    add_column :users, :type_type, :string
    add_column :users, :status, :integer
    
    add_index :users, [:type_id, :type_type]
  end
end
