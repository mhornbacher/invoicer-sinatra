class ServiceController < ApplicationController
    
    get '/dashboard' do
        block_logged_out
        erb :"user/dashboard"
    end
end
