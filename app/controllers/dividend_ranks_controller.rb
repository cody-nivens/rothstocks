class DividendRanksController < ApplicationController
  before_action :authenticate_user!, :except => [:show, :index]
  before_action :set_dividend_rank, only: [:show, :edit, :update, :destroy]

  # GET /dividend_ranks
  # GET /dividend_ranks.json
  def index
    @dividend_ranks = DividendRank.all
  end

  # GET /dividend_ranks/1
  # GET /dividend_ranks/1.json
  def show
  end

  # GET /dividend_ranks/new
  def new
    @dividend_rank = DividendRank.new
  end

  # GET /dividend_ranks/1/edit
  def edit
  end

  # POST /dividend_ranks
  # POST /dividend_ranks.json
  def create
    @dividend_rank = DividendRank.new(dividend_rank_params)

    respond_to do |format|
      if @dividend_rank.save
        format.html { redirect_to @dividend_rank, notice: 'Dividend rank was successfully created.' }
        format.json { render :show, status: :created, location: @dividend_rank }
      else
        format.html { render :new }
        format.json { render json: @dividend_rank.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dividend_ranks/1
  # PATCH/PUT /dividend_ranks/1.json
  def update
    respond_to do |format|
      if @dividend_rank.update(dividend_rank_params)
        format.html { redirect_to @dividend_rank, notice: 'Dividend rank was successfully updated.' }
        format.json { render :show, status: :ok, location: @dividend_rank }
      else
        format.html { render :edit }
        format.json { render json: @dividend_rank.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dividend_ranks/1
  # DELETE /dividend_ranks/1.json
  def destroy
    @dividend_rank.destroy
    respond_to do |format|
      format.html { redirect_to dividend_ranks_url, notice: 'Dividend rank was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dividend_rank
      @dividend_rank = DividendRank.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dividend_rank_params
      params.require(:dividend_rank).permit(:stock_id, :date, :ccc_seq, :price, :yield_years, :div_yield, :old_rate, :new_rate, :mr_inc, :ex_div, :div_record, :div_pay, :qtly_sched, :annual_div, :payout, :i_graham, :p_e, :fye_month, :ttm_eps, :peg_ratio, :ttm_p_sales, :mrq_p_book, :ttm_roe, :ty_growth, :ny_growth, :last_5_growth, :est_5_growth, :na, :mktcap, :inside_own, :debt_equity, :chowder_rule)
    end
end
