class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy, :toggle_status]
  layout "post" 
  access all: [:show, :index], user: {except: [:destroy, :new, :create, :update, :edit]}, site_admin: :all 
  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.special_posts
	@page_title = "Engineering Posts"
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
     @page_title = @post.theme
	 @seo_keywords = @post.body
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
     else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
     else
        format.html { render :edit }
     end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
 def toggle_status
    if @post.draft?
      @post.published!
    elsif @post.published?
      @post.draft!
    end
        
    redirect_to posts_url, notice: 'Post status has been updated.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:theme, :body, :timings, :fees, :footfall, :concurrent, :editions, :organizer, :venue)
    end

end
