class UtilsController < ApplicationController
  before_action :authenticate_user!
  
  def zipcode
    render json: ViaCep::Address.new(params['zipcode'])
  end
end
