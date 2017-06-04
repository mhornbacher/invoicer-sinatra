class ServiceController < ApplicationController

    get '/services' do
        authenticate!
        erb :"services/index"
    end
    
end
