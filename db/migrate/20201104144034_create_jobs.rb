class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :title
      t.string :company
      t.string :location
      t.text :description
      t.text :key_qualifications
      t.integer :user_id
      # t.string :logo_url
    end 
  end
end
