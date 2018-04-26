class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include DeviseWhitelist
  include SetSource 
  include CurrentUserConcern
  include DefaultPageContent
  include NewContact
  helper_method :all_categories
  helper_method :all_jobs
 
  
  def all_categories
	@categories = Category.all
  end
  
  def all_jobs
	@jobs = Job.all
  end
  
   
end

