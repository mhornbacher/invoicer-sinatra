# invoicer-sinatra
A Sinatra web app for simple invoicing. Supports Clients, Users, Jobs, Services and Invoice Generation

# Installation
1. Fork and clone the repo
2. Run bundle install to get all the dependencies
3. Run `rake db:migrate` to set up the DataBase
4. Run `rackup` to start the server

## Windows notes:
* After `bundle install` uninstall `bcrypt` with `gem uninstall bcrypt` and then reinstall it with `gem install bcrypt --platform=ruby`

# Contributions
Create a descriptive pull request

# License
Standard MIT license located at `./LICENSE`