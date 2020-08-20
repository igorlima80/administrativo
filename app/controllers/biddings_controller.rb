class BiddingsController < ApplicationController
  load_and_authorize_resource

  # GET /biddings
  def index
  end

  # GET /biddings/1
  def show
  end

  # GET /biddings/new
  def new
  end

  # GET /biddings/1/edit
  def edit
  end

  # POST /biddings
  def create
    @bidding = Bidding.new(bidding_params)
    @bidding.user = current_user

    if @bidding.save
      redirect_to @bidding, notice: 'Bidding was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /biddings/1
  def update
    if @bidding.update(bidding_params)
      redirect_to @bidding, notice: 'Bidding was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /biddings/1
  def destroy
    @bidding.destroy
    redirect_to biddings_url, notice: 'Bidding was successfully destroyed.'
  end

  private
    # Only allow a trusted parameter "white list" through.
    def bidding_params
      params.require(:bidding).permit(:name, :description, :user_id,
        bidding_items_attributes: [
          :id, :_destroy, :product_id, :task_id
        ]
      )
    end
end
