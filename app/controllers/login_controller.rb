class LoginController < ApplicationController
    get '/signup' do 
        block_logged_in
        erb :"login/signup"
    end
    post '/signup' do
        binding.pry
    end

    get '/login' do
        block_logged_in
        erb :"login/login"
    end
    post '/login' do
        user = User.find_by(username: params[:username])
        user = user.authenticate(params[:password]) unless user.nil?
        if user.nil? || user == false
            flash[:message] = "Invalid Login Information"
            redirect '/login'
        end
        session[:id] = user.id
        flash[:message] = "Login Successfull!"
        redirect '/dashboard'
    end

    get '/logout' do
        block_logged_out
        session.clear
        erb :"login/logout"
    end
end
