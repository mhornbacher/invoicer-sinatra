class LoginController < ApplicationController
    get '/signup' do 
        block_logged_in
        erb :"login/signup"
    end
    post '/signup' do
        user = User.new(params[:user])
        if user.save
            session[:id] = user.id
            redirect '/dashboard'
        else
            flash[:message] = user.errors.collect{|field, error| "#{field.to_s.capitalize}: #{error}"}.join("<br/>")
            # binding.pry
            redirect '/signup'
        end
        redirect '/signup'
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
        session.clear
        erb :"login/logout"
    end
end
