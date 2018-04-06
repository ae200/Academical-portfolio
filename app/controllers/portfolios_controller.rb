class PortfoliosController < ApplicationController
  def index
    @portfolio_items = Portfolio.all
  end
    
	def facilitators
    @facilitators_portfolio_items = Portfolio.facilitators
  end
	
	def equipment_managers
    @equipment_managers_portfolio_items = Portfolio.equipment_managers
  end
	
	def training_managers
    @training_managers_portfolio_items = Portfolio.training_managers
  end
	
	def event_manager
    @event_manager_portfolio_items = Portfolio.event_manager
  end
	
	
  def new
    @portfolio_item = Portfolio.new
  end

  def create
    @portfolio_item = Portfolio.new(params.require(:portfolio).permit(:title, :subtitle, :body, :main_image, :thumb_image, :contact, :job_id))

    respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to portfolios_path, notice: 'Your portfolio item is now live.' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
    @portfolio_item = Portfolio.find(params[:id])
  end

  def update
    @portfolio_item = Portfolio.find(params[:id])

    respond_to do |format|
      if @portfolio_item.update(params.require(:portfolio).permit(:title, :subtitle, :body, :main_image, :thumb_image, :contact, :job_id))
        format.html { redirect_to portfolios_path, notice: 'The record successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def show
    @portfolio_item = Portfolio.find(params[:id])
  end
  
   def destroy
    # Perform the lookup
    @portfolio_item = Portfolio.find(params[:id])

    # Destroy/delete the record
    @portfolio_item.destroy

    # Redirect
    respond_to do |format|
      format.html { redirect_to portfolios_url, notice: 'Record was removed.' }
    end
  end
  
  
end