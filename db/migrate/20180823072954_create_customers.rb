class CreateCustomers < ActiveRecord::Migration[5.1]
  def change
    create_table :customers do |t|
      t.string :name
      t.text :address
      t.string :pincode
      t.string :mobile
      t.string :email
      t.text :remarks

      t.timestamps
    end
  end
end
