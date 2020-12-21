# Load the Rails application.
require_relative 'application'

# Load the app's custom environment variables in .env here, so that they are loaded before environments/*.rb
# finds .env when passed the path 
app_environment_variables = File.join(Rails.root, 'app', '.env')
load(app_environment_variables) if File.exists?(app_environment_variables)

# Initialize the Rails application.
Rails.application.initialize!
