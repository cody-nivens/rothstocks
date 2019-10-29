class SectorsController < ApplicationController
  before_action :authenticate_user!, :except => [:show, :index]
  before_action :set_sector, only: [:show, :edit, :update, :destroy]


  def index
    @grid = SectorsGrid.new(grid_params) do |scope|
      scope.page(params[:page])
    end
    chart_list
  end

  def chart_list
    @chart_list = {}
    t = {}
    @grid.assets.each do |asset|
      cnt = asset.stocks.count
      t[asset.name] = cnt
    end
    z = t.sort_by {|_key, value| -value}
    z.each do |k,v|
      @chart_list[k] = v
    end
  end

  def chart_list2
    @chart_list = {}
    t = {}
    assets = []
    if !@grid.attributes[:sector_id].nil?
      assets = Stock.where(sector_id: @grid.attributes[:sector_id])
    elsif !@grid.attributes[:industry_id].nil?
      assets = Stock.where(industry_id: @grid.attributes[:industry_id])
    end
    assets.each do |asset|
      t[asset.industry.name] = 0 if t[asset.industry.name].nil?
      t[asset.industry.name] += 1
    end
    z = t.sort_by {|_key, value| -value}
    z.each do |k,v|
      @chart_list[k] = v
    end
  end

  # GET /sectors/1
  # GET /sectors/1.json
  def show
    @industries_grid = IndustriesGrid.new(industry_grid_params.merge({:sector_id=>@sector.id})) do |scope|
       scope.page(params[:page])
    end
    @grid = StocksGrid.new(grid_params.merge({:show_industry=>true,:sector_id=>@sector.id})) do |scope|
       scope.page(params[:page])
    end
    chart_list2
  end

  # GET /sectors/new
  def new
    @sector = Sector.new
  end

  # GET /sectors/1/edit
  def edit
  end

  # POST /sectors
  # POST /sectors.json
  def create
    @sector = Sector.new(sector_params)

    respond_to do |format|
      if @sector.save
        format.html { redirect_to @sector, notice: 'Sector was successfully created.' }
        format.json { render :show, status: :created, location: @sector }
      else
        format.html { render :new }
        format.json { render json: @sector.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sectors/1
  # PATCH/PUT /sectors/1.json
  def update
    respond_to do |format|
      if @sector.update(sector_params)
        format.html { redirect_to @sector, notice: 'Sector was successfully updated.' }
        format.json { render :show, status: :ok, location: @sector }
      else
        format.html { render :edit }
        format.json { render json: @sector.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sectors/1
  # DELETE /sectors/1.json
  def destroy
    @sector.destroy
    respond_to do |format|
      format.html { redirect_to sectors_url, notice: 'Sector was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  protected

  def grid_params
    params.fetch(:sectors_grid, {}).permit!
  end

  def industry_grid_params
    params.fetch(:industries_grid, {}).permit!
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sector
      @sector = Sector.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sector_params
      params.require(:sector).permit(:name)
    end
end
