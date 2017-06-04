require './config/environment'
require "sinatra/reloader"

class ApplicationController < Sinatra::Base

    configure do
        set :public_folder, 'public'    # Load the public assets
        set :views, 'app/views' # load the correct views
        # Sessions
        enable :sessions
        set :session_secret, "f8db22a1165f9873cf1b77baa47daeb9" # some random fd5 hash
        # Hot Reloading
        register Sinatra::Reloader
        enable :reloader
    end

    configure :production do
        disable :show_exceptions
    end

    get '/' do
        erb :homepage
    end
end
