class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :title
      t.string :company
      t.string :location
      t.string :description
      t.integer :user_id
      # t.string :logo_url
    end 
  end
end
