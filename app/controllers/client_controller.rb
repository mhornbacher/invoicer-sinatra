class ClientController < ApplicationController

    get '/clients' do
        authenticate!
        erb :"clients/index"
    end

    post '/clients' do
        authenticate!
        client = current_user.clients.build(params[:client])
        if client.save
            redirect '/clients'
        else
            flash[:message] = client.errors.collect{|field, error| "#{field.to_s.capitalize}: #{error}"}.join("<br/>")
            redirect '/client/new'
        end
    end

    get '/clients/new' do
        authenticate!
        erb :"clients/new"
    end

    get '/clients/:id' do
        authenticate!
        @client = Client.find_by(id: params[:id]) # get the item from the database
        validate_access(@client)    #validate the user has access to the item
        erb :"clients/show"
    end
    
    get '/clients/:id/edit' do
        authenticate!
        @client = Client.find_by(id: params[:id]) # get the item from the database
        validate_access(@client)    #validate the user has access to the item
        erb :"clients/edit"
    end

    post '/clients/:id/edit' do
        authenticate!
        client = Client.find_by(id: params[:id]) # get the item from the database
        validate_access(client)    #validate the user has access to the item
        client.update(params[:client])
        if !client.valid?
            flash[:message] = "Invalid Data: Could not update record"
            redirect("/clients/#{client.id}/edit") # this kills the controller
        end
        redirect("/clients/#{client.id}")
    end
    
    delete '/clients/:id/delete' do
        authenticate!   #check that they are logged in at all
        client = Client.find_by(id: params[:id]) # get the item from the database
        validate_access(client)    #validate the user has access to the item
        client.delete  # and then delete it
        redirect '/clients' # send the user back to the list of clients after deleting a service (to delete more I guess)?
    end
end
