class PortfoliosController < ApplicationController
   before_action :set_portfolio, only: [:edit, :update, :show, :destroy]
    layout "portfolio"
	access all: [:show, :index], user: {except: [:destroy, :new, :create, :update, :edit]}, site_admin: :all 
  def index
    @portfolios = Portfolio.all
  end

  def angular
    @angular_portfolios = Portfolio.angular
  end

  def new
    @portfolio = Portfolio.new
	@job = Job.all
end

  def create
    @portfolio = Portfolio.new(portfolio_params)

    respond_to do |format|
      if @portfolio.save
        format.html { redirect_to portfolios_path, notice: 'Your portfolio item is now live.' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @portfolio.update(portfolio_params)
        format.html { redirect_to portfolios_path, notice: 'The record successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def show
  
  end

  def destroy
    # Destroy/delete the record
    @portfolio.destroy

    # Redirect
    respond_to do |format|
      format.html { redirect_to portfolios_url, notice: 'Record was removed.' }
    end
  end

  private

  def portfolio_params
    params.require(:portfolio).permit(:title,
                                      :subtitle,
                                      :body,
									  :contact,
									  :job_id
									  )
  end
  
  def set_portfolio
  @portfolio = Portfolio.find(params[:id]) 
  end
end