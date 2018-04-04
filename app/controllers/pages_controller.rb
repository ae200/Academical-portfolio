class PagesController < ApplicationController
  def home
     @posts = Post.all
  end

  def about
  end

  def managers
  end

  def advertise
  end

  def event
  end

  def library
  end

  def contact
  end
end
