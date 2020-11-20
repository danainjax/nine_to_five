class Helper < ActiveRecord::Base
    def self.user(session)
        User.find(session[:user_id])
    end

end
