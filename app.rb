require 'sinatra/base'
require_relative './lib/bookmark'
require 'pg'

class BookmarkManager < Sinatra::Base

  enable :sessions, :method_override

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

  delete '/bookmarks/:id' do
    Bookmark.delete(id: params[:id])
    redirect('/')
  end

  get '/bookmarks/:id/edit' do
    @bookmark = Bookmark.find(id: params[:id])
    erb :"bookmarks/edit"
  end

  patch '/bookmarks/:id' do
    Bookmark.update(id: params[:id], title: params[:title], url: params[:url])
    redirect('/')
  end

  run! if app_file == $0
end
