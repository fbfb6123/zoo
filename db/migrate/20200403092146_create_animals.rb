class CreateAnimals < ActiveRecord::Migration[5.2]
  def change
    create_table :animals do |t|
      t.string :name,             null: false
      t.string :text,             null: false
      t.string :species,             null: false
      t.string :type,              null: false
      t.string :gender,        null: false
      t.string :age,         null: false
      t.string :image1,             null: false
      t.string :image2                   
      t.string :image3           
      t.references :buyer,   foreign_key:{to_table: :users}
      t.references :facility, foreign_key: true,null: false
      t.timestamps
    end
  end
end
