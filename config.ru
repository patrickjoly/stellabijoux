# This file is used by Rack-based servers to start the application.

 # Set your environment here.
ENV["RAILS_ENV"] ||= "production"

require ::File.expand_path('../config/environment',  __FILE__)
use Rack::Static, :urls => ['/carrierwave'], :root => 'tmp' # adding this line
run Stellabijoux::Application

