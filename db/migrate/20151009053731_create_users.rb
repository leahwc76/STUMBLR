class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :fname
      t.string :lname
      t.string :bio
      t.string :location
      t.string :email
      t.string :password

      t.timestamps null: false
    end
  end
end
