class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :set_configurations
  before_action :set_paper_trail_whodunnit

  rescue_from CanCan::AccessDenied do |exception|
    flash[:danger] = 'Você não está autorizado a fazer essa ação!'
    Rails.logger.debug "Access denied on #{exception.action} #{exception.subject.inspect}"
    respond_to do |format|
      format.json { head :forbidden, content_type: 'text/html' }
      format.html { redirect_to main_app.root_url }
      format.js   { head :forbidden, content_type: 'text/html' }
    end
  end

  private
  def set_configurations
    unless params[:format] == 'pdf'
      @app_name = "SGC"
      @app_description = "Sistema de Gestão Cha'leville"
      @menu = MenuItem.published
      @colors = ['red', 'yellow', 'green']

      params[:q] = {} unless params[:q]
      params[:q][:s] = 'name asc' unless params[:q][:s]

      if ['entries', 'lots', 'contracts'].include?(controller_name)
        id = params[:id].to_s if controller_name == 'units'
        if ['entries', 'lots', 'contracts'].include?(controller_name)
          if params[:unit_id]
            id = params[:unit_id].to_s
          elsif controller_name == 'lots'
            id = Lot.find(params[:id]).unit.id.to_s
          elsif controller_name == 'contracts'
            id = Contract.find(params[:id]).unit.id.to_s
          else
            id = Entry.find(params[:id]).unit.id.to_s
          end
        end
        if current_user
          # @tree = Unit.find(1).subtree.arrange_serializable(order: :name) do |parent, children|
          #   {
          #     text: parent.name,
          #     nodes: children.size > 0 ? children : nil,
          #     href: (parent.id == 1 || can?(:in, parent.entries.build) || can?(:out, parent.entries.build)) ? eval("#{controller_name == 'units' ? '' : 'unit_'}#{controller_name}_url(parent)") : nil,
          #     state: {
          #       selected: id == parent.id.to_s,
          #       expanded: parent.descendant_ids.include?(id&.to_i)
          #     }
          #   }
          @tree = Unit.find(1).subtree.arrange_serializable(order: :name) do |parent, children|
            {
              id: parent.id,
              text: parent.name,
              children: children.size > 0 ? children : nil,
              a_attr: {
                href: (parent.id == 1 || can?(:in, parent.entries.build) || can?(:out, parent.entries.build)) ? eval("#{controller_name == 'units' ? '' : 'unit_'}#{controller_name}_url(parent)") : nil,
              },
              icon: false,
              state: {
                selected: id == parent.id.to_s,
                opened: parent.descendant_ids.include?(id&.to_i)
              }
            }
          end
        end
      end
    end
  end
end
