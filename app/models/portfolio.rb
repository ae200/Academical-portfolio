class Portfolio < ApplicationRecord
  belongs_to :job
    
  include Placeholder
  validates_presence_of :title, :subtitle, :body, :contact, :job_id
  
  
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

  scope :event_manager_portfolios, -> { where(subtitle: 'Event Manager') }
  
   after_initialize :set_defaults

   def set_defaults
    self.main_image ||= Placeholder.image_generator(height: '600', width: '400')
    self.thumb_image ||= Placeholder.image_generator(height: '350', width: '200')
  end
end
