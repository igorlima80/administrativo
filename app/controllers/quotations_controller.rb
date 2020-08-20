class QuotationsController < ApplicationController
  load_and_authorize_resource :bidding
  load_and_authorize_resource :quotation, through: :bidding, shallow: true

  # GET /quotations
  def index
    @q = Quotation.ransack(params[:q])
    @quotations = @q.result(distinct: true)
    @quotations = @quotations.page(params[:page])
  end

  # GET /quotations/1
  def show
  end

  # GET /quotations/new
  def new
    @quotation.register = Time.zone.now
    @bidding.bidding_items.each do |bi|
      @quotation.prices.build(
        product: bi.product,
        task: bi.task
      )
    end
  end

  # GET /quotations/1/edit
  def edit
  end

  # POST /quotations
  def create
    @quotation = @bidding.quotations.new(quotation_params)
    @quotation.user = current_user

    if @quotation.save
      redirect_to @quotation, notice: 'Quotation was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /quotations/1
  def update
    if @quotation.update(quotation_params)
      redirect_to @quotation, notice: 'Quotation was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /quotations/1
  def destroy
    @quotation.destroy
    redirect_to quotations_url, notice: 'Quotation was successfully destroyed.'
  end

  private
    # Only allow a trusted parameter "white list" through.
    def quotation_params
      params.require(:quotation).permit(
        :register, :provider_id, :shipping, :term, :bidding_id,
        prices_attributes: [
          :id, :_destroy, :product_id, :task_id, :value
        ]
      )
    end
end
