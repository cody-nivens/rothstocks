class ChampionController < ApplicationController
  def index
    respond_to do |format|
       format.html {
       @grid = DividendRanksGrid.new(grid_params) do |scope|
               scope.page(params[:page])
           end
       @sector_counts = @grid.assets.group("sector_id").count.map{|k,v| {Sector.find(k).name=> v}}.reduce(:merge)
       @industry_counts = @grid.assets.group("industry_id").count.map{|k,v| {Industry.find(k).name=> v}}.reduce(:merge)
       }
#       format.json {
#           @stocks = DividendRank.order(:symbol).where("symbol like ?", "%#{params[:term]}%")
#       #render json: @stocks.map(&:symbol)
#       render json: @stocks.map {|x| "#{x.symbol} #{x.name}" }
#       }
    end
  end

    protected

  def grid_params
    params.fetch(:dividend_ranks_grid, {}).permit!
  end


end
