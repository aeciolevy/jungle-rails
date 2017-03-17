class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest

      t.timestamps null: false
    end
  end

  add_reference :reviews, :users, index: true, foreign_key: true
  add_reference :reviews, :products, index: true, foreign_key: true

end
