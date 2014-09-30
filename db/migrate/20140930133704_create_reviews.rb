class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.references :restaurant, index: true
      t.text :text
      t.integer :rating

      t.timestamps
    end
  end
end
