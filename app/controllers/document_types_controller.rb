class DocumentTypesController < ApplicationController
  load_and_authorize_resource

  # GET /document_types
  def index
  end

  # GET /document_types/1
  def show
  end

  # GET /document_types/new
  def new
  end

  # GET /document_types/1/edit
  def edit
  end

  # POST /document_types
  def create
    @document_type = DocumentType.new(document_type_params)

    if @document_type.save
      redirect_to @document_type, notice: 'Document type was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /document_types/1
  def update
    if @document_type.update(document_type_params)
      redirect_to @document_type, notice: 'Document type was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /document_types/1
  def destroy
    @document_type.destroy
    redirect_to document_types_url, notice: 'Document type was successfully destroyed.'
  end

  private
    # Only allow a trusted parameter "white list" through.
    def document_type_params
      params.require(:document_type).permit(:name, :code)
    end
end
