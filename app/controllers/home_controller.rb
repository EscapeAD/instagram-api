class HomeController < ApplicationController
  before_action :set_call, only: [:connect,:callback]
  def index
    render :login if session[:access_token].nil?
    @client = Instagram.client(access_token: session[:access_token])
    if params[:tag].nil?
      @photos = @client.user_recent_media
    elsif !params[:tag].nil?
      @photos = @client.user_recent_media
    end

  end

  def connect
    redirect_to Instagram.authorize_url(redirect_uri: @callback)
  end

  def callback
    response = Instagram.get_access_token(params[:code], redirect_uri: @callback)
    session[:access_token] = response.access_token
    redirect_to root_path
  end

  private
  
  def set_call
    @callback = "http://localhost:3000/oauth/callback"
  end

end
