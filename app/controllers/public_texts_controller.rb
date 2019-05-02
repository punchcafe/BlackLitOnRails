class PublicTextsController < ApplicationController
  before_action :set_public_text, only: [:edit, :update]

  def index
    @public_texts = PublicText.all
  end

  def edit
  end

  def update
    @public_text.update_attribute(:body, public_text_params[:body])
    redirect_to admin_public_texts_path
  end

  def set_public_text
    @public_text = PublicText.find(params[:id])
  end

  private

  def public_text_params
    params.require(:public_text).permit(:body)
  end

end
