require './config/environment'
require "sinatra/reloader"
require 'rack-flash'

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

    use Rack::Flash

    # configure :production do
    #     disable :show_exceptions
    # end

    get '/' do
        erb :homepage
    end
    get '/dashboard' do
        authenticate!
        erb :dashboard
    end

    helpers do
        include Rack::Utils
        alias_method :h, :escape_html

        # does not work from the files for some reason. to busy to debug
        def block_logged_in
            redirect('/dashboard') if logged_in?
        end
        def authenticate!
            flash[:message] = "Please log in to view this page"
            redirect('/login') unless logged_in?
        end
    end
end
