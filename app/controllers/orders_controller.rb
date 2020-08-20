class OrdersController < ApplicationController
  load_and_authorize_resource

  # GET /orders
  def index
    params[:q] = {} unless params[:q]
    params[:q]['moment_gteq'] = Time.zone.now.beginning_of_month unless params[:q]['moment_gteq']
    params[:q]['moment_lteq'] = Time.zone.now.end_of_month unless params[:q]['moment_lteq']
    @q = Order.ransack(params[:q])
    @orders = @q.result(distinct: true)
    @orders = @orders.page(params[:page])
  end

  # GET /orders/1
  def show
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "pedido_#{@order.id}"
      end
    end
  end

  # GET /orders/new
  def new
    @order.moment = Time.zone.now
  end

  def pay
    lot = @order.lot
    lot.status = 'paid'
    lot.save
    redirect_to orders_url
  end

  def in
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  def create
    @order = Order.new(order_params)
    @order.user = current_user

    if @order.save
      redirect_to @order, notice: 'Pedido cadastrado com sucesso.'
    else
      render :new
    end
  end

  # PATCH/PUT /orders/1
  def update
    if @order.update(order_params)
      if params['order']['process_lot'] == 'true'
        lot = @order.lot
        lot.status = 'processed'
        lot.save
      end
      redirect_to orders_path, notice: 'Pedido Alterado com sucesso.'
    else
      flash[:error] = 'Não foi possível atualizar o pedido'
      render :edit
    end
  end

  # DELETE /orders/1
  def destroy
    @order.destroy
    redirect_to orders_url, notice: 'Pedido apagado com sucesso.'
  end

  private
    # Only allow a trusted parameter "white list" through.
    def order_params
      params.require(:order).permit(:moment, :provider_id, :user_id, :unit_id,
        components_attributes: [
          :id, :_destroy, :category_id, :product_id, :solicited_quantity,
          :unit_value, :kind, :quantity
        ]
      )
    end
end
