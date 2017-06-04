class CreateJobServices < ActiveRecord::Migration[5.1]
  def change
    create_table :job_services do |t|
      t.integer :job_id
      t.integer :service_id
    end
  end
end
