class CreateSeries < ActiveRecord::Migration[5.1]
  def change
    create_table :series do |t|
      t.string :name
      t.integer :lottery_id

      t.timestamps
    end
  end
end
