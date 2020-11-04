class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :title
      t.string :location
      t.text :description
      # t.string :logo_url
    end 
  end
end
