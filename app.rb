ENV['RACK_ENV'] = 'development'

require 'sinatra/base'
require './config/data_mapper'

class UserAuth < Sinatra::Base
  enable :sessions
  enable :method_override

  get '/' do
    erb :index
  end

  get '/profile' do
    if signed_in?
      erb :profile
    else
      redirect 'signin'
    end
  end

  get '/signup' do
    erb :signup
  end

  # get '/signup/error' do
  #   erb :error
  #   @user.errors do |e|
  #     p e
  #   end
  # end

  post '/signup' do
    @user = User.new(email: params[:email], password: params[:password])
    if @user.valid?
      @user = User.create(email: params[:email], password: params[:password])
      session[:user_id] = @user.id
      redirect '/profile'
    else
      erb :error
    end
  end

  get '/signin' do
    erb :signin
  end

  post '/signin' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect '/profile'
    else
      redirect '/'
    end
  end

  delete '/sessions' do
    session.delete(:user_id)
    redirect '/'
  end

  private

  def signed_in?
    !current_user.nil?
  end

  def current_user
    @current_user ||= User.get(session[:user_id])
  end
end
