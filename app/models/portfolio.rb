class Portfolio < ApplicationRecord
  has_many :technologies
  belongs_to :job
  accepts_nested_attributes_for :technologies,
                                 reject_if: lambda { |attrs| attrs['name'].blank? }
  
  include Placeholder
  validates_presence_of :title, :subtitle, :body, :main_image, :thumb_image, :contact, :job_id
  
  
  def self.facilitators
    where(subtitle: 'Facilitators')
  end
  
  def self.training_managers
    where(subtitle: 'Training Managers')
  end
  
  def self.equipment_managers
    where(subtitle: 'Equipment Managers')
  end
  
  def self.event_manager
    where(subtitle: 'Event Manager')
  end

  scope :event_manager_portfolio_items, -> { where(subtitle: 'Event Manager') }
  
   after_initialize :set_defaults

   def set_defaults
    self.main_image ||= "http://placehold.it/600x400"
    self.thumb_image ||= "http://placehold.it/350x200"
  end
end
