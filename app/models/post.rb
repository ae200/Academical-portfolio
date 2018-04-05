class Post < ApplicationRecord
     belongs_to :category
	 enum status: {draft: 0, published: 1 }
	 
	extend FriendlyId
    friendly_id :theme, use: :slugged
	
	validates_presence_of :theme, :body, :category_id
end
