class PortfoliosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_portfolio, only: [:report, :show, :edit, :update, :destroy]

  def report
    @comments = {}
    holdings = @portfolio.holdings.collect{|x| x.stock.id}

    drs = DividendRank.where("div_yield >= 3 and p_e <= 20 and price <= 100 and new_rate >= 0.65 and date = ? and stock_id not in (?)", DividendRank.last.date,holdings)

    drs_ids_a = drs.ids
    drs_ids_b = drs.ids

    @portfolio.holdings.each do |holding|
      drs_ids_a.each_with_index do |stk_a, index|
        s_a = DividendRank.find(stk_a)
        next if holdings.include?(s_a)

        index2 = index + 1

        while index2 < drs_ids_b.length do

          stk_b = drs_ids_b[index2] 
          next if stk_a == stk_b

          s_b = DividendRank.find(stk_b)
          next if holdings.include?(s_b)

          if holding.stock.dividend_ranks.last.price > s_a.price + s_b.price &&
            holding.stock.dividend_ranks.last.new_rate < s_a.new_rate + s_b.new_rate
            @comments[holding.stock.symbol] = {} if @comments[holding.stock.symbol].nil?
            @comments[holding.stock.symbol]["#{s_a.new_rate+s_b.new_rate}"] = {} if @comments[holding.stock.symbol]["#{s_a.new_rate+s_b.new_rate}"].nil?
            @comments[holding.stock.symbol]["#{s_a.new_rate+s_b.new_rate}"]["#{s_a.stock.symbol} #{s_b.stock.symbol}"] = "#{s_a.price} #{s_b.price}"
          end

          index2 += 1
        end
      end
    end
  end

  def index
    @grid = PortfoliosGrid.new(grid_params) do |scope|
      scope.where(:user_id => current_user.id).page(params[:page])
    end
  end

  # GET /portfolios/1
  # GET /portfolios/1.json
  def show
    @grid = HoldingsGrid.new(holdings_grid_params) do |scope|
      scope.where(portfolio_id: @portfolio.id).page(params[:page])
    end
    @sector_counts = @portfolio.sector_list
    @industry_counts = @portfolio.industry_list
  end

  # GET /portfolios/new
  def new
    @portfolio = Portfolio.new
    @portfolio.user = current_user
  end

  # GET /portfolios/1/edit
  def edit
  end

  # POST /portfolios
  # POST /portfolios.json
  def create
    @portfolio = Portfolio.new(portfolio_params)

    respond_to do |format|
      if @portfolio.save
        format.html { redirect_to @portfolio, notice: 'Portfolio was successfully created.' }
        format.json { render :show, status: :created, location: @portfolio }
      else
        format.html { render :new }
        format.json { render json: @portfolio.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /portfolios/1
  # PATCH/PUT /portfolios/1.json
  def update
    respond_to do |format|
      if @portfolio.update(portfolio_params)
        format.html { redirect_to @portfolio, notice: 'Portfolio was successfully updated.' }
        format.json { render :show, status: :ok, location: @portfolio }
      else
        format.html { render :edit }
        format.json { render json: @portfolio.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /portfolios/1
  # DELETE /portfolios/1.json
  def destroy
    @portfolio.destroy
    respond_to do |format|
      format.html { redirect_to portfolios_url, notice: 'Portfolio was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  protected

  def grid_params
    params.fetch(:portfolios_grid, {}).permit!
  end

  def holdings_grid_params
    params.fetch(:holdings_grid, {}).permit!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_portfolio
      @portfolio = Portfolio.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def portfolio_params
      params.require(:portfolio).permit(:name, :user_id, :descripion, :start_date)
    end
end
