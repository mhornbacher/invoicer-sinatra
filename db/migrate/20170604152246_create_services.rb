class CreateServices < ActiveRecord::Migration[5.1]
  def change
    create_table :services do |t|
      t.string  :name
      t.float   :price
      t.integer :user_id
    end
  end
end
