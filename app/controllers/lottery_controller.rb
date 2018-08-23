class LotteryController < ApplicationController
  skip_before_action :verify_authenticity_token  
  def index
    
    @lotteries = Lottery.all
  end
  def new
    @lottery = Lottery.new
  end
  def create
    @lottery = Lottery.new
    @lottery.name = params[:name]
    @lottery.rate = params[:rate]
    if params[:drawn_value] == "drawn"
      @lottery.drawn = true
    elsif params[:drawn_value] == "not drawn"
      @lottery.drawn = false
    end  
    @lottery.save
    if params[:series].blank?      
    else
      series_array = params[:series].split(",")
      series_array.each do |serial|
        @series = Series.new
        @series.name = serial
        @series.lottery_id = @lottery.id
        @series.save
      end
    end
    redirect_to "/lottery/new"
    flash[:alert] = "Lottery has been created!"
  end

  def edit
  end

  def update
  end
end
