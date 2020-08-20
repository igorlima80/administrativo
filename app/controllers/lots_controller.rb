class LotsController < ApplicationController
  load_and_authorize_resource :unit
  load_and_authorize_resource :lot, through: :unit, shallow: true

  # GET /lots
  def index
    params[:q] = JSON.parse(params[:q]) if params[:format] == 'pdf'
    @include_tree = [
      ['Sim', "#{@unit.id},true"],
      ['Não', "#{@unit.id},false"]
    ]
    params[:q] = {} unless params[:q]
    params[:q]['lot_moment_gteq'] = Time.zone.now.beginning_of_month unless params[:q]['lot_moment_gteq']
    params[:q]['lot_moment_lteq'] = Time.zone.now.end_of_month unless params[:q]['lot_moment_lteq']
    params[:q]['unit_tree'] = "#{@unit.id},true" unless params[:q]['unit_tree']
    @q = Component.ransack(params[:q])
    @components = @q.result.includes(:lot)
    @lots = Lot.where(id: [@components.pluck(:lot_id)])
    @products = Product.joins(:lots).where(lots: { id: @components.pluck(:lot_id) }).order(:name).uniq
    respond_to do |format|
      format.html do
        @components = @components.page(params[:page])
      end
      format.pdf do
        render pdf: "relatorio_produtos_unidade#{@unit.name}"
      end
    end
  end

  # GET /lots/1
  def show
  end

  # GET /lots/new
  def new
    @products = []
    @lot.moment = Time.zone.now
  end

  # GET /lots/out
  def out
    @lot = @unit.lots.build
    @lot.moment = Time.zone.now
    @lot.kind = 'out'
  end

  # GET /lots/1/edit
  def edit
  end

  # POST /lots
  def create
    @lot = @unit.lots.build(lot_params)
    @lot.user = current_user

    if @lot.save
      redirect_to unit_lots_path(@unit), notice: 'Estoque cadastrado com sucesso.'
    else
      flash[:error] = 'Não foi possível cadastrar o estoque'
      render :new
    end
  end

  # PATCH/PUT /lots/1
  def update
    if @lot.update(lot_params)
      redirect_to unit_lots_path(@lot.unit), notice: 'Estoque atualizado com sucesso.'
    else
      flash[:error] = 'Não foi possível atualizar o estoque'
      render :edit
    end
  end

  # DELETE /lots/1
  def destroy
    u = @lot.unit
    @lot.destroy
    redirect_to unit_lots_url(u), notice: 'Estoque apagado com sucesso.'
  end

  private
    # Only allow a trusted parameter "white list" through.
    def lot_params
      params.require(:lot).permit(:unit_id, :moment, :kind,
        components_attributes: [
          :id, :_destroy, :category_id, :product_id, :component_id, :quantity,
          :unit_value, :kind
        ]
      )
    end
end
