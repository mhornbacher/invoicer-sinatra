module Loggedin
    def logged_in?
        !!session[:id]
    end
    def current_user
        # Saves an insane number of calls From 37 down to 8 :-)
        @current_user ||= User.find_by(id: session[:id])
    end
end