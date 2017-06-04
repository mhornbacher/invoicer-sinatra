class JobsController < ApplicationController

    get '/jobs' do
        authenticate!
        erb :"jobs/index"
    end

    post '/jobs' do
        authenticate!
        binding.pry
        # client = current_user.clients.find_by(name: params[:client])

        # if client.nil?
        #     flash[:message] = "Error: Invalid Client Selected"
        #     redirect '/jobs/new'
        # end
        # validate_access(client)
        # job = client.jobs.build(params[:job])

        # if job.save
        #     redirect "/jobs/#{job.id}"
        # else
        #     flash[:message] = job.errors.collect{|field, error| "#{field.to_s.capitalize}: #{error}"}.join("<br/>")
        #     redirect '/jobs/new'
        # end
    end

    get '/jobs/new' do
        authenticate!
        @user = current_user
        erb :"jobs/new"
    end

    # get '/clients/:id' do
    #     authenticate!
    #     @client = Client.find_by(id: params[:id]) # get the item from the database
    #     validate_access(@client)    #validate the user has access to the item
    #     erb :"clients/show"
    # end
    
    # get '/clients/:id/edit' do
    #     authenticate!
    #     @client = Client.find_by(id: params[:id]) # get the item from the database
    #     validate_access(@client)    #validate the user has access to the item
    #     erb :"clients/edit"
    # end

    # post '/clients/:id/edit' do
    #     authenticate!
    #     client = Client.find_by(id: params[:id]) # get the item from the database
    #     validate_access(client)    #validate the user has access to the item
    #     client.update(params[:client])
    #     if !client.valid?
    #         flash[:message] = "Invalid Data: Could not update record"
    #         redirect("/services/#{client.id}/edit") # this kills the controller
    #     end
    #     redirect("/clients/#{client.id}")
    # end
    
    # delete '/clients/:id/delete' do
    #     authenticate!   #check that they are logged in at all
    #     client = Client.find_by(id: params[:id]) # get the item from the database
    #     validate_access(client)    #validate the user has access to the item
    #     client.delete  # and then delete it
    #     redirect '/clients' # send the user back to the list of services after deleting a service (to delete more I guess)?
    # end
end