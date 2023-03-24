module SessionsHelper
    def log_in(user)
        #logs in the given user 
        session[:user_id] = user.id 
    end

    def current_user 
        if session[:user_id] 
            #memoization 
            #sets the current user if nil else returns it 
            @current_user ||= User.find_by(id: session[:user_id])
        end 
    end 

    def logged_in? 
        !current_user.nil? 
    end 

    # Logs out the current user 
    def log_out 
        session.delete(:user_id)
        @current_user = nil 
    end 
end
