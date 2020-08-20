class ProvidersController < ApplicationController
  load_and_authorize_resource

  # GET /providers
  def index
    @q = Provider.ransack(params[:q])
    @roviders = @q.result(distinct: true)
    @roviders = @roviders.page(params[:page])
  end

  # GET /providers/1
  def show
  end

  # GET /providers/new
  def new
  end

  # GET /providers/1/edit
  def edit
  end

  # POST /providers
  def create
    @provider = Provider.new(provider_params)

    respond_to do |format|
      if @provider.save
        format.html { redirect_to @provider, notice: 'Fornecedor cadastrado com sucesso.' }
        format.json { render json: @provider, status: :created, location: @provider }
      else
        format.html { render :new }
        format.json { render json: @provider.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /providers/1
  def update
    if @provider.update(provider_params)
      redirect_to @provider, notice: 'Provider was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /providers/1
  def destroy
    @provider.destroy
    redirect_to providers_url, notice: 'Provider was successfully destroyed.'
  end

  private
    # Only allow a trusted parameter "white list" through.
    def provider_params
      params.require(:provider).permit(
        :name, :nickname, :cpf, :cnpj, :email, :register, :principal_seller,
        product_ids: [], task_ids: [],
        documents_attributes: [
          :id, :_destroy, :document_type_id, :number, :emission, :department, :state_id
        ],
        accounts_attributes: [
          :id, :_destroy, :bank_id, :bank_account_type_id, :agency, :number, :operation
        ],
        phones_attributes: [
          :id, :_destroy, :phone_type_id, :number
        ],
        addresses_attributes: [
          :id, :_destroy, :description, :zipcode, :street, :number, :complement, :district,
          :city_id
        ]
      )
    end
end
