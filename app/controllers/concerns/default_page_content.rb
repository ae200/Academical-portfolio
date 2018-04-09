module DefaultPageContent
  extend ActiveSupport::Concern

  included do
    before_action :set_page_defaults
  end

  def set_page_defaults
    @page_title = "Engineering Conference | Global Platform Website"
    @seo_keywords = "Engineering Conference, Global Platform, Global Education"
  end
end