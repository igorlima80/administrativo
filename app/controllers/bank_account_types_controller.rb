class BankAccountTypesController < ApplicationController
  load_and_authorize_resource

  # GET /bank_account_types
  def index
  end

  # GET /bank_account_types/1
  def show
  end

  # GET /bank_account_types/new
  def new
  end

  # GET /bank_account_types/1/edit
  def edit
  end

  # POST /bank_account_types
  def create
    @bank_account_type = BankAccountType.new(bank_account_type_params)

    if @bank_account_type.save
      redirect_to @bank_account_type, notice: 'Bank account type was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /bank_account_types/1
  def update
    if @bank_account_type.update(bank_account_type_params)
      redirect_to @bank_account_type, notice: 'Bank account type was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /bank_account_types/1
  def destroy
    @bank_account_type.destroy
    redirect_to bank_account_types_url, notice: 'Bank account type was successfully destroyed.'
  end

  private
    # Only allow a trusted parameter "white list" through.
    def bank_account_type_params
      params.require(:bank_account_type).permit(:code, :name)
    end
end
