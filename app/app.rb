# frozen_string_literal: true

ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/reloader'
require_relative './models/bookmark'

class BookmarkManager < Sinatra::Base
  enable :method_override # THIS ENABLES THE OVERRIDE HACK FOR DELETE METHOD

  configure :development do
    register Sinatra::Reloader
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb(:'bookmarks/index')
  end

  post '/bookmarks' do
    Bookmark.create(url: params[:bookmark_url], title: params[:bookmark_title])
    redirect '/bookmarks'
  end

  delete '/bookmarks' do
    Bookmark.delete(id: params[:bookmark_id])
    redirect '/bookmarks'
  end

  run! if app_file == $PROGRAM_NAME
end
