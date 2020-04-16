class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :name,null: false
      t.string :place,null:false
      t.string :startmonth,null:false
      t.string :startday,null:false
      t.string :starttime,null:false
      t.string :startminute,null:false
      t.string :endmonth
      t.string :endday
      t.string :endtime,null:false
      t.string :endminute,null:false
      t.string :text,null: false
      t.string :image,null: false
      t.timestamps
    end
  end
end
