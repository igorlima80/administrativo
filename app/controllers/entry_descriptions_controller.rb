class EntryDescriptionsController < ApplicationController
  load_and_authorize_resource

  # POST /entries
  def create
    @entry_description = EntryDescription.new(entry_description_params)

    if @entry_description.save
      render json: @entry_description, status: :created
    else
      render json: @entry_description.errors, status: :unprocessable_entity
    end
  end

  private
    # Only allow a trusted parameter "white list" through.
    def entry_description_params
      params.require(:entry_description).permit(:name)
    end
end
