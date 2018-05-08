class Post < ApplicationRecord
     enum status: {draft: 0, published: 1 }
		
	extend FriendlyId
    friendly_id :theme, use: :slugged
	
	
	
	
	include Placeholder 
	validates_presence_of :theme, :body, :timings, :fees, :footfall, :editions, :organizer, :venue, :category_id, :period
	belongs_to :category
	
	def self.special_posts
	  all
	end
	
    #def self.featured_posts
    #  limit(2)
    #end
  
  after_initialize :set_defaults
  
  def set_defaults
    self.main_image ||= Placeholder.image_generator(height: '600', width: '300')
 end
	
end
