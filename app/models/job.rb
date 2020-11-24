class Job < ActiveRecord::Base
    belongs_to :user
    validates_presence_of :title, :company
    
    def time
        self.created_at.strftime("Posted on %m/%d") + self.updated_at.strftime("- Last updated: %m/%d  %I:%M %P")
    end

end