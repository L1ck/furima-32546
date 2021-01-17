class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|

      t.integer       :category_id       , null: false
      t.integer       :state_id          , null: false
      t.integer       :delivery_fee_id   , null: false
      t.integer       :area_id           , null: false
      t.integer       :delivery_day_id   , null: false
      t.timestamps
    end
  end
end
  