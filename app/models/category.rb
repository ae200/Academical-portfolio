class Category < ApplicationRecord
     has_many :posts
	 validates_presence_of :name, :description	 
end
