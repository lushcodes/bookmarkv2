# frozen_string_literal: true

require 'sinatra/base'
require 'sinatra/reloader'
require './lib/example_class' # <<------- CHANGE THIS WHEN YOU CHANGE THE CLASS IF REQUIRED HERE #

class AppName < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    'CAPYBARA / RSPEC WORKING!'
  end

  run! if app_file == $PROGRAM_NAME
end
