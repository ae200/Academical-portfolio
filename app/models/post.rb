class Post < ApplicationRecord
     belongs_to :category
	 
	extend FriendlyId
    friendly_id :theme, use: :slugged
end
