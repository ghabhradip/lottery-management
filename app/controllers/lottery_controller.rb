class LotteryController < ApplicationController
  def index
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

  end

  def edit
  end

  def update
  end
end
