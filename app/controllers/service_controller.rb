class ServiceController < ApplicationController

    get '/dashboard' do
        authenticate!
        erb :"user/dashboard"
    end
end
