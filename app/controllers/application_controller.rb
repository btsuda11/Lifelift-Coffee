class ApplicationController < ActionController::API
    before_action :snake_case_params

    #CRRLLL
    def current_user
        @current_user ||= User.find_by_session_token(session[:session_token])
    end

    def require_logged_in
        if !logged_in?
            render json: { message: 'Unauthorized' }, status: :unauthorized
        end
    end

    def require_logged_out
        if logged_in?
            render json: { message: 'Unauthorized' }, status: :unauthorized
        end
    end

    def login!(user)
        session[:session_token] = user.reset_session_token!
        @current_user = user
    end

    def logged_in?
        !!current_user
    end

    def logout!
        current_user.reset_session_token!
        session[:session_token] = nil
        @current_user = nil
    end

    def test
        if params.has_key?(:login)
            login!(User.first)
        elsif params.has_key?(:logout)
            logout!
        end

        if current_user
            render json: { user: current_user.slice('id', 'first_name', 'last_name', 'session_token') }
        else
            render json: ['No current user']
        end
    end

    private
    def snake_case_params
        params.deep_transform_keys!(&:underscore)
    end
end
