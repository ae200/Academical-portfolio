class PagesController < ApplicationController
    def home
     @posts = Post.all
	 @categories = Category.all
	 @jobs = Job.all
    end

    def about
    end

    def managers
    end

    def advertise
    end

    def event
  
    end

    def contact
    end
end
