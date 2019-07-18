require 'sinatra/base'
require_relative './lib/bookmark'
require 'pg'

class BookmarkManager < Sinatra::Base

  get '/' do
     @bookmarks = Bookmark.all
    erb :index
  end

  get '/bookmarks/new' do
    erb :"/bookmarks/new"
  end

  post '/save_url' do
    Bookmark.create(url: params[:url], title: params[:title])
    redirect('/')
  end

  run! if app_file == $0
end
