class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.string :name,null: false
      t.string :text,null: false
      t.string :image
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
