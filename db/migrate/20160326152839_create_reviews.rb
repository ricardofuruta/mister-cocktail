class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :name
      t.string :description
      t.integer :rate

      t.timestamps null: false
    end
  end
end
