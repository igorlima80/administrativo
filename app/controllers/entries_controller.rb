class EntriesController < ApplicationController
  load_and_authorize_resource :unit
  load_and_authorize_resource :entry, through: :unit, shallow: true

  # GET /entries
  def index
    @include_tree = [
      ['Sim', "#{@unit.id},true"],
      ['Não', "#{@unit.id},false"]
    ]
    params[:q] = {} unless params[:q]
    params[:q]['moment_gteq'] = Time.zone.now.beginning_of_month unless params[:q]['moment_gteq']
    params[:q]['moment_lteq'] = Time.zone.now.end_of_month unless params[:q]['moment_lteq']
    params[:q]['unit_tree'] = "#{@unit.id},true" unless params[:q]['unit_tree']
    @q = Entry.ransack(params[:q])
    pre = { 'moment_lteq': params[:q]['moment_gteq'], 'unit_tree': params[:q]['unit_tree'] }
    @entries = @q.result.order(moment: :asc)
    @previous_in  = Entry.ransack(pre).result.where(kind: 'in').sum(:value_cents)
    @previous_out = Entry.ransack(pre).result.where(kind: ['out', 'out_lot']).sum(:value_cents)
    @previous_value = @previous_in - @previous_out
    @total_in = @entries.where(kind: 'in').sum(:value_cents)
    @total_out = @entries.where(kind: 'out').sum(:value_cents)
    @entries = @entries.page(params[:page])
  end

  # GET /entries/1
  def show
  end

  # GET /entries/new
  def new
    if params[:kind].present?
      @entry = @unit.entries.build
      @entry.moment = Time.zone.now
      @entry.kind = params[:kind]
    else
      flash[:error] = 'Tipo de lançamento não informado'
      redirect_to unit_entries_path(@unit)
    end
  end

  def in
    @entry = @unit.entries.build
    @entry.moment = Time.zone.now
    @entry.kind = 'in'
  end

  def out
    @entry = @unit.entries.build
    @entry.moment = Time.zone.now
    @entry.kind = 'out'
  end

  # GET /entries/1/edit
  def edit
  end

  # POST /entries
  def create
    @entry = @unit.entries.build(entry_params)
    @entry.user = current_user

    if @entry.save
      if @entry.kind == 'out_lot'
        redirect_to unit_lots_path(@unit), notice: 'Estoque consumido com sucesso.'
      else
        redirect_to unit_entries_path(@unit), notice: 'Lançamento cadastrado com sucesso.'
      end
    else
      flash[:error] = 'Não foi possível cadastrar o lançamento'
      render :new
    end
  end

  # PATCH/PUT /entries/1
  def update
    if @entry.update(entry_params)
      redirect_to unit_entries_path(@entry.unit), notice: 'Lançamento atualizado com sucesso.'
    else
      flash[:error] = 'Não foi possível atualizar o lançamento'
      render :edit
    end
  end

  # DELETE /entries/1
  def destroy
    u = @entry.unit
    @entry.destroy
    redirect_to unit_entries_url(u), notice: 'Lançamento apagado com sucesso.'
  end

  private
    # Only allow a trusted parameter "white list" through.
    def entry_params
      params.require(:entry).permit(:unit_id, :value, :description, :kind, :moment,
        :entry_description_id,
        components_attributes: [
          :id, :_destroy, :quantity, :lot_id, :product_id, :category_id
        ]
      )
    end
end
