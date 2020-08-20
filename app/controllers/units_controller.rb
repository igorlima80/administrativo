class UnitsController < ApplicationController
  load_and_authorize_resource

  # GET /units
  def index
    @q = Unit.ransack(params[:q])
    @units = @q.result(distinct: true)
    @units = @units.page(params[:page])
  end

  # GET /units/1
  def show
  end

  # GET /units/new
  def new
    @unit = Unit.new
    @unit.parent_id = params[:parent_id] if params[:parent_id]
  end

  # GET /units/1/edit
  def edit
  end

  # POST /units
  def create
    @unit = Unit.new(unit_params)

    if @unit.save
      redirect_to @unit, notice: t("helpers.links.save_success_f", model: Unit.model_name.human)
    else
      render :new
    end
  end

  # PATCH/PUT /units/1
  def update
    if @unit.update(unit_params)
      redirect_to @unit, notice: t("helpers.links.save_success_f", model: Unit.model_name.human)
    else
      render :edit
    end
  end

  # DELETE /units/1
  def destroy
    @unit.destroy
    redirect_to units_url, notice: t("helpers.links.destroyed_f", model: Unit.model_name.human)
  end

  private
    # Only allow a trusted parameter "white list" through.
    def unit_params
      params.require(:unit).permit(:name, :description, :parent_id, :warehouse)
    end
end
