class BlogPostsController < ApplicationController
  def index
    @blog_post_list = BlogPost.all
  end

  def show
    @blog_post = BlogPost.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path
  end

  def new
    @blog_post = BlogPost.new
  end

  def create
    @blog_post = BlogPost.new(post_params)
    if @blog_post.save
      # redirect_to root_path,notice: "successfully created"
      redirect_to @blog_post
    else
      render :new,status: :unprocessable_entity 
    end
  end

  private 
    def post_params
      params.require(:blog_post).permit(:title, :description, :category, :image)
    end


end
