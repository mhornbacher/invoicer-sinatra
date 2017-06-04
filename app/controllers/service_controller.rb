class ServiceController < ApplicationController

    get '/services' do
        authenticate!
        erb :"services/index"
    end

    post '/services' do
        authenticate!
        service = current_user.services.build(params[:service])
        if service.save
            redirect '/services'
        else
            flash[:message] = user.errors.collect{|field, error| "#{field.to_s.capitalize}: #{error}"}.join("<br/>")
            redirect '/services/new'
        end
    end

    get '/services/new' do
        authenticate!
        erb :"services/new"
    end

    get '/services/:id' do
        authenticate!
        @service = Service.find_by(id: params[:id]) # get the item from the database
        validate_access(@service)    #validate the user has access to the item
        erb :"services/show"
    end
    
    get '/services/:id/edit' do
        authenticate!
        @service = Service.find_by(id: params[:id]) # get the item from the database
        validate_access(@service)    #validate the user has access to the item
        erb :"services/edit"
    end

    post '/services/:id/edit' do
        authenticate!
        service = Service.find_by(id: params[:id]) # get the item from the database
        validate_access(service)    #validate the user has access to the item
        service.update(params[:service])
        if !service.valid?
            flash[:message] = "Invalid Data: Could not update record"
            redirect("/services/#{service.id}/edit") # this kills the controller
        end
        redirect("/services/#{service.id}")
    end
    
    delete '/services/:id/delete' do
        authenticate!   #check that they are logged in at all
        service = Service.find_by(id: params[:id]) # get the item from the database
        validate_access(service)    #validate the user has access to the item
        service.delete  # and then delete it
        redirect '/services' # send the user back to the list of services after deleting a service (to delete more I guess)?
    end

end
