class ResponsabilitiesController < ApplicationController
  load_and_authorize_resource

  # POST /responsabilities
  def create
    @responsability = Responsability.new(responsability_params)
    @user = @responsability.user

    if @responsability.save
      redirect_to @user, notice: 'Permissão adicionada com sucesso'
    else
      flash[:error] = @responsability.errors.full_messages
      render 'users/show'
    end
  end

  # DELETE /responsabilities/1
  def destroy
    u = @responsability.user
    @responsability.destroy
    redirect_to u, notice: 'Permissão apagada com sucesso.'
  end

  private
    # Only allow a trusted parameter "white list" through.
    def responsability_params
      params.require(:responsability).permit(
        :profile_id, :unit_id, :user_id
      )
    end
end
