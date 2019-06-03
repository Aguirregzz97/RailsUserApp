module SessionsHelper

    def log_in(user)
        session[:user_id] = user.id
    end

    def log_out
        session.delete(:user_id)
        @current_user = nil
    end

    def current_user
        # current user va a ser current user o el .find
        if session[:user_id]
            @current_user ||= User.find_by(id: session[:user_id])
        end
    end

    def current_user?(user)
        user == current_user
    end
    
    def correct_user?(user)
        @user = User.find(params[:id])
        redirect_to(root_url) unless current_user?(@user)
    end

    def logged_in?
        !current_user.nil?
    end

    def redirect_back_or(default)
        redirect_to(session[:forwarding_url] || default)
        session.delete(:forwarding_url)
    end

    def store_location
        session[:forwarding_url] = request.original_url if request.get?
    end
    
end
