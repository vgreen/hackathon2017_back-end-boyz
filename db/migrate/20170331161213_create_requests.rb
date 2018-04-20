class CreateRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :requests do |t|
      t.string :title
      t.string :name
      t.string :second_name
      t.string :patronim
      t.datetime :birthday
      t.integer :phone_n
      t.string :email
      t.integer :passport_num
      t.datetime :date_pass
      t.integer :code_podr
      t.text :vidan
      t.string :region
      t.text :addres

      t.timestamps
    end
  end
end
