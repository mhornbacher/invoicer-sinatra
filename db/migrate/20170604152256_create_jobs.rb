class CreateJobs < ActiveRecord::Migration[5.1]
  def change
    create_table :jobs do |t|
      t.integer :client_id
      t.datetime  :date
      t.float :amount_paid
    end
  end
end
