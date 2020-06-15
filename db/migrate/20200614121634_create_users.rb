class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.string :full_name
      t.string :date_of_membership
      t.integer :total_checkout
      t.string :phone
      t.string :address
      t.timestamps
    end
  end
end
