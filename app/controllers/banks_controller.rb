class BanksController < ApplicationController
  load_and_authorize_resource

  # GET /banks
  def index
    @q = Bank.ransack(params[:q])
    @banks = @q.result(distinct: true)
    @banks = @banks.page(params[:page])
  end

  # GET /banks/1
  def show
  end

  # GET /banks/new
  def new
  end

  # GET /banks/1/edit
  def edit
  end

  # POST /banks
  def create
    @bank = Bank.new(bank_params)

    if @bank.save
      redirect_to @bank, notice: 'Bank was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /banks/1
  def update
    if @bank.update(bank_params)
      redirect_to @bank, notice: 'Bank was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /banks/1
  def destroy
    @bank.destroy
    redirect_to banks_url, notice: 'Bank was successfully destroyed.'
  end

  private
    # Only allow a trusted parameter "white list" through.
    def bank_params
      params.require(:bank).permit(:name, :code)
    end
end
