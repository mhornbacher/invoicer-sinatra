class JobsController < ApplicationController

    get '/jobs' do
        authenticate!
        erb :"jobs/index"
    end

    post '/jobs' do
        authenticate!
        client = current_user.clients.find_by(name: params[:client])
        if client.nil?
            flash[:warning] = "Warning: Created New Client with Unknown Email Address"
            client = current_user.clients.create(name: params[:client], email: "N/A")
        end
        validate_access(client)
        job = client.jobs.build(params[:job])
        if job.save
            redirect "/jobs/#{job.id}"
        else
            flash[:message] = job.errors.collect{|field, error| "#{field.to_s.capitalize}: #{error}"}.join("<br/>")
            redirect '/jobs/new'
        end
    end

    get '/jobs/new' do
        authenticate!
        @user = current_user
        erb :"jobs/new"
    end

    get '/jobs/:id' do
        authenticate!
        @user = current_user
        @job = Job.find_by(id: params[:id]) # get the item from the database
        validate_access(@job.client)    #validate the user has access to the item
        erb :"jobs/show"
    end

    get '/jobs/:id/invoice' do
        authenticate!
        @job = Job.find_by(id: params[:id])
        erb :"jobs/invoice", layout: false # get rid of the inputs
    end
    
    get '/jobs/:id/edit' do
        authenticate!
        @user = current_user
        @job = Job.find_by(id: params[:id]) # get the item from the database
        validate_access(@job.client)    #validate the user has access to the item
        erb :"jobs/edit"
    end

    post '/jobs/:id/edit' do
        authenticate!
        job = Job.find_by(id: params[:id]) # get the item from the database
        client = current_user.clients.find_by(name: params[:client])
        if client.nil?
            flash[:warning] = "Warning: Created New Client with Unknown Email Address"
            client = current_user.clients.create(name: params[:client], email: "N/A")
        end
        validate_access(client)    #validate the user has access to the item
        job.client = client
        job.update(params[:job])
        if !job.valid?
            flash[:message] = "Invalid Data: Could not update record"
            redirect("/jobs/#{job.id}/edit") # this kills the controller
        end
        redirect("/jobs/#{job.id}")
    end
    
    delete '/jobs/:id/delete' do
        authenticate!   #check that they are logged in at all
        job = Job.find_by(id: params[:id]) # get the item from the database
        validate_access(job.client)    #validate the user has access to the item
        job.delete  # and then delete it
        redirect '/jobs' # send the user back to the list of services after deleting a service (to delete more I guess)?
    end
end