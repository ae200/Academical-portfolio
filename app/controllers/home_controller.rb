class HomeController < ApplicationController
  def index
	@posts = Post.all
    @categories = Category.all
	@jobs = Job.all
	@portfolios = Portfolio.all   
  end  
end
