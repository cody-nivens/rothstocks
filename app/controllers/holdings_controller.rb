class HoldingsController < ApplicationController
  def index
    @grid = HoldingsGrid.new(grid_params) do |scope|
	    scope.where(portfolio_id: params[:portfolio_id]).page(params[:page])
    end
  end

  before_action :set_holding, only: [:show, :edit, :update, :destroy]

  # GET /holdings/1
  # GET /holdings/1.json
  def show
  end

  # GET /holdings/new
  def new
    @holding = Holding.new
    @holding.portfolio_id = params[:portfolio_id]
  end

  # GET /holdings/1/edit
  def edit
  end

  # POST /holdings
  # POST /holdings.json
  def create
    @holding_symbol = params[:holding][:holding_symbol]
    params[:holding].delete(:holding_symbol)
    @holding = Holding.new(holding_params)
    list = @holding_symbol.split()
    @holding.stock = Stock.find_by_symbol(list[0])

    respond_to do |format|
      if @holding.save
        format.html { redirect_to @holding.portfolio, notice: 'Holding was successfully created.' }
        format.json { render :show, status: :created, location: @holding }
      else
        format.html { render :new }
        format.json { render json: @holding.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /holdings/1
  # PATCH/PUT /holdings/1.json
  def update
    @holding_symbol = params[:holding][:holding_symbol]
    params[:holding].delete(:holding_symbol)
    @holding.stock = Stock.find_by_symbol(@holding_symbol.split()[0])

    respond_to do |format|
      if @holding.update(holding_params)
        format.html { redirect_to @holding.portfolio, notice: 'Holding was successfully updated.' }
        format.json { render :show, status: :ok, location: @holding }
      else
        format.html { render :edit }
        format.json { render json: @holding.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /holdings/1
  # DELETE /holdings/1.json
  def destroy
    portfolio = @holding.portfolio
    @holding.destroy
    respond_to do |format|
      format.html { redirect_to portfolio, notice: 'Holding was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  protected

  def grid_params
    params.fetch(:holdings_grid, {}).permit!
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_holding
      @holding = Holding.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def holding_params
      params.require(:holding).permit(:stock_id, :stock_type, :price, :quantity, :date, :portfolio_id, :holding_symbol)
    end
end
