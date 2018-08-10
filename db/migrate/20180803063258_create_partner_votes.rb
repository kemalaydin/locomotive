class CreatePartnerVotes < ActiveRecord::Migration[5.2]
  def change
    create_table :partner_votes do |t|
      t.references :partner, foreign_key: {to_table: :users}
      t.references :user, foreign_key: true
      t.integer :vote

      t.timestamps
    end
  end
end
