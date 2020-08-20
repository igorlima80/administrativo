class ContractsController < ApplicationController
  load_and_authorize_resource :unit
  load_and_authorize_resource :contract, through: :unit, shallow: true

  # GET /contracts
  def index
    @include_tree = [
      ['Sim', "#{@unit.id},true"],
      ['Não', "#{@unit.id},false"]
    ]
    params[:q] = {} unless params[:q]
    params[:q]['moment_gteq'] = Time.zone.now.beginning_of_month unless params[:q]['moment_gteq']
    params[:q]['moment_lteq'] = Time.zone.now.end_of_month unless params[:q]['moment_lteq']
    params[:q]['unit_tree'] = "#{@unit.id},true" unless params[:q]['unit_tree']
    @q = Contract.ransack(params[:q])
    @contracts = @q.result
    @contracts = @contracts.page(params[:page])
  end

  # GET /contracts/1
  def show
  end

  # GET /contracts/new
  def new
    @contract.moment = Time.zone.now
  end

  # GET /contracts/1/edit
  def edit
  end

  # POST /contracts
  def create
    @contract = @unit.contracts.build(contract_params)
    @contract.user = current_user

    if @contract.save
      redirect_to unit_contracts_path(@unit), notice: 'Serviço cadastrado com sucesso.'
    else
      render :new
    end
  end

  # PATCH/PUT /contracts/1
  def update
    if @contract.update(contract_params)
      redirect_to unit_contracts_path(@unit), notice: 'Serviço atualizado com sucesso.'
    else
      render :edit
    end
  end

  # DELETE /contracts/1
  def destroy
    u = @contract.unit
    @contract.destroy
    redirect_to unit_contracts_url(u), notice: 'Serviço apagado com sucesso.'
  end

  private
    # Only allow a trusted parameter "white list" through.
    def contract_params
      params.require(:contract).permit(:moment, :provider_id, :user_id, :unit_id, :task_id, :value)
    end
end
