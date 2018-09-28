class StocksController < ApplicationController
  before_action :authenticate_user!, :except => [:show, :index]
  before_action :set_stock, only: [:show, :edit, :update, :destroy]


  def index
    respond_to do |format|
       format.html {
	   @grid = StocksGrid.new(grid_params) do |scope|
               scope.page(params[:page])
           end
       }
       format.json {
           @stocks = Stock.order(:symbol).where("symbol like ?", "%#{params[:term]}%")
	   #render json: @stocks.map(&:symbol)
	   render json: @stocks.map {|x| "#{x.symbol} #{x.name}" }
       }
    end
  end


  # GET /stocks/1
  # GET /stocks/1.json
  def show
    @dividend_rank_grid = DividendRanksGrid.new(grid_params) do |scope|
        scope.where(stock_id: params[:id]).order(:date).page(params[:page])
    end
    @dividend_rank = @stock.dividend_rank.last
  end

  # GET /stocks/new
  def new
    @stock = Stock.new
  end

  # GET /stocks/1/edit
  def edit
  end

  # POST /stocks
  # POST /stocks.json
  def create
    @stock = Stock.new(stock_params)

    respond_to do |format|
      if @stock.save
        format.html { redirect_to @stock, notice: 'Stock was successfully created.' }
        format.json { render :show, status: :created, location: @stock }
      else
        format.html { render :new }
        format.json { render json: @stock.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stocks/1
  # PATCH/PUT /stocks/1.json
  def update
    respond_to do |format|
      if @stock.update(stock_params)
        format.html { redirect_to @stock, notice: 'Stock was successfully updated.' }
        format.json { render :show, status: :ok, location: @stock }
      else
        format.html { render :edit }
        format.json { render json: @stock.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stocks/1
  # DELETE /stocks/1.json
  def destroy
    @stock.destroy
    respond_to do |format|
      format.html { redirect_to stocks_url, notice: 'Stock was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  protected

  def grid_params
    params.fetch(:stocks_grid, {}).permit!
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stock
      @stock = Stock.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def stock_params
      params.require(:stock).permit(:symbol, :name, :industry_id, :sector_id, :ccc_seq, :price, :yield_years, :div_yield, :old_rate, :new_rate, :mr_inc, :ex_div, :div_record, :div_pay, :qtly_sched, :annual_div, :payout, :i_graham, :p_e, :fye_month, :ttm_eps, :peg_ratio, :ttm_p_sales, :mrq_p_book, :ttm_roe, :ty_growth, :ny_growth, :last_5_growth, :est_5_growth, :na, :mktcap, :inside_own, :debt_equity, :chowder_rule)
    end
end
