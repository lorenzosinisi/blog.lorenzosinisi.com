class PostsController < ApplicationController
  before_action :set_post, only: [:show]

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.order(created_at: :desc).all.page(params[:page]).per(20)
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end
end
