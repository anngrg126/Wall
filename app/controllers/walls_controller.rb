class WallsController < ApplicationController
  def login
  end

  def create

    redirect_to '/wall'
  end

  def fetch_user
    @user = User.find_by_email params[:email]
    # render json: params
    session[:user_id] = @user.id
    redirect_to '/wall'
  end

  def new
  end

  def user_create
    user = User.create name:params[:name], email:params[:email], password:params[:password], password_confirmation:params[:confirm_pw]
    puts user.errors.messages
    session[:user_id] = user.id
    redirect_to '/wall'
  end

  def create_post
    @post = Post.create post_text:params[:post], user:User.find_by_id(session[:user_id])
    redirect_to '/wall'
  end

  def create_comment
    @comment = Comment.create comment_text:params[:comment], post:Post.find_by_id(params[:post_id]), user:User.find_by_id(session[:user_id])
    redirect_to '/wall'
  end

  def THE_WALL
    @posts = Post.all
    # @comments =
    # @comments = Comment.all
  end

end
