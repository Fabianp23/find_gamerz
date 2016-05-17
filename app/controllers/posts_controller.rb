class PostsController < ApplicationController


  def index
    @posts = Post.all.limit(25)
    @post = Post.new
    if request.xhr?
      render '_posts', layout: false
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
      if request.xhr?
        if @post.valid?
          render '_post', layout: false, locals: { post: @post }
        else
          render json: @post.errors, status: :unprocessable_entity
     end
   end
  end

  private
  def post_params
    params.require(:post).permit(:console, :gamertag, :game, :description, :language, :microphone)
  end

end
