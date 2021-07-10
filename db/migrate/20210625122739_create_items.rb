class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string     :product_name,          null: false
      t.text       :description_name,      null: false                    
      t.integer    :price,                 null: false                   
      t.integer    :area_id,               null: false                    
      t.integer    :burden_id,             null: false                    
      t.integer    :delivery_state_id,     null: false                    
      t.integer    :category_id,           null: false                    
      t.integer    :day_to_ship_id,        null: false                    
      t.references :user,                  null: false, foreign_key: true 
      t.timestamps
    end
  end
end
