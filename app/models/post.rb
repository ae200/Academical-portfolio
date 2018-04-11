class Post < ApplicationRecord
     enum status: {draft: 0, published: 1 }
	 
	extend FriendlyId
    friendly_id :theme, use: :slugged
	
	validates_presence_of :theme, :body
	belongs_to :category
	
	def self.special_posts
	  all
	end
	
    #def self.featured_posts
    #  limit(2)
    #end	  
end
