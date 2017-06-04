class LoginController < ApplicationController
    get '/signup' do 
        erb :"login/signup"
    end
    get '/login' do
        erb :"login/login"
    end
    get '/logout' do
        session.clear
        erb :"login/logout"
    end
end
