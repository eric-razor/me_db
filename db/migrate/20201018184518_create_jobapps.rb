class CreateJobapps < ActiveRecord::Migration[6.0]
  def change
    create_table :jobapps do |t|
      t.string :name
      t.integer :job_id
      t.integer :user_id

      t.timestamps
    end
  end
end
