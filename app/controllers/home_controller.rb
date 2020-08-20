class HomeController < ApplicationController
  def index
    if can? :manage, Unit.find(params[:unit_id] || 1).entries.build or
      can? :out, Unit.find(params[:unit_id] || 1).entries.build
      redirect_to unit_entries_path(unit_id: 1)
    elsif can? :manage, Unit.find(params[:unit_id] || 1).lots.build
      redirect_to unit_lots_path(unit_id: 1)
    elsif can? :manage, Order
      redirect_to orders_path
    elsif can? :manage, Unit.find(params[:unit_id] || 1).contracts.build
      redirect_to unit_contracts_path(unit_id: 1)
    elsif can? :manage, Product
      redirect_to products_path
    elsif can? :manage, Category
      redirect_to categories_path
    elsif can? :manage, Task
      redirect_to tasks_path
    elsif can? :manage, Provider
      redirect_to providers_path
    elsif can? :manage, Bidding
      redirect_to biddings_path
    elsif can? :manage, Unit.find(params[:unit_id] || 1)
      redirect_to units_path
    else
      flash[:error] =  'Você não possui permissões de acesso'
    end
  end
end
