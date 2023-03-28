class KudosController < ApplicationController
  before_action :authenticate_employee!

  def index
    @kudos = Kudo.all
  end

  def new
    @kudo = Kudo.new
  end

  def create
    @kudo = Kudo.new(kudo_params)
    if @kudo.save
      flash[:notice] = 'Kudo has been successfully created'
      redirect_to kudos_path
    else
      @kudo.errors.full_messages
      render 'new'
    end
  end

  private

  def kudo_params
    params.require(:kudo).permit(:title, :content, :giver_id, :receiver_id)
  end
end
