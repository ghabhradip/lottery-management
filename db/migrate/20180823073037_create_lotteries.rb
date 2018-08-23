class CreateLotteries < ActiveRecord::Migration[5.1]
  def change
    create_table :lotteries do |t|
      t.string :name
      t.decimal :rate
      t.boolean :drawn

      t.timestamps
    end
  end
end
