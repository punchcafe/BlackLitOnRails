class PublicTextsController < ApplicationController
  before_action :set_current_admin
  before_action :boot_anonymous
  before_action :set_public_text, only: [:edit, :update]
  before_action :set_section_to_public_texts


  def index
    @public_texts = PublicText.all
  end

  def edit
  end

  def update
    @public_text.update_attribute(:body, public_text_params[:body])
    redirect_to admin_public_texts_path
  end


  private

  def set_public_text
    @public_text = PublicText.find(params[:id])
  end

  def public_text_params
    params.require(:public_text).permit(:body)
  end

  def set_section_to_public_texts
    @section = "public_texts"
  end

  def set_current_admin
    @current_admin = current_admin
  end

end
