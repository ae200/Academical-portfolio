class Portfolio < ApplicationRecord
  validates_presence_of :title, :body, :main_image, :thumb_image, :contact, :job_id
  belongs_to :job 
  
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
end
