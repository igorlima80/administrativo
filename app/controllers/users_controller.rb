class UsersController < ApplicationController
  load_and_authorize_resource

  # GET /users
  def index
  end

  # GET /users/1
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  def add_role
    unless params[:user][:new_role_unit].blank?
      @user.add_role params[:user]['new_role_title'], Unit.find(params[:user][:new_role_unit])
    else
      @user.add_role params[:user]['new_role_title']
    end
    flash[:success] = 'Permissão adicionada com sucesso'
    redirect_to @user
  end

  def remove_role
    unit = nil
    unit = Unit.find(params[:unit_id]) unless params[:unit_id].blank?
    if @user.has_role? params[:role], unit
      @user.remove_role params[:role], unit
      flash[:notice] = 'Permissão removida com sucesso'
    else
      flash[:error] = 'Permissão não encontrada no usuário'
    end
    redirect_to @user
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to @user, notice: 'User was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
    redirect_to users_url, notice: 'User was successfully destroyed.'
  end

  private
    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:email, :name, :username, :password)
    end
end
